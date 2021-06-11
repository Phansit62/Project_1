using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectEND.Models
{
    public class VStatusOrder
    {
        [Display(Name = "รหัสสถานะ")]
        public int Sta_Id { get; set; }
        [Display(Name = "สถานะ")]
        public string Sta_Name { get; set; }
    }
    [MetadataType(typeof(VStatusOrder))]
    public partial class StatusOrder { }
}