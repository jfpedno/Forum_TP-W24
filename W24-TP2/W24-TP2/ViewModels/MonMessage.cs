using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using W24_TP2.Models;

namespace W24_TP2.ViewModels
{
    public class MonMessage
    {
        [Key, Column(Order = 0)]

        public int MsgId { get; set; }
        public string? UserName { get; set; }
        public DateTime MsgDate { get; set; }
        public string? MsgTexte { get; set; }
        public bool MsgActif { get; set; }
        public int SujetId { get; set; }
        public string? UserId { get; set; }
    }
}