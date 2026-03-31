using JobPortal.Data.ViewModel;
using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;
using JobPortal.Data.DataContext;
using Microsoft.EntityFrameworkCore;

namespace JobPortal.WebApp.Controllers
{
    public class ChatController : Controller
    {
        private readonly DataDbContext _context;

        public ChatController(DataDbContext context)
        {
            _context = context;
        }

        // Lấy ID người dùng hiện tại từ Claims
        private int GetCurrentUserId()
        {
            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            return int.TryParse(userIdClaim, out int userId) ? userId : throw new UnauthorizedAccessException("Chưa đăng nhập.");
        }

        public async Task<IActionResult> Session(int toUserId)
        {
            int currentUserId = GetCurrentUserId();

            var session = await _context.ChatSessions
                .FirstOrDefaultAsync(s =>
                    (s.FromUserId == currentUserId && s.ToUserId == toUserId) ||
                    (s.FromUserId == toUserId && s.ToUserId == currentUserId));

            if (session == null)
            {
                session = new ChatSession
                {
                    FromUserId = currentUserId,
                    ToUserId = toUserId,
                    CreatedAt = DateTime.Now
                };
                _context.ChatSessions.Add(session);
                await _context.SaveChangesAsync();
            }

            var messages = await _context.Messages
                .Where(m => m.ChatSessionId == session.Id)
                .OrderBy(m => m.SentAt)
                .ToListAsync();

            ViewBag.SessionId = session.Id;
            ViewBag.CurrentUserId = currentUserId;
            ViewBag.ToUserId = toUserId;
            return View("ChatView", messages);  // ChatView.cshtml là view hiển thị tin nhắn
        }

        [HttpPost]
        public async Task<IActionResult> SendMessage(int chatSessionId, string content)
        {
            int currentUserId = GetCurrentUserId();

            var message = new Message
            {
                ChatSessionId = chatSessionId,
                SenderId = currentUserId,
                Content = content,
                SentAt = DateTime.Now
            };

            _context.Messages.Add(message);
            await _context.SaveChangesAsync();

            var session = await _context.ChatSessions.FindAsync(chatSessionId);
            int receiverId = (session.FromUserId == currentUserId) ? session.ToUserId : session.FromUserId;

            return RedirectToAction("Session", new { toUserId = receiverId });
        }
    }
}
