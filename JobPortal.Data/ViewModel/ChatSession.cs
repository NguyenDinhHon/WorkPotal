using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobPortal.Data.ViewModel
{
    public class ChatSession
    {
        public int Id { get; set; }
        public int FromUserId { get; set; }  // Người gửi đầu tiên
        public int ToUserId { get; set; }    // Người nhận
        public DateTime CreatedAt { get; set; }

        public List<Message> Messages { get; set; }
    }

}
