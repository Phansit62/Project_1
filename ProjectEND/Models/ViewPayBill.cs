//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProjectEND.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ViewPayBill
    {
        public int PaymentBill_Id { get; set; }
        public int RoomBill_Id { get; set; }
        public int Oder_Id { get; set; }
        public int Title_id { get; set; }
        public string Title_name { get; set; }
        public string User_FristName { get; set; }
        public string User_LastName { get; set; }
        public string User_Phone { get; set; }
        public int Room_id { get; set; }
        public int Doc_id { get; set; }
        public string Doc_Name { get; set; }
        public Nullable<int> Water { get; set; }
        public Nullable<int> Ele { get; set; }
        public Nullable<int> Room_Price { get; set; }
        public Nullable<int> Total_Price { get; set; }
        public int StaPay_Id { get; set; }
        public string StaPay_Name { get; set; }
        public byte[] PaymentPic { get; set; }
        public Nullable<System.DateTime> PaymentBill_date { get; set; }
        public Nullable<int> Room_num { get; set; }
        public Nullable<System.DateTime> Bill_Date_Out { get; set; }
        public int Sta_Id { get; set; }
        public string Sta_Name { get; set; }
    }
}