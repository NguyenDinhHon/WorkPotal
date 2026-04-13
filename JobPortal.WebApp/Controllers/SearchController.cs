using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using JobPortal.Data.DataContext;
using JobPortal.Data.Entities;
using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;

namespace JobPortal.WebApp.Controllers
{
    [Route("search")]
    public class SearchController : Controller
    {
        private readonly DataDbContext _context;

        public SearchController(DataDbContext context)
        {
            _context = context;
        }

        // Chuẩn hóa tiếng Việt: bỏ dấu, chuyển thường
        // Ví dụ: "Lập trình viên" -> "lap trinh vien"
        private static string NormalizeText(string input)
        {
            if (string.IsNullOrEmpty(input)) return string.Empty;
            var normalized = input.Normalize(NormalizationForm.FormD);
            var sb = new StringBuilder();
            foreach (char c in normalized)
            {
                if (CharUnicodeInfo.GetUnicodeCategory(c) != UnicodeCategory.NonSpacingMark)
                    sb.Append(c);
            }
            return sb.ToString().Normalize(NormalizationForm.FormC)
                .Replace('đ', 'd').Replace('Đ', 'D').ToLower();
        }

        private static string StripHtml(string html)
        {
            return Regex.Replace(html, "<.*?>", " ");
        }

        // Tính điểm liên quan: tên job (10đ), title/skill (5đ), mô tả/employer (2đ)
        private static int CalculateScore(Job job, string[] normalizedKeywords)
        {
            int score = 0;
            string jobName     = NormalizeText(job.Name);
            string jobTitle    = NormalizeText(job.Title?.Name ?? "");
            string jobSkills   = NormalizeText(string.Join(" ", job.Skills.Select(s => s.Name)));
            string jobIntro    = NormalizeText(StripHtml(job.Introduce ?? ""));
            string jobEmployer = NormalizeText(job.AppUser?.FullName ?? "");

            foreach (var keyword in normalizedKeywords)
            {
                if (string.IsNullOrEmpty(keyword)) continue;
                if (jobName.Contains(keyword))     score += 10;
                if (jobTitle.Contains(keyword))    score += 5;
                if (jobSkills.Contains(keyword))   score += 5;
                if (jobIntro.Contains(keyword))    score += 2;
                if (jobEmployer.Contains(keyword)) score += 2;
            }
            return score;
        }

        [Route("")]
        public async Task<IActionResult> Index(string q, int province, int skill)
        {
            var random = new Random();

            //For search filter area
            ViewBag.FilterProvinces = _context.Provinces.OrderBy(p => p.Id).ToList();
            ViewBag.FilterSkills = _context.Skills.OrderBy(s => s.Name).ToList();

            //random jobs - 6
            var jobList = _context.Jobs.Include(j => j.Province).ToList();
            ViewBag.ListJobs = jobList.OrderBy(j => random.Next()).Take(6).ToList();

            //random skills - 7
            var skillList = _context.Skills.Include(s => s.Jobs).ToList();
            ViewBag.ListSkills = skillList.OrderBy(s => random.Next()).Take(7).ToList();

            //provinces - 4
            ViewBag.ListProvinces = _context.Provinces.Include(p => p.Jobs).Where(p => p.Jobs.Count > 0).Take(4).ToList();

            //random blogs - 5
            var blogList = _context.Blogs.Include(b => b.AppUser).ToList();
            ViewBag.ListBlogs = blogList.OrderBy(s => random.Next()).Take(5).ToList();

            ViewBag.q = q;
            ViewBag.province = await _context.Provinces.FirstOrDefaultAsync(p => p.Id == province);
            ViewBag.skill = await _context.Skills.FirstOrDefaultAsync(s => s.Id == skill);

            //set selected values for dropdowns
            ViewBag.SelectedProvinceId = province;
            ViewBag.SelectedSkillId = skill;

            var jobs = await _context.Jobs
                .OrderByDescending(j => j.Id)
                .Include(j => j.AppUser)
                .Include(j => j.Title)
                .Include(j => j.Time)
                .Include(j => j.Skills)
                .Include(j => j.Province)
                .ToListAsync();

            if (!string.IsNullOrEmpty(q))
            {
                // Tách từ khóa theo khoảng trắng và chuẩn hóa tiếng Việt
                var keywords = q.Split(' ', StringSplitOptions.RemoveEmptyEntries)
                                .Select(NormalizeText)
                                .ToArray();

                // Lọc và sắp xếp theo độ liên quan
                jobs = jobs
                    .Select(job => new { Job = job, Score = CalculateScore(job, keywords) })
                    .Where(x => x.Score > 0)
                    .OrderByDescending(x => x.Score)
                    .Select(x => x.Job)
                    .ToList();
            }

            if (province != 0)
                jobs = jobs.Where(job => job.ProvinceId == province).ToList();

            if (skill != 0)
                jobs = jobs.Where(job => job.Skills.Any(s => s.Id == skill)).ToList();

            return View(jobs);
        }
    }
}