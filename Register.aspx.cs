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

    using WebApplication_restful_core.Models;



    public partial class Register : System.Web.UI.Page
    {
        HttpClient _client = new HttpClient();
        protected void Page_Load(object sender, EventArgs e)
        {

            this.msgbox.Visible = false;

        }

        public Boolean SaveUser(User user)
        {
            try
            {
                _client.DefaultRequestHeaders.Accept.Clear();
                _client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                _client.BaseAddress = new Uri("http://localhost:8090/ServicesWeb/saveUser/");
                HttpResponseMessage response =
                    _client.PostAsJsonAsync(_client.BaseAddress.ToString(), user).Result;
                return response.IsSuccessStatusCode ? true : false;
            }
            catch (Exception exception)
            {
                return false;
            }


        }

        protected void saveUser_OnClick(object sender, EventArgs e)
        {

            User user = new User();
            user.primerNombre = this.firstName.Text;
            user.primerApellido = this.lastName.Text;
            user.login = this.loginCredential.Text;
            user.passwd = this.passwordCredential.Text;
            user.typePerson = "USUARIO";
            user.emailPrimario = this.email.Text;
            user.emailSecundario = this.email.Text;
            user.token = this.token.Text;
            if (user != null)
            {
                if (SaveUser(user))
                {
                    this.msgbox.Visible = true;
                    this.cleanForm();
                }
            }


        }

        private void cleanForm()
        {
            this.firstName.Text = String.Empty;
            this.lastName.Text = String.Empty;
            this.email.Text = String.Empty;
            this.token.Text = String.Empty;
            this.loginCredential.Text = String.Empty;
            this.passwordCredential.Text = String.Empty;
            this.firstName.Focus();

        }
    }
}