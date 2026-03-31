using JobPortal.Data.DataContext;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;
using System.Text.Json;
using Microsoft.Extensions.Logging;

namespace JobPortal.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DataExportController : ControllerBase
    {
        private readonly DataDbContext _context;
        private readonly ILogger<DataExportController>? _logger;

        public DataExportController(DataDbContext context, ILogger<DataExportController>? logger = null)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
            _logger = logger;
        }

        [HttpGet]
        public async Task<IActionResult> ExportData()
        {
            try
            {
                var data = new
                {
                    AppUsers = await (_context.AppUsers?.Select(u => new
                    {
                        u.Id,
                        u.UserName,
                        u.Email,
                        u.PhoneNumber
                    }) ?? throw new InvalidOperationException("AppUsers DbSet is null"))
                    .ToListAsync(),
                    AppRoles = await (_context.AppRoles?.Select(r => new
                    {
                        r.Id,
                        r.Name,
                        r.Description
                    }) ?? throw new InvalidOperationException("AppRoles DbSet is null"))
                    .ToListAsync(),
                    Blogs = await (_context.Blogs?.Select(b => new
                    {
                        b.Id,
                        b.Title,
                        b.Content,
                        b.Author,
                        b.Description,
                        ImageUrl = b.Image // Assuming Image is stored as a URL/path
                    }) ?? throw new InvalidOperationException("Blogs DbSet is null"))
                    .ToListAsync(),
                    Categories = await (_context.Categories?.Select(c => new
                    {
                        c.Id,
                        c.Name,
                        c.Description
                    }) ?? throw new InvalidOperationException("Categories DbSet is null"))
                    .ToListAsync(),
                    CVs = await (_context.CVs?.Select(cv => new
                    {
                        cv.Id,
                        cv.AppUserId,
                        cv.Certificate,
                        cv.Major,
                        cv.GraduatedAt,
                        cv.GPA,
                        cv.Description,
                        cv.Introduce,
                        cv.Phone,
                        cv.Email,
                        UrlImage = cv.UrlImage // Assuming UrlImage is stored as a URL/path
                    }) ?? throw new InvalidOperationException("CVs DbSet is null"))
                    .ToListAsync(),
                    Jobs = await (_context.Jobs?.Include(j => j.Category).Include(j => j.Province).Include(j => j.Time).Include(j => j.Title)
                        .Select(j => new
                        {
                            j.Id,
                            j.Name,
                            j.Description,
                            j.Introduce,
                            j.ObjectTarget,
                            j.Experience,
                            j.MinSalary,
                            j.MaxSalary,
                            CategoryName = j.Category != null ? j.Category.Name : null,
                            ProvinceName = j.Province != null ? j.Province.Name : null,
                            TimeName = j.Time != null ? j.Time.Name : null,
                            TitleName = j.Title != null ? j.Title.Name : null,
                            SkillIds = j.Skills != null ? j.Skills.Select(s => s.Id).ToList() : new List<int>() // Fixed null-conditional operator
                        }) ?? throw new InvalidOperationException("Jobs DbSet is null"))
                        .ToListAsync(),
                    Provinces = await (_context.Provinces?.Select(p => new
                    {
                        p.Id,
                        p.Name
                    }) ?? throw new InvalidOperationException("Provinces DbSet is null"))
                    .ToListAsync(),
                    Skills = await (_context.Skills?.Select(s => new
                    {
                        s.Id,
                        s.Name,
                        LogoUrl = s.Logo // Assuming Logo is stored as a URL/path
                    }) ?? throw new InvalidOperationException("Skills DbSet is null"))
                    .ToListAsync(),
                    Times = await (_context.Times?.Select(t => new
                    {
                        t.Id,
                        t.Name
                    }) ?? throw new InvalidOperationException("Times DbSet is null"))
                    .ToListAsync(),
                    Titles = await (_context.Titles?.Select(t => new
                    {
                        t.Id,
                        t.Name
                    }) ?? throw new InvalidOperationException("Titles DbSet is null"))
                    .ToListAsync(),
                    Countries = await (_context.Countries?.Select(c => new
                    {
                        c.Id,
                        c.Name
                    }) ?? throw new InvalidOperationException("Countries DbSet is null"))
                    .ToListAsync()
                };

                if (!data.AppUsers.Any() && !data.AppRoles.Any() && !data.Blogs.Any() &&
                    !data.Categories.Any() && !data.CVs.Any() && !data.Jobs.Any() &&
                    !data.Provinces.Any() && !data.Skills.Any() && !data.Times.Any() &&
                    !data.Titles.Any() && !data.Countries.Any())
                {
                    _logger?.LogWarning("Database is empty.");
                    return BadRequest("No data available to export.");
                }

                var jsonOptions = new JsonSerializerOptions { WriteIndented = true };
                var json = JsonSerializer.Serialize(data, jsonOptions);
                if (string.IsNullOrEmpty(json))
                {
                    _logger?.LogError("Unable to serialize data to JSON.");
                    return StatusCode(500, "Error exporting data: Unable to serialize to JSON.");
                }

                Response.Headers.Add("Content-Disposition", "attachment; filename=job_portal_data.json");
                return Content(json, "application/json");
            }
            catch (Exception ex)
            {
                _logger?.LogError(ex, "Error exporting data: {Message}", ex.Message);
                return StatusCode(500, $"Error exporting data: {ex.Message}");
            }
        }
    }
}