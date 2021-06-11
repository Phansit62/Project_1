using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectEND.Models
{
    public class VPayment
    {
        [Display(Name ="รหัสชำระเงิน")]
        public int Payment_Id { get; set; }
        [Display(Name = "รหัสการจอง")]
        public Nullable<int> PaymentOrder_Id { get; set; }
        [Display(Name = "วันที่ชำระเงิน")]
        public Nullable<System.DateTime> Payment_Date { get; set; }
        [Display(Name = "หลักฐานการชำระเงิน")]
        public byte[] Payment_Pic { get; set; }
        [Display(Name = "รหัสการชำระเงิน")]
        [Required]
        public Nullable<int> StaPay_ID { get; set; }
    }
    [MetadataType(typeof(VPayment))]
    public partial class Payment { }
}