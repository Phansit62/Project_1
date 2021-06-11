using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectEND.Models
{
    public class VStatusRoom
    {
        [Display(Name ="รหัสสถานะ")]
        public int StaRoom_Id { get; set; }
        [Display(Name = "สถานะ")]
        public string StaRoom_Type { get; set; }

    }
    [MetadataType(typeof(VStatusRoom))]
    public partial class StatusRoom { }
}