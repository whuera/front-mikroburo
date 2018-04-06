using System;
using System.Net.Http;
using System.Net.Http.Headers;
using WebApplication_restful_core.Models;

namespace WebApplication_restful_core.Webforms
{
    public partial class RegisterUsers : System.Web.UI.Page
    {
        HttpClient _client = new HttpClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void btn_saveContact(object sender, EventArgs e)
        {
            var newContact = new Contacto();
            newContact.firstName = firstName?.Text;
            newContact.middleName = "Demo";
            newContact.lastName = lastName?.Text;
            newContact.numberDocument = numberDocument?.Text;
            newContact.profession = profession?.Text;
            newContact.email = email?.Text;
            System.Threading.Thread.Sleep(2000);
            if (SaveContact(newContact)) { ResetForm(); }
        }

        public void ResetForm()
        {
            firstName.Text = "";
            lastName.Text = "";
            numberDocument.Text = "";
            profession.Text = "";
            email.Text = "";
            firstName.Focus();
        }

        public Boolean SaveContact(Contacto newContact)
        {
            try
            {
                _client.DefaultRequestHeaders.Accept.Clear();
                _client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                _client.BaseAddress = new Uri("http://localhost:8090/ServicesWeb/saveContact/");
                HttpResponseMessage response =
                    _client.PostAsJsonAsync(_client.BaseAddress.ToString(), newContact).Result;
                return response.IsSuccessStatusCode ? true : false;
            }
            catch (Exception exception)
            {
                return false;
            }


        }
    }


}
