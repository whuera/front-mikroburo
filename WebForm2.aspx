<%@ Page Language="C#" Async="true" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication_restful_core.Webforms.WebForm2" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <!--
    <div class="row wrapper border-bottom white-bg page-heading" style="opacity: 0.75;">
        <div class="col-lg-10">
            <h2>Consulta Usuarios</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="../Default.aspx" runat="server">Inicio</a>
                </li>
                <li>
                    <a>Usuarios</a>
                </li>
                <li class="active">
                    <strong>Consulta Usuarios</strong>
                </li>
            </ol>
        </div>
        <div class="col-lg-2">
        </div>
    </div>-->

    <div>

        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="ibox float-e-margins" style="width: auto; height: 80%;">

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <ajaxToolkit:ModalPopupExtender BackgroundCssClass="modalBackground" ID="mpePopUp" PopupControlID="Panel1" runat="server" TargetControlID="lblHidden"></ajaxToolkit:ModalPopupExtender>


                        <div class="ibox-title" align="center" style="min-height: 71px;">
                            <!-- boton buscar -->

                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                    <span class="input-group-btn">
                                        <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="Button1_Click" />

                                    </span>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <!-- iconos tools -->
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
                        <div class="ibox-content table-responsive" align="center" style="opacity: 0.75; width: auto; height: 550px; overflow: auto;">
                            <!-- 
                                btnOpenPopUp_OnClick
                            GridViewDx_OnRowEditing
                                -->
                            <asp:Panel ID="PanelGridView" runat="server">
                                <asp:GridView ID="GridViewDx" runat="server" CssClass="table table-bordered table-striped table-hover" AllowPaging="True" OnPageIndexChanging="GridViewDx_OnPageIndexChanging" OnRowEditing="GridViewDx_OnRowEditing">
                                    <PagerStyle CssClass="pagination-ys" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Opción">
                                            <ItemTemplate>
                                                <asp:Button ID="btn_Edit" runat="server" Text="Editar" CommandName="Edit" CssClass="btn btn-info" />
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>

                            <div class="hr-line-dashed"></div>
                        </div>

                        <asp:Label ID="lblHidden" runat="server" Text=""></asp:Label>

                        <!-- Modal Window -->
                        <asp:Panel ID="Panel1" runat="server">
                            <div id="divPopUp" class="modal-content animated bounceInRight">
                                <div id="Header" class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                    Editar Informacion                                    
                                </div>
                                <div class="modal-body">
                                    <div class="ibox-content">
                                        <!-- formulario -->

                                        <div class="ibox float-e-margins" style="width: 100%;">
                                            <div class="ibox-content" style="width: 400px;">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
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
                                                                    <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="hr-line-dashed"></div>

                                                    </ContentTemplate>

                                                </asp:UpdatePanel>

                                            </div>

                                            <div class="ibox-footer">
                                                <span class="pull-right">
                                                    <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                                                        <ProgressTemplate>
                                                            <div class="wrapper wrapper-content animated fadeInRight">
                                                                Grabando datos espere un momento....
                                                            </div>
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                </span>
                                                Edición de Usuario
                                            </div>


                                        </div>
                                        <!-- fin formulario -->

                                    </div>



                                </div>
                                <div class="modal-footer">
                                    <div id="buttons">
                                        <div id="DivbtnOK" class="buttonOK">
                                            <asp:Button ID="btnOk" runat="server" Text="Ok" />
                                        </div>
                                        <div id="Divbtncancel" class="buttonOK">
                                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="ibox-footer">
                    <span class="pull-right">
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>
                                <div class="wrapper wrapper-content animated fadeInRight">
                                    Cargado datos espere un momento....                                   
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </span>
                    Reporte de Usuarios Activos
                </div>

            </div>
        </div>
    </div>
</asp:Content>
