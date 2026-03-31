using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobPortal.Data.ViewModel
{
    public class Message
    {
        public int Id { get; set; }
        public int ChatSessionId { get; set; }
        public int SenderId { get; set; }
        public string Content { get; set; }
        public DateTime SentAt { get; set; }

        public ChatSession ChatSession { get; set; }
    }

}
