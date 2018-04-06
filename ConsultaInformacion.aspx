<%@ Page Language="C#" AutoEventWireup="true" Async="true" MasterPageFile="~/Site.Master" CodeBehind="ConsultaInformacion.aspx.cs" Inherits="WebApplication_restful_core.Webforms.ConsultaInformacion" %>



<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">

        function runEffect() {
            setTimeout(function () {
                var selectedEffect = 'blind';
                var options = {};
                $("#msgbox").hide();
            }, 5000);
        }

    </script>


    <!--
    <div class="row wrapper border-bottom white-bg page-heading" style="opacity: 0.75;">
        <div class="col-lg-10">
            <h2>Consulta Información</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="../Default.aspx" runat="server">Inicio</a>
                </li>
                <li>
                    <a>Información</a>
                </li>
                <li class="active">
                    <strong>Consulta Información</strong>
                </li>
            </ol>
        </div>
        <div class="col-lg-2">
        </div>
    </div>
-->


    <div>

        <div class="wrapper">
            <div class="ibox float-e-margins" style="width: auto; height: 70%;">

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <br />
                        <div class="ibox float-e-margins">

                            <div class="ibox-title" align="center" style="min-height: 71px;">
                                <!-- boton buscar -->

                                <div class="col-sm-10">
                                    <div class="input-group m-b">
                                        <span class="input-group-btn">
                                            <asp:Button ID="btn_buscarPorCedula" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btn_buscarPorCedula_OnClick" OnClientClick="runEffect();" />

                                        </span>
                                        <asp:TextBox ID="TextBoxBuscarPorCedula" runat="server" CssClass="form-control"></asp:TextBox>

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


                            <div class="ibox-content table-responsive registerbodylogin slimScrollDiv" align="center" style="opacity: 0.85; width: auto; height: 600px;">
                                <div clientidmode="static" id="msgbox" class="alert alert-danger alert-dismissable" runat="server" visible="False">
                                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                                    Error no hay Información para esta busqueda
                                </div>
                                <!-- 
                                btnOpenPopUp_OnClick
                            GridViewDx_OnRowEditing
                                -->
                                <asp:Panel ID="PanelGridViewDataPerson" runat="server">
                                    <asp:GridView ID="GridViewDataPerson" runat="server" CssClass="table table-bordered table-striped table-hover opacitytable div-shadow" AllowPaging="True" AutoGenerateColumns="False" OnSelectedIndexChanged="GridViewDataPerson_OnSelectedIndexChanged">
                                        <PagerStyle CssClass="pagination-ys" />
                                        <Columns>

                                            <asp:BoundField HeaderText="Cedula" DataField="numeroIdentificacion" />
                                            <asp:TemplateField HeaderText="Nombres">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("primerNombre")+ " " + Eval("segundoNombre")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Apellidos">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("primerApellido")+ " " + Eval("segundoApellido")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField HeaderText="Profesión" DataField="nombreProfesion" />

                                            <asp:TemplateField HeaderText="Información Electronica">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("emailPrimario")+ "<br> " + Eval("emailSecundario")%>'></asp:Label>
                                                    <rowstyle horizontalalign="Center"></rowstyle>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Estado Civil">
                                                <ItemTemplate>
                                                    <asp:Label ID="Genero" runat="server" Text='<%#Eval("estadoCivil").ToString() == "C" ? "Casado"  : "Soltero"%>'></asp:Label>
                                                    <rowstyle horizontalalign="Center"></rowstyle>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField HeaderText="codigo" DataField="codigoPersona" Visible="True" />

                                            <asp:TemplateField HeaderText="Genero">
                                                <ItemTemplate>
                                                    <asp:Label ID="Genero" runat="server" Text='<%#Eval("genero").ToString().Trim() == "M" ? "Masculino" : "Femenino"%>'></asp:Label>
                                                    <rowstyle horizontalalign="Center"></rowstyle>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" HeaderText="Direcciones">
                                                <ControlStyle CssClass="btn btn-success btn-sm buttonCenter" />
                                            </asp:CommandField>

                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>

                                <asp:Panel ID="PanelGridViewDataAddress" runat="server">
                                    <asp:GridView ID="GridViewAddressPerson" runat="server" CssClass="table table-bordered table-striped table-hover opacitytable div-shadow" AutoGenerateColumns="False" OnSelectedIndexChanged="GridViewAddressPerson_OnSelectedIndexChanged">
                                        <Columns>
                                            <asp:BoundField HeaderText="Calle Principal" DataField="streetMain" />
                                            <asp:BoundField HeaderText="Numero" DataField="numberStreet" />
                                            <asp:BoundField HeaderText="Calle Secundaria" DataField="intersection" />
                                            <asp:BoundField HeaderText="Referencia" DataField="referenceStreet" />
                                            <asp:BoundField HeaderText="Tipo" DataField="descriptionAdress" />
                                            <asp:BoundField HeaderText="Ciudad" DataField="city" />
                                            <asp:BoundField HeaderText="Provincia" DataField="province" />
                                            <asp:BoundField HeaderText="Zona" DataField="zone" />
                                            <asp:BoundField HeaderText="Region" DataField="region" />

                                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" HeaderText="Datos Financieros">
                                                <ControlStyle CssClass="btn btn-success btn-sm buttonCenter" />
                                            </asp:CommandField>
                                        </Columns>
                                    </asp:GridView>

                                </asp:Panel>

                                <div class="row">
                                    <div class="col-xs-12 col-lg-6">

                                        <asp:Panel ID="PanelGridViewCreditCard" runat="server">

                                            <asp:GridView ID="GridViewCreditCardPerson" runat="server" CssClass="table table-bordered table-striped table-hover opacitytable div-shadow" AutoGenerateColumns="False" OnSelectedIndexChanged="GridViewCreditCardPerson_OnSelectedIndexChanged">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Tarjeta" DataField="description" />

                                                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" HeaderText="Grafico Datos Financieros">
                                                        <ControlStyle CssClass="btn btn-success btn-sm buttonCenter" />

                                                    </asp:CommandField>
                                                </Columns>
                                            </asp:GridView>

                                        </asp:Panel>

                                    </div>
                                    <div class="col-xs-12 col-lg-6">

                                        <asp:Panel ID="PanelChartCredit" runat="server" Visible="False">
                                            <div class="">
                                                <asp:Chart ID="ChartCredit" runat="server" Palette="Excel" Titles="Consumos por Tarjeta" CssClass="opacitytable">
                                                    <Series>
                                                        <asp:Series Name="Series1" XValueMember="description" YValueMembers="ponderation" ChartType="RangeColumn" YValuesPerPoint="2"></asp:Series>
                                                    </Series>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
                                            </div>
                                        </asp:Panel>

                                    </div>
                                </div>
                                <!--
                            <asp:Literal ID="lt" runat="server"></asp:Literal>
                            <div id="gauge_div" style="width: 250px; height: 100px;" />
                            -->



                                <div class="hr-line-dashed"></div>



                            </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="ibox-footer">
                    <span class="pull-right">
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>
                                <div class="wrapper wrapper-content animated fadeInRight" style="color: #191970">
                                    <span class="loading bullet"></span>
                                    Cargado datos espere un momento....    
                                    
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </span>
                    Reporte de Información 
                </div>

            </div>
            <br />

        </div>
    </div>

</asp:Content>
