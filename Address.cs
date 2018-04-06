using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication_restful_core.Models
{
    public class Address
    {

        public int idAdress { get; set; }
        public int codePerson { get; set; }
        public string streetMain { get; set; }
        public string numberStreet { get; set; }
        public string intersection { get; set; }
        public string referenceStreet { get; set; }
        public string dateUpdate { get; set; }
        public object dateCreate { get; set; }
        public string descriptionAdress { get; set; }
        public string city { get; set; }
        public string province { get; set; }
        public string district { get; set; }
        public string zone { get; set; }
        public string region { get; set; }
    }
}