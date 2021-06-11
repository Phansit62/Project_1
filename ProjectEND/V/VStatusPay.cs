using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectEND.Models
{
    public class VStatusPay
    {
        [Display(Name ="รหัสสถานะ")]

        public int StaPay_Id { get; set; }
        [Display(Name = "สถานะ")]
        public string StaPay_Name { get; set; }
    }
    [MetadataType(typeof(VStatusPay))]
    public partial class StatusPayment { }
}