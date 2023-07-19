using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using kurye_first_demo;
namespace kurye_first_demo.user_panel.html
{
    public partial class admin : System.Web.UI.Page
    {
        kurye_demoEntities db = new kurye_demoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

            Repeater1.DataSource = db.tbl_Order.ToList();
            Repeater1.DataBind();

        }
    }
}