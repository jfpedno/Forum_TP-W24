using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace W24_TP2.ViewModels
{
    public class HomeCat
    {
        [Key, Column(Order = 0)]
        public int CatId { get; set; }
        public string? CatNom { get; set; }
        public string? CatDescription { get; set; }
        public bool CatActif { get; set; }
        public int NbrSujets { get; set; }
    }
}