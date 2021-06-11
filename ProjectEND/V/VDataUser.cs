using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectEND.Models
{
    public class VDataUser:Up_pic
    {
        [Display(Name = "เลขบัตรประชาชน")]
        [Required]
        public string User_id { get; set; }
        [Display(Name ="รหัสคำหน้าชื่อ")]
        public Nullable<int> Title_id { get; set; }
        [Display(Name = "ชื่อจริง")]
        [Required]
        public string User_FristName { get; set; }
        [Display(Name = "นามสกุล")]
        [Required]
        public string User_LastName { get; set; }
        [Display(Name = "อีเมล์")]
        [DataType(DataType.EmailAddress)]
        [Required]
        public string User_Email { get; set; }
        [Display(Name = "เบอร์โทร")]
        [Required]
        public string User_Phone { get; set; }
        [Display(Name = "รูป")]
        public byte[] User_Image { get; set; }
        [Display(Name = "รหัสผ่าน")]
        [Required]
        public string Password { get; set; }
    }
    [MetadataType(typeof(VDataUser))]
    public partial class DataUser { }
}