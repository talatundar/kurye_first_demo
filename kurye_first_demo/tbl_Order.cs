//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace kurye_first_demo
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_Order
    {
        public int order_id { get; set; }
        public Nullable<int> vehicle_type { get; set; }
        public Nullable<int> weight_type { get; set; }
        public string first_address { get; set; }
        public string final_adress { get; set; }
        public Nullable<int> first_phone_number { get; set; }
        public string date_time { get; set; }
        public string first_hour { get; set; }
        public string final_hour { get; set; }
        public string first_extra_inf { get; set; }
        public Nullable<int> final_phone_number { get; set; }
        public string final_extra_inf { get; set; }
        public Nullable<int> order_act { get; set; }
        public Nullable<int> price { get; set; }
        public Nullable<int> distance { get; set; }
        public Nullable<int> road { get; set; }
        public string order_icerik { get; set; }
    }
}