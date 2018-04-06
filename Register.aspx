<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication_restful_core.Webforms.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation CSS -->

    <link href="../Content/animate.css" rel="stylesheet" />
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Content/style.css" rel="stylesheet" />
    <link href="../Content/animate.css" rel="stylesheet" />
    <link href="../Content/ladda-themeless.min.css" rel="stylesheet" />
    <link href="../Content/mod-bootstrap.css" rel="stylesheet" />

    <script type="text/javascript">

        function runEffect() {
            setTimeout(function () {
                var selectedEffect = 'blind';
                var options = {};
                $("#msgbox").hide();
            }, 5000);
        }

    </script>

</head>
<body class="registerbodylogin">
    <form runat="server" id="formRegister">

        <div class="middle-box text-center loginscreen animated fadeInDown mainwindow">
            <div class="content registerscreen">
                <div>

                    <h1 class="logo-name">Mk+</h1>

                </div>
                <h3>Registro</h3>
                <p>Ingrese su informacion para crear una cuenta.</p>

                <div class="form-group">
                    <asp:TextBox ID="firstName" runat="server" CssClass="form-control" placeholder="Nombres"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese su Nombre" ControlToValidate="firstName" Display="Dynamic" ForeColor="#0099FF"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="lastName" runat="server" CssClass="form-control" placeholder="Apellidos"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese sus Apellidos" ControlToValidate="lastName" Display="Dynamic" ForeColor="#0099FF"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="email" TextMode="Email" runat="server" CssClass="form-control" placeholder="email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ingrese su correo electrónico" ControlToValidate="email" Display="Dynamic" ForeColor="#0099FF"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="token" TextMode="Number" runat="server" CssClass="form-control" placeholder="Token"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Ingrese su token" ControlToValidate="token" Display="Dynamic" ForeColor="#0099FF"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="loginCredential" runat="server" CssClass="form-control" placeholder="Login"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Ingrese su login" ControlToValidate="loginCredential" Display="Dynamic" ForeColor="#0099FF"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="passwordCredential" TextMode="Password" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Ingrese su password" Display="Dynamic" ControlToValidate="passwordCredential" ForeColor="#0099FF"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <div class="checkbox i-checks">
                        <label>
                            <input type="checkbox"><i></i> Agree the terms and policy
                        </label>
                    </div>
                </div>

                <asp:Button ID="saveUser" runat="server" Text="Registro" CssClass="btn btn-primary block full-width m-b" OnClick="saveUser_OnClick" />
                <div clientidmode="static" id="msgbox" class="alert alert-danger alert-dismissable" runat="server" visible="False">
                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                    Usuario Creado con Exito!
                </div>
                <p class="text-muted text-center"><small>Already have an account?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="login.aspx">Login</a>

                <p class="m-t"><small>Inspinia we app framework base on Bootstrap 3 &copy; 2014</small> </p>
            </div>
        </div>

    </form>
    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
</body>
</html>
