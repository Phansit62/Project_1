using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectEND.Models
{
    public class VOrder
    {
        [Display(Name = "รหัสจอง")]
        public int Oder_Id { get; set; }
        [Display(Name = "รหัสผู้ใช้")]
        public string User_Id { get; set; }
        [Display(Name = "รหัสห้อง")]
        public Nullable<int> Room_Id { get; set; }
        [Display(Name = "วันที่จอง")]
        public Nullable<System.DateTime> Date_In { get; set; }
        [Display(Name = "รหัสสถานะ")]
        public Nullable<int> Sta_Id { get; set; }
    }
    [MetadataType(typeof(VOrder))]
    public partial class Order { }
}