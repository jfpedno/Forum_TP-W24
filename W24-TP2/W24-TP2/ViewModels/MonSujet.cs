using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using W24_TP2.Models;

namespace W24_TP2.ViewModels
{
    public class MonSujet
    {
        [Key, Column(Order = 0)]
        public string? CatNom { get; set; }
        public int CatId { get; set; }
        public string? UserName { get; set; }
        public string? UserId { get; set; }//fk
        public int SujetId { get; set; }
        public string SujetTexte { get; set; }
        public DateTime SujetDate { get; set; }
        public bool SujetActif { get; set; }
        public int? SujetView { get; set; }
        public int? NbrMessages { get; set; }
        public DateTime? DerniereRep { get; set; }
        public string? DernierUsager { get; set; }
        public virtual AspNetUser? User { get; set; }//relation
    }
}