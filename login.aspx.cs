using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_restful_core.Webforms
{
    using System.Net.Http;
    using System.Net.Http.Headers;
    using System.Web.Helpers;

    using WebApplication_restful_core.Models;

    public partial class login : System.Web.UI.Page
    {
        HttpClient _client = new HttpClient();

        public static bool varEvaluate = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.msgbox.Visible = false;
        }
        public static User userGetFromBdd = new User();

        public async void GetCredentials(User user)
        {

            try
            {
                _client.DefaultRequestHeaders.Accept.Clear();
                _client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                _client.BaseAddress = new Uri("http://localhost:8090/ServicesWeb/getUserByCredentials/");
                HttpResponseMessage response =
                     _client.PostAsJsonAsync(_client.BaseAddress.ToString(), user).Result;
                if (response.IsSuccessStatusCode)
                {
                    var data = await response.Content.ReadAsStringAsync();
                    userGetFromBdd = Json.Decode<User>(data);
                    Session["userAccess"] = userGetFromBdd;
                    varEvaluate = true;
                    Response.Redirect("~/Default.aspx", false);
                    // Response.Redirect("~/Webforms/ConsultaInformacion.aspx");

                }
                else
                {
                    this.msgbox.Visible = true;
                    this.clearForm();

                }
            }
            catch (Exception exception)
            {
                varEvaluate = false;
            }


        }
        protected void Btn_SubmitCredentials_OnClick(object sender, EventArgs e)
        {
            WebApplication_restful_core.Models.User userForm = new WebApplication_restful_core.Models.User();
            userForm.login = this.loginCredentials.Text;
            userForm.passwd = this.passwdCredentials.Text;
            userForm.token = this.tokenCredentials.Text;
            GetCredentials(userForm);

        }

        private void clearForm()
        {
            this.loginCredentials.Text = String.Empty;
            this.passwdCredentials.Text = String.Empty;
            this.tokenCredentials.Text = String.Empty;

        }
    }
}