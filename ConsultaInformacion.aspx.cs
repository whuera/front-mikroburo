namespace WebApplication_restful_core.Webforms
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.Data;
    using System.Net.Http;
    using System.Net.Http.Headers;
    using System.Text;
    using System.Web.Helpers;
    using System.Web.Services;
    using System.Web.UI;
    using System.Web.UI.DataVisualization.Charting;
    using System.Web.UI.WebControls;

    using WebApplication_restful_core.Models;

    public partial class ConsultaInformacion : Page
    {
        private static DataTable dt = new DataTable();

        private readonly HttpClient client = new HttpClient();

        private readonly StringBuilder str = new StringBuilder();

        public static List<CreditCard> creditCardList = new List<CreditCard>();


        //  public void BindChart()
        //  {
        //      // DataTable dt = new DataTable();
        //      /*
        //        google.charts.load('current', {
        //packages: ['corechart'],}).then(function () {

        //       */
        //      try
        //      {
        //          this.str.Append(
        //              @"<script type=text/javascript> google.charts.load('current', {'packages':['gauge']});

        //                google.charts.setOnLoadCallback(drawGauge);

        //                 function drawGauge() {

        //  var data = new google.visualization.DataTable();

        //  data.addColumn('string', 'description');

        //  data.addColumn('number', 'ponderation');     



        //  data.addRows(" + dt.Rows.Count + ");");

        //          for (var i = 0; i <= dt.Rows.Count - 1; i++)
        //          {
        //              this.str.Append("data.setCell( " + i + "," + 0 + "," + "'" + dt.Rows[i]["description"] + "');");

        //              this.str.Append("data.setCell(" + i + "," + 1 + "," + dt.Rows[i]["ponderation"] + ") ;");
        //          }

        //          this.str.Append(
        //              "var options = {width: 600, height: 300,redFrom: 90, redTo: 10,yellowFrom:75, yellowTo: 10,minorTicks: 5};");

        //          this.str.Append(" var gauge = new google.visualization.Gauge(document.getElementById('gauge_div'));");

        //          this.str.Append(" gauge.draw(data, options); }");

        //          this.str.Append("</script>");

        //          this.lt.Text = this.str.ToString().TrimEnd(',').Replace('*', '"');
        //      }
        //      catch
        //      {
        //      }
        //  }

        public DataTable ConvertToDataTable<T>(IList<T> data)
        {
            var properties = TypeDescriptor.GetProperties(typeof(T));
            var table = new DataTable();
            foreach (PropertyDescriptor prop in properties)
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
            foreach (var item in data)
            {
                var row = table.NewRow();
                foreach (PropertyDescriptor prop in properties)
                    row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                table.Rows.Add(row);
            }

            return table;
        }

        public async void getAddressByCodePerson(string codePerson)
        {
            // var client = new HttpClient();
            this.client.DefaultRequestHeaders.Accept.Clear();
            this.client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            this.client.BaseAddress = new Uri("http://localhost:8090/ServicesWeb/getAddressByCodePerson/" + codePerson);
            var response = this.client.GetAsync(this.client.BaseAddress.ToString()).Result;
            if (response.IsSuccessStatusCode)
            {
                var data = await response.Content.ReadAsStringAsync();
                var address = new List<Address>();
                var addressPerson = new Person();
                address = Json.Decode<List<Address>>(data);
                this.GridViewAddressPerson.DataSource = address;
                this.GridViewAddressPerson?.DataBind();
            }
        }

        public async void getCreditCardByNumberDocument(string numberDocument)
        {
            // var client = new HttpClient();
            this.client.DefaultRequestHeaders.Accept.Clear();
            this.client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            this.client.BaseAddress = new Uri(
                "http://localhost:8090/ServicesWeb/getCreditCardByNumberDocument/" + numberDocument);
            var response = this.client.GetAsync(this.client.BaseAddress.ToString()).Result;
            if (response.IsSuccessStatusCode)
            {
                var data = await response.Content.ReadAsStringAsync();


                // var creditCardPerson = new Person();
                creditCardList = Json.Decode<List<CreditCard>>(data);
                dt = this.ConvertToDataTable(creditCardList);

                this.GridViewCreditCardPerson.DataSource = creditCardList;
                this.GridViewCreditCardPerson?.DataBind();

                // this.BindChart();
            }
        }
        [WebMethod]
        public List<CreditCard> GetCreditCardsList()
        {
            return creditCardList;
        }

        public async void getInformationByNumberDocument(string idPersonParameter)
        {
            this.msgbox.Visible = false;
            this.client.DefaultRequestHeaders.Accept.Clear();
            this.client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            this.client.BaseAddress = new Uri(
                "http://localhost:8090/ServicesWeb/getPersonByNumberDocument/" + idPersonParameter);

            var response = this.client.GetAsync(this.client.BaseAddress.ToString()).Result;
            if (response.IsSuccessStatusCode)
            {
                var data = await response.Content.ReadAsStringAsync();
                var persons = new List<Person>();
                var person = new Person();

                // contacts = Json.Decode<List<Contacto>>(data);
                person = Json.Decode<Person>(data);
                persons.Add(person);

                // dt = ConvertToDataTable(persons);

                // GridView1.DataSource = contacts;
                // GridView1?.DataBind();
                this.PanelGridViewDataPerson.Visible = true;
                this.GridViewDataPerson.Visible = true;
                this.GridViewDataPerson.DataSource = persons;
                this.GridViewDataPerson?.DataBind();
            }
            else
            {
                this.PanelGridViewDataPerson.Visible = false;
                this.msgbox.Visible = true;
                this.GridViewDataPerson.Visible = false;
            }
        }

        protected async void btn_buscarPorCedula_OnClick(object sender, EventArgs e)
        {
            this.getInformationByNumberDocument(this.TextBoxBuscarPorCedula.Text);
        }

        protected void GridViewAddressPerson_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            this.PanelGridViewCreditCard.Visible = true;
            var person = (Person)this.Session["ObjectPerson"];
            var _numberDocument = person.numeroIdentificacion;
            this.getCreditCardByNumberDocument(_numberDocument);
        }

        protected void GridViewCreditCardPerson_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            // this.PanelChart.Visible = true;
            // ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "loadChart()", true);
            // this.BindChart();
            this.PanelChartCredit.Visible = true;
            Series series = this.ChartCredit.Series["Series1"];
            // series.Points.AddXY("Visa", 6);
            // series.Points.AddXY("Diners", 8);

            ChartCredit.DataSource = creditCardList;
            this.ChartCredit?.DataBind();

        }

        protected void GridViewDataPerson_OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            this.GridViewDataPerson.EditIndex = e.NewEditIndex;

            var codePerson = Convert.ToInt32(this.GridViewDataPerson.Rows[e.NewEditIndex].Cells[7].Text);
            var person = new Person();
            person.codigoPersona = codePerson;

            this.Session["ObjectPerson"] = person;
        }

        protected void GridViewDataPerson_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            var codePerson = Convert.ToInt32(this.GridViewDataPerson.SelectedRow.Cells[6].Text);
            var numeroIdentificacion = this.GridViewDataPerson.SelectedRow.Cells[0].Text;
            var person = new Person();
            person.codigoPersona = codePerson;
            person.numeroIdentificacion = numeroIdentificacion;

            this.Session["ObjectPerson"] = person;
            this.PanelGridViewDataAddress.Visible = true;
            this.getAddressByCodePerson(Convert.ToString(codePerson));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //  if (!this.Page.IsPostBack) //this.BindChart();
        }
    }
}