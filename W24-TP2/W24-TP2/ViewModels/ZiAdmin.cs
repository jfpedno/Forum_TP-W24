
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using W24_TP2.Models;

namespace W24_TP2.ViewModels
{
    public class ZiAdmin
    {
        [Key, Column(Order = 0)]
        public string UserName { get; set; }
        public object NbrSujets { get; set; }
        public int NbrMessages { get; set; }
        public DateTime? DerniereActivite { get; set; }
    }
}