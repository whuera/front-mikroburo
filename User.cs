using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication_restful_core.Models
{
    public class User
    {
        public int codigoPersona { get; set; }
        public object numeroIdentificacion { get; set; }
        public object tipoIdentificacion { get; set; }
        public string primerNombre { get; set; }
        public string segundoNombre { get; set; }
        public string primerApellido { get; set; }
        public string segundoApellido { get; set; }
        public object fechaNacimiento { get; set; }
        public object estadoCivil { get; set; }
        public object genero { get; set; }
        public string codigoProfesion { get; set; }
        public string nombreProfesion { get; set; }
        public string emailSecundario { get; set; }
        public object celular { get; set; }
        public object telefonoOficina { get; set; }
        public object telefonoDomicilio { get; set; }
        public string emailPrimario { get; set; }
        public string login { get; set; }
        public string passwd { get; set; }
        public string token { get; set; }
        public string ip { get; set; }
        public string device { get; set; }
        public string observation { get; set; }
        public int idRolUser { get; set; }
        public string levelAccess { get; set; }

        public string typePerson { get; set; }

    }


}