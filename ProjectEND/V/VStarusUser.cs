using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectEND.Models
{
    public class VStarusUser
    {
        [Display(Name = "รหัสสถานนะ")]
        public int Sta_User_id { get; set; }
        [Display(Name = "สถานนะ")]
        public string Sta_User_type { get; set; }
    }
    [MetadataType(typeof(VStarusUser))]
    public partial class StatusUser { }
}