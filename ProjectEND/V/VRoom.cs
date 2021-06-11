using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectEND.Models
{
    public class VRoom
    {

        [Display(Name ="รหัสห้องพัก")]
        public int Room_id { get; set; }
        [Display(Name = "รหัสหอพัก")]

        public Nullable<int> Doc_id { get; set; }
        [Display(Name = "รหัสสถานนะ")]
        public Nullable<int> StaRoom_ID { get; set; }
        [Display(Name = "เลขห้อง")]
        public Nullable<int> Room_num { get; set; }
    }
    [MetadataType(typeof(VRoom))]
    public partial class Room { }
}
