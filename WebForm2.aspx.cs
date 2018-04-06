using System;
using System.Collections.Generic;
using WebApplication_restful_core.Models;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web.Helpers;
using System.Web.UI.WebControls;

namespace WebApplication_restful_core.Webforms
{
    using System.Web.UI;

    public partial class WebForm2 : System.Web.UI.Page
    {
        HttpClient client = new HttpClient();
        HttpClient _client = new HttpClient();
        Contacto contactoSelect = new Contacto();
        Contacto contact = new Contacto();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.TextBox1.Focus();

        }

        protected async void Button1_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(2000);

            if (this.TextBox1.Text != string.Empty)
            {
                this.PanelGridView.Visible = true;
                this.getContactsById(this.TextBox1.Text);
            }
            else
            {
                this.PanelGridView.Visible = true;
                this.getContacts();
            }

            this.TextBox1.Text = "";
            this.TextBox1.Focus();
            //this.getContactsById(this.TextBox1.Text);
            //this.getContacts();
        }

        public async void getContacts()
        {
            // var client = new HttpClient();
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = new HttpResponseMessage();
            try
            {
                client.BaseAddress = new Uri("http://localhost:8090/ServicesWeb/getAllContacts");
                response = client.GetAsync(client.BaseAddress).Result;
            }
            catch (Exception e)
            {
                Console.WriteLine("Error al llamar el servicio: " + e);
                throw;
            }

            if (response.IsSuccessStatusCode)
            {
                var data = await response.Content.ReadAsStringAsync();
                var contacts = new List<Contacto>();
                contacts = Json.Decode<List<Contacto>>(data);
                // GridView1.DataSource = contacts;
                // GridView1?.DataBind();
                GridViewDx.DataSource = contacts;
                GridViewDx?.DataBind();

            }
        }

        public async void getContactsById(String idContactParameter)
        {
            // var client = new HttpClient();
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            client.BaseAddress = new Uri("http://localhost:8090/ServicesWeb/getContactById/" + idContactParameter);
            HttpResponseMessage response = client.GetAsync(client.BaseAddress.ToString()).Result;
            if (response.IsSuccessStatusCode)
            {
                var data = await response.Content.ReadAsStringAsync();
                var contacts = new List<Contacto>();
                var contact = new Contacto();
                //  contacts = Json.Decode<List<Contacto>>(data);
                contact = Json.Decode<Contacto>(data);
                contacts.Add(contact);
                // GridView1.DataSource = contacts;
                // GridView1?.DataBind();
                GridViewDx.DataSource = contacts;
                GridViewDx?.DataBind();

            }
        }

        protected void GridViewDx_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewDx.PageIndex = e.NewPageIndex;
            getContacts();
        }

        protected void GridViewDx_OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewDx.EditIndex = e.NewEditIndex;

            var idGridText = Convert.ToInt32(this.GridViewDx.Rows[e.NewEditIndex].Cells[1].Text);
            var firstNameGridText = this.GridViewDx.Rows[e.NewEditIndex].Cells[2].Text;
            var lastNameGridText = this.GridViewDx.Rows[e.NewEditIndex].Cells[3].Text;
            var numberDocumentGridText = this.GridViewDx.Rows[e.NewEditIndex].Cells[7].Text;
            var emailGridText = this.GridViewDx.Rows[e.NewEditIndex].Cells[6].Text;
            contactoSelect.id = (int)idGridText;
            contactoSelect.firstName = firstNameGridText;
            contactoSelect.lastName = lastNameGridText;
            contactoSelect.numberDocument = numberDocumentGridText;
            contactoSelect.email = emailGridText;
            Session["ObjectContacto"] = contactoSelect;


            this.firstName.Text = contactoSelect.firstName;
            this.lastName.Text = contactoSelect.lastName;
            this.numberDocument.Text = contactoSelect.numberDocument;
            this.email.Text = this.contactoSelect.email;

            mpePopUp.Show();

            //Response.Redirect("~/Webforms/UpdateUsers.aspx");
        }


        protected void btnOpenPopUp_OnClick(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //  this.firstName.Text = contactoSelect.firstName;
                mpePopUp.Show();
            }

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
            this.getContactsById(Convert.ToString(contact.id));

        }

        protected void ButtonBack_OnClick(object sender, EventArgs e)
        {
            mpePopUp.Hide();
        }

        protected void Button2_OnClick(object sender, EventArgs e)
        {
            this.PanelGridView.Visible = false;
        }
        /*

        protected void GridViewDx_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            // GridViewDx.EditIndex = e.NewEditIndex;
            int index = Convert.ToInt32(e.CommandArgument);

            var idGridText = Convert.ToInt32(this.GridViewDx.Rows[index].Cells[1].Text);
            var firstNameGridText = this.GridViewDx.Rows[index].Cells[2].Text;
            var lastNameGridText = this.GridViewDx.Rows[index].Cells[3].Text;
            var numberDocumentGridText = this.GridViewDx.Rows[index].Cells[7].Text;
            var emailGridText = this.GridViewDx.Rows[index].Cells[6].Text;
            contactoSelect.id = (int)idGridText;
            contactoSelect.firstName = firstNameGridText;
            contactoSelect.lastName = lastNameGridText;
            contactoSelect.numberDocument = numberDocumentGridText;
            contactoSelect.email = emailGridText;
            Session["ObjectContacto"] = contactoSelect;


            this.firstName.Text = contactoSelect.firstName;
            this.lastName.Text = contactoSelect.lastName;
            this.numberDocument.Text = contactoSelect.numberDocument;
            this.email.Text = this.contactoSelect.email;

            mpePopUp.Show();
        }
        */
    }
}