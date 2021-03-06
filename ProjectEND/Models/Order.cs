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
    
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            this.Payment = new HashSet<Payment>();
            this.RoomBill = new HashSet<RoomBill>();
        }
    
        public int Oder_Id { get; set; }
        public string User_Id { get; set; }
        public Nullable<int> Room_Id { get; set; }
        public Nullable<System.DateTime> Date_In { get; set; }
        public Nullable<int> Sta_Id { get; set; }
    
        public virtual DataUser DataUser { get; set; }
        public virtual Room Room { get; set; }
        public virtual StatusOrder StatusOrder { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Payment> Payment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RoomBill> RoomBill { get; set; }
    }
}
