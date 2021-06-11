using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectEND.Models
{
    public class VPaymentBill:Up_paybill
    {
        [Display(Name = "รหัสชำระ")]
        public int PaymentBill_Id { get; set; }
        [Display(Name = "รหัสบิล")]
        public Nullable<int> PaymentRoomBill_id { get; set; }
        [Display(Name = "วันที่ชำระเงิน")]
        public Nullable<System.DateTime> PaymentBill_date { get; set; }
        [Display(Name = "รูป")]
        public byte[] PaymentPic { get; set; }
        [Display(Name = "รหัสสถานะ")]
        public Nullable<int> StaPayBill_id { get; set; }
    }
    [MetadataType(typeof(VPaymentBill))]
    public partial class PaymentRoomBill { }
}