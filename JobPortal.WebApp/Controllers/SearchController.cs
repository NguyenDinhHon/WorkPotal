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
    }
}