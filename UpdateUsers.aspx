<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="UpdateUsers.aspx.cs" Inherits="WebApplication_restful_core.Webforms.UpdateUsers" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row wrapper border-bottom white-bg page-heading" style="opacity: 0.75;">
        <div class="col-lg-10">
            <h2>Actualizacion Información Usuarios</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="../Default.aspx" runat="server">Inicio</a>
                </li>
                <li>
                    <a>Usuarios</a>
                </li>
                <li class="active">
                    <strong>Actualizar Datos Usuario</strong>
                </li>
            </ol>
        </div>
        <div class="col-lg-2">
        </div>
    </div>


    <div class="">


        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="col-lg-12">
                <div class="ibox float-e-margins div-shadow" style="opacity: 0.75; width: 90%; height: 80%;">
                    <div class="ibox-title">
                        <h5 class="panel-title">Información Básica</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="#">Config option 1</a>
                                </li>
                                <li><a href="#">Config option 2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>

                    <div class="ibox-content lineadiv-right">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>

                                <div class="form-group ">
                                    <label class="col-sm-2 control-label">Nombres: </label>
                                    <div class="col-sm-10">

                                        <div style="">

                                            <asp:TextBox ID="firstName" name="firstName" class="form-control transparent-input" placeholder="Ingrese sus nombres" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Apellidos: </label>
                                    <div class="col-sm-10">
                                        <div style="">
                                            <asp:TextBox ID="lastName" name="lastName" class="form-control transparent-input" placeholder="Ingrese sus apellidos" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Cedula: </label>
                                    <div class="col-sm-10">
                                        <div style="">

                                            <asp:TextBox ID="numberDocument" class="form-control transparent-input" placeholder="Ingrese sus cedula" name="numberDocument" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Escoja su profesion:</label>
                                    <div class="col-sm-10">
                                        <div style="">
                                            <!--input type="text" class="w3-input w3-animate-input" style="width:355px" id="profession" placeholder="Ingrese sus profesión" name="profession" #profession="ngModel" [(ngModel)]="contacto.profession" required-->
                                            <dx:ASPxComboBox ID="profession" name="profession" class="form-control transparent-input" runat="server" SelectedIndex="1" Theme="Material">
                                                <Items>
                                                    <dx:ListEditItem Text="Arquitecto" Value="Arquitecto" />
                                                    <dx:ListEditItem Text="Ingeriero" Value="Ingeriero" Selected="True" />
                                                    <dx:ListEditItem Text="Consultor" Value="Consultor" />
                                                    <dx:ListEditItem Text="Profesor" Value="Profesor" />
                                                </Items>

                                            </dx:ASPxComboBox>



                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Email: </label>
                                    <div class="col-sm-10">
                                        <div style="">
                                            <asp:TextBox ID="email" class="form-control transparent-input" placeholder="Ingrese su email" name="email" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>

                                <div class="form-group">

                                    <div class="col-sm-10">
                                        <div class="btn-group">
                                            <asp:Button ID="ButtonUpdate" runat="server" class="btn btn-primary" AutoPostBack="false" Text="Grabar" OnClick="ButtonUpdate_OnClick"></asp:Button>
                                            <asp:Button ID="ButtonBack" runat="server" class="btn btn-white" AutoPostBack="false" Text="Regresar" OnClick="ButtonBack_OnClick"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>

                            </ContentTemplate>

                        </asp:UpdatePanel>

                    </div>

                    <div class="ibox-footer">
                        <span class="pull-right">
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                <ProgressTemplate>
                                    <div class="wrapper wrapper-content animated fadeInRight">
                                        Grabando datos espere un momento....
                                    </div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </span>
                        Registro de Usuarios
                    </div>


                </div>
            </div>
        </div>
    </div>

</asp:Content>
