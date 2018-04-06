using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication_restful_core.Models
{
    public class Person
    {
        public int codigoPersona { get; set; }
        public string numeroIdentificacion { get; set; }
        public string tipoIdentificacion { get; set; }
        public string primerNombre { get; set; }
        public object segundoNombre { get; set; }
        public string primerApellido { get; set; }
        public string segundoApellido { get; set; }
        public string fechaNacimiento { get; set; }
        public string estadoCivil { get; set; }
        public string genero { get; set; }
        public string codigoProfesion { get; set; }
        public string nombreProfesion { get; set; }
        public object emailSecundario { get; set; }
        public object celular { get; set; }
        public object telefonoOficina { get; set; }
        public string telefonoDomicilio { get; set; }
        public string emailPrimario { get; set; }
        public string typePerson { get; set; }
    }
}