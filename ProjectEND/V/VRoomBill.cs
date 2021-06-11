using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectEND.Models
{
    public class VRoomBill
    {
        [Display(Name = "รหัสบิล")]
        public int RoomBill_Id { get; set; }
        [Display(Name = "ค่าน้ำ")]
        [Required]
        public Nullable<decimal> Water { get; set; }
        [Display(Name = "ค่าไฟ")]
        [Required]
        public Nullable<decimal> Ele { get; set; }
        [Display(Name = "รหัสสถานะ")]
        
        public Nullable<int> StaBill_id { get; set; }
        [Display(Name = "วันออกบิล")]
        public Nullable<System.DateTime> Bill_Date_Out { get; set; }
        [Display(Name = "รหัสออเดอร์")]
        public Nullable<int> Order_Id { get; set; }
        [Display(Name = "ค่าห้อง")]
        public Nullable<decimal> Room_Price { get; set; }
        [Display(Name = "รวม")]

        public Nullable<decimal> Total_Price { get; set; }
    }
    [MetadataType(typeof(VRoomBill))]
    public partial class RoomBill { }
}