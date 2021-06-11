using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectEND.Models
{
    public class Up_paybill
    {
        [Display(Name = "รูปภาพ")]
        public HttpPostedFileBase Upfile { get; set; }
    }
}