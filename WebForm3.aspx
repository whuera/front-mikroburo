<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="WebForm3.aspx.cs" Inherits="WebApplication_restful_core.Webforms.WebForm3" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div>


        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_OnClick" Text="Button" />


                <asp:Button ID="btnOpenPopUp" OnClick="btnOpenPopUp_OnClick" runat="server" Text="Open PopUp" />
                <asp:Label ID="lblHidden" runat="server" Text=""></asp:Label>
                <ajaxToolkit:ModalPopupExtender BackgroundCssClass="modalBackground" ID="mpePopUp" PopupControlID="Panel1" runat="server" TargetControlID="lblHidden"></ajaxToolkit:ModalPopupExtender>
                <asp:Panel ID="Panel1" runat="server">

                    <div id="divPopUp" class="modal-content animated bounceInRight">
                        <div id="Header" class="modal-header">MyHeader</div>
                        <div id="main" class="main">Main PopUp </div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                            <div id="buttons">
                                <div id="DivbtnOK" class="buttonOK">
                                    <asp:Button ID="btnOk" runat="server" Text="Ok" />
                                </div>
                                <div id="Divbtncancel" class="buttonOK">
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                                </div>
                            </div>
                        </div>
                    </div>

                </asp:Panel>






            </ContentTemplate>
        </asp:UpdatePanel>
        <br />

    </div>
</asp:Content>
