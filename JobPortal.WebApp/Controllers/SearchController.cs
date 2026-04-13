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
    }
}