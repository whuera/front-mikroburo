using System;
using System.Web.UI;

namespace WebApplication_restful_core.Webforms
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_OnClick(object sender, EventArgs e)
        {
            Label1.Text = TextBox1.Text;
        }

        protected void btnOpenPopUp_OnClick(object sender, EventArgs e)
        {
            mpePopUp.Show();
        }

        protected void btnOk_Click(object sender, ImageClickEventArgs e)
        {
            //Do Work

            mpePopUp.Hide();
        }

        protected void btnCancel_Click(object sender, ImageClickEventArgs e)
        {
            //Do Work

            mpePopUp.Hide();
        }
    }
}