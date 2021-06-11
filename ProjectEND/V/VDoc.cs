using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectEND.Models
{
    public class VDoc
    {
        [Display(Name = "รหัสหอพัก")]
        public int Doc_id { get; set; }
        [Display(Name = "ชื่อหอพัก")]
        public string Doc_Name { get; set; }
    }
    [MetadataType(typeof(VDoc))]
    public partial class Dormitory { }
}