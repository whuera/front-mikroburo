using System;
using System.Web.UI;

namespace WebApplication_restful_core
{
    using WebApplication_restful_core.Models;

    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                User activeUser = (User)Session["userAccess"];
                if (Session["userAccess"] == null)
                {
                    // LabelActiveUser.Text = activeUser.primerNombre + " " + activeUser.primerApellido;
                    Response.Redirect("~/Webforms/login.aspx");
                }

            }
            else
            {
                Response.Redirect("~/Webforms/login.aspx");
            }


        }


    }
}