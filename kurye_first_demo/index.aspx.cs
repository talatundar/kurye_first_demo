using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using kurye_first_demo;

namespace kurye_first_demo
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListDate.Items.Add(DateTime.Now.ToShortDateString()); //for adding current date
            for (int i = 1; i <= 10; i++) //loop to add next 60 days
            {
                DropDownListDate.Items.Add(DateTime.Now.AddDays(i).ToShortDateString());
            }
        }
        
        kurye_demoEntities db = new kurye_demoEntities();
        
        protected void cicek_Click(object sender, EventArgs e)
        {
            txt_icerik.Text = "Çiçek";
        }

        protected void Evrak_Click(object sender, EventArgs e)
        {
            txt_icerik.Text = "Evrak";
        }

        protected void Hediye_Click(object sender, EventArgs e)
        {
            txt_icerik.Text = "Hediye";
            

        }

        protected void btn_order_Click(object sender, EventArgs e)
        {
           
            tbl_Order order = new tbl_Order();
            order.vehicle_type = 1;
            order.weight_type = 10;
            order.first_address = location_1.Text;
            order.final_adress = location_2.Text;
            order.first_phone_number = int.Parse(txt_first_phone.Text);
            order.final_phone_number = int.Parse(txt_final_phone.Text);
            order.date_time = DropDownListDate.Text;
            order.first_extra_inf = txt_first_extra_inf.Text;
            order.final_extra_inf = txt_final_extra_inf.Text;
            order.price = int.Parse(TextBox1.Text);
            order.order_act = 0;
            order.order_icerik = txt_icerik.Text;
            db.tbl_Order.Add(order);
            db.SaveChanges();
            Response.Redirect(Request.RawUrl);

        }
    }
}