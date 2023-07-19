using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kurye_first_demo
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListDate.Items.Add(DateTime.Now.ToShortDateString()); //for adding current date
            for (int i = 1; i <= 10; i++) //loop to add next 60 days
            {
                DropDownListDate.Items.Add(DateTime.Now.AddDays(i).ToShortDateString());
            }
        }
      
    }
}
