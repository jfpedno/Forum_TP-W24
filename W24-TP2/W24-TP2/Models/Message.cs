using System;
using System.Collections.Generic;

namespace W24_TP2.Models
{
    public partial class Message
    {
        public int MsgId { get; set; }
        public int SujetId { get; set; }
        public string? UserId { get; set; }
        public bool MsgActif { get; set; }
        public string? MsgText { get; set; }
        public DateTime MsgDate { get; set; }
        public int? MsgView { get; set; }

        public virtual Sujet? Sujet { get; set; }
        public virtual AspNetUser? User { get; set; }
    }
}
