using System;

namespace WebApplication_restful_core.Webforms
{
    using System.Net.Http;
    using System.Net.Http.Headers;

    using WebApplication_restful_core.Models;

    public partial class EditUpdateUser : System.Web.UI.Page
    {
        HttpClient _client = new HttpClient();
        Contacto contact = new Contacto();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                contact = (Contacto)Session["ObjectContacto"];
                this.firstName.Text = contact.firstName;
                this.lastName.Text = contact.lastName;
                this.numberDocument.Text = contact.numberDocument;
                this.email.Text = contact.email;
            }

        }

        protected void ButtonBack_OnClick(object sender, EventArgs e)
        {
            //  mpePopUp.Hide();

        }



        public Boolean updateUser(int idContact, Contacto contato)
        {
            var idContactToString = Convert.ToString(idContact);
            try
            {
                _client.DefaultRequestHeaders.Accept.Clear();
                _client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                _client.BaseAddress = new Uri("http://localhost:8090/ServicesWeb/updateContact/" + idContactToString);
                HttpResponseMessage response =
                    _client.PutAsJsonAsync(_client.BaseAddress.ToString(), contato).Result;
                return response.IsSuccessStatusCode ? true : false;
            }
            catch (Exception exception)
            {
                return false;
            }
        }

        protected void ButtonUpdate_OnClick(object sender, EventArgs e)
        {
            contact = (Contacto)Session["ObjectContacto"];
            var contatoToUpdate = new Contacto();
            contatoToUpdate.id = contact.id;
            contatoToUpdate.firstName = this.firstName.Text;
            contatoToUpdate.lastName = this.lastName.Text;
            contatoToUpdate.numberDocument = this.numberDocument.Text;
            contatoToUpdate.email = this.email.Text;
            System.Threading.Thread.Sleep(3000);
            this.updateUser(contact.id, contatoToUpdate);
        }


    }
}