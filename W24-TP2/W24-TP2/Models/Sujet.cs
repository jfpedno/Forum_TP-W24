using System;
using System.Collections.Generic;

namespace W24_TP2.Models
{
    public partial class Sujet
    {
        public Sujet()
        {
            Messages = new HashSet<Message>();
        }

        public int SujetId { get; set; }
        public int CatId { get; set; }
        public string? UserId { get; set; }
        public string SujetTexte { get; set; } = null!;
        public DateTime SujetDate { get; set; }
        public int? SujetView { get; set; }
        public bool SujetActif { get; set; }

        public virtual Category? Cat { get; set; }
        public virtual AspNetUser? User { get; set; }
        public virtual ICollection<Message> Messages { get; set; }
    }
}
