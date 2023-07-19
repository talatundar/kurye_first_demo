using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kurye_first_demo;
namespace kurye_first_demo
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        kurye_demoEntities db = new kurye_demoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            int a = int.Parse(Request.QueryString["ID"]);
            var kullanici = db.tbl_Order.Find(a);

            db.tbl_Order.Remove(kullanici);
            db.SaveChanges();

            Response.Redirect("user-panel/html/admin.Aspx");
        }
    }
}