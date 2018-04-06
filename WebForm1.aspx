<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication_restful_core.Webforms.WebForm1" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </div>
    <br />
    <div>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>

    </div>

</asp:Content>
