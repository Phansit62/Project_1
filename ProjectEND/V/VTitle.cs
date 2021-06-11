using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectEND.Models
{
    public class VTitle
    {
        [Display(Name ="รหัสคำนำหน้าชื่อ")]
        public int Title_id { get; set; }
        [Display(Name = "คำนำหน้าชื่อ")]
        public string Title_name { get; set; }
    }
    [MetadataType(typeof(VTitle))]
    public partial class Title { }
}