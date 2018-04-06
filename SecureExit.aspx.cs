using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_restful_core.Webforms
{
    public partial class SecureExit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_OnClick(object sender, EventArgs e)
        {
            Session["userAccess"] = null;
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("~/Webforms/login.aspx");
        }
    }
}