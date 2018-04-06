<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="SecureExit.aspx.cs" Inherits="WebApplication_restful_core.Webforms.SecureExit" %>


<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <br />

        <div class="panel panel-info">
            <div class="panel-heading">
                <i class="fa fa-info-circle"></i>Salida Segura
            </div>
            <div class="panel-body">
                <p>El proceso de Salida Segura le garantiza eliminar de firma correcta la sessión y toda la información relacionada con la misma.</p>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Salida Segura" OnClick="Button1_OnClick" CssClass="btn btn-success" />
            </div>

        </div>



    </div>


</asp:Content>
