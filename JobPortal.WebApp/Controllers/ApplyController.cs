using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using JobPortal.Data.DataContext;
using JobPortal.Data.Entities;
using Microsoft.AspNetCore.Authorization;
using JobPortal.Data.ViewModel;
using JobPortal.Common;

namespace JobPortal.WebApp.Controllers
{
    [Route("apply")]
    public class ApplyController : Controller
    {
        private readonly DataDbContext _context;

        public ApplyController(DataDbContext context)
        {
            _context = context;
        }

        [Route("{id}")]
        [HttpGet]
        [Authorize]
        public async Task<IActionResult> ListApplies(Guid id)
        {
            var CVs = await (from cv in _context.CVs
                             orderby cv.ApplyDate descending
                             select new CVsViewModel()
                             {
                                 CVId = cv.Id,
                                 Certificate = cv.Certificate,
                                 Major = cv.Major,
                                 ApplyDate = cv.ApplyDate,
                                 GraduatedAt = cv.GraduatedAt,
                                 GPA = cv.GPA,
                                 Description = cv.Description,
                                 Introduce = cv.Introduce,
                                 CVEmail = cv.Email,
                                 CVPhone = cv.Phone,
                                 CVImage = cv.UrlImage,
                                 UserId = cv.AppUserId,
                                 CVStatus = cv.Status,
                                 JobName = cv.Job.Name,
                                 UserName = cv.AppUser.FullName,
                                 EmployerLogo = cv.Job.AppUser.UrlAvatar,
                                 EmployerAddress = cv.EmployerAddress,
                                 EmployerCity = cv.City,
                                 EmployerComment = cv.Comment,
                                 EmployerEmail = cv.EmployerEmail,
                                 EmployerPhone = cv.EmployerPhone,
                                 EmployerRating = cv.EmployerRating,
                                 CommentOn = cv.CommentOn
                             }).Where(u => u.UserId == id).ToListAsync();
            return View(CVs);
        }

        [Route("{slug}/{id}")]
        public IActionResult Apply()
        {
            return View();
        }

        [Route("{slug}/{id}")]
        [HttpPost]
        [Authorize]
        public async Task<IActionResult> Apply(string slug, Guid id, CreateCVViewModel model)
        {
            // Tìm công việc theo slug
            var job = await _context.Jobs.Where(j => j.Slug == slug).FirstOrDefaultAsync();

            if (job == null)
            {
                // Nếu không tìm thấy công việc, trả về lỗi hoặc thông báo không tìm thấy công việc
                ModelState.AddModelError("", "Job not found.");
                return View(model);
            }

            if (ModelState.IsValid)
            {
                try
                {
                    // Đường dẫn lưu ảnh CV
                    string POST_IMAGE_PATH = "images/cvs/";

                    // Kiểm tra và tải ảnh lên
                    var image = UploadImage.UploadImageFile(model.UrlImage, POST_IMAGE_PATH);

                    // Tạo đối tượng CV mới
                    CV cv = new CV()
                    {
                        ApplyDate = DateTime.Now,
                        UrlImage = image,
                        Certificate = model.Certificate,
                        Major = model.Major,
                        GraduatedAt = model.GraduatedAt,
                        GPA = model.GPA,
                        Description = model.Description,
                        Introduce = model.Introduce,
                        Phone = model.Phone,
                        Email = model.Email,
                        AppUserId = id,  // Tham số id (AppUserId)
                        JobId = job.Id,  // Lấy JobId từ công việc đã tìm thấy
                        Status = 1 // Trạng thái "chờ" (waiting)
                    };

                    // Thêm CV vào cơ sở dữ liệu
                    _context.CVs.Add(cv);
                    await _context.SaveChangesAsync();

                    // Chuyển hướng tới trang ứng tuyển của người dùng
                    return Redirect("/apply/" + id);
                }
                catch (Exception ex)
                {
                    // Nếu có lỗi trong quá trình lưu, trả về thông báo lỗi
                    ModelState.AddModelError("", "An error occurred while processing your application: " + ex.Message);
                    return View(model);
                }
            }

            // Nếu ModelState không hợp lệ, trả về trang với lỗi
            return View(model);
        }


        [HttpGet("{id}/{CVid}/delete")]
        public IActionResult Delete(Guid id, int CVid)
        {
            try
            {
                CV cv = _context.CVs.Where(cv => cv.Id == CVid).First();
                string imageName = cv.UrlImage;
                _context.CVs.Remove(cv);
                _context.SaveChanges();
                if (!string.IsNullOrEmpty(imageName))
                {
                    string imagePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images", "cvs", imageName);
                    DeleteImage.DeleteImageFile(imagePath);
                }
                return Redirect("/apply/" + id);
            }
            catch (System.Exception)
            {
                return Redirect("/apply/" + id);
            }
        }

        [HttpGet("{id}/{CVid}/update/{status}")]
        public IActionResult UpdateCV(Guid id, int CVid, int status)
        {
            CV cv = _context.CVs.Where(cv => cv.Id == CVid).First(); 
            cv.Status = status;
            _context.CVs.Update(cv);
            _context.SaveChanges();
            return Redirect("/apply/" + id);
        }
    }
}