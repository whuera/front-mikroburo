using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication_restful_core.Models
{
    public class CreditCard
    {
        public int id { get; set; }
        public string codeProduct { get; set; }
        public string description { get; set; }
        public string numberDocument { get; set; }
        public string activo { get; set; }
        public string dateRegister { get; set; }
        public object observation { get; set; }
        public int ponderation { get; set; }
    }
}