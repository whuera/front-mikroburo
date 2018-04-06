using System;
using System.Collections.Generic;
using WebApplication_restful_core.Models;
using System.Net.Http;
using System.Web.UI;

namespace WebApplication_restful_core.Webforms
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.getContacts();
        }

        public void getContacts()
        {
            var client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:8090/ServicesWeb/getAllContacts");
            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
            var response = client.GetAsync(client.BaseAddress).Result;
            if (response.IsSuccessStatusCode)
            {
                var data = response.Content.ReadAsStringAsync().Result;
                Console.WriteLine(data);
                var contacts = new List<Contacto>();
                Newtonsoft.Json.JsonConvert.PopulateObject(data.ToString(), contacts);
                Console.WriteLine(contacts);
                string script = "alert(\'" + contacts.ToString() + "'\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                GridView1.DataSource = data.ToString();
                GridView1.DataBind();
            }
        }
    }
}