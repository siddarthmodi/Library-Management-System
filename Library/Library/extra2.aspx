<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="extra2.aspx.cs" Inherits="Library.a_delete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style35 {
            border: 2px solid #a1a1a1;
            padding: 10px 40px;
            background: #dddddd;
            width: 1110px;
            border-radius: 25px;
            top: 272px;
            left: 103px;
            position: absolute;
            height: 600px;
        }
        .auto-style36 {
            font-size: 35pt;
            height: 102px;
        }
        .auto-style31 {
            text-align: center;
        }
        .auto-style33 {
            width: 327px;
        }
        .auto-style29 {
            width: 321px;
            text-align: center;
        }
        .auto-style34 {
            width: 56px;
            height: 26px;
            position: absolute;
            left: 390px;
            top: 555px;
            right: 660px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <table class="auto-style4">
        <tr>
            <br />
            <td class="auto-style5">
                <img class="auto-style3" src="gjv.jpg" /></td>
            <td class="auto-style9">Library Managment </td>
        </tr>
        <tr>
            <td class="auto-style8" colspan="2">
                <div id="container">
                    <ul class="menu">
                        <li class="auto-style11">HOME</li>
                        <li class="auto-style12">SERVICES</li>
                        <li class="auto-style12">PORTFOLIO</li>
                        <li class="auto-style12">BLOG</li>
                        <li class="auto-style12" >CONTACT</li>
                        <li class="auto-style12"></li>
                        <li class="auto-style12"></li>
                        <li class="auto-style12"></li>
                        <li class="auto-style13">End</li>
                    </ul>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table class="auto-style35">
                    <tr>
                        <td class="auto-style19"></td>
                        <td class="auto-style36" colspan="2">Extra 2 wid Accn no</td>
                        <td class="auto-style20">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style31">
                            Accession No</td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_accn_no" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style31">
                            <asp:Label ID="Label1" runat="server" Text="ISBN No"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_isbn_no" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style31">
                            <asp:Label ID="Label2" runat="server" Text="Book Title"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_book_title" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style31">
                            <asp:Label ID="Label3" runat="server" Text="Subject"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_subject" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style31">
                            <asp:Label ID="Label4" runat="server" Text="Author"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_author" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style31">
                            <asp:Label ID="Label5" runat="server" Text="Purchase Date"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_purchase_date" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style29">
                            <asp:Label ID="Label6" runat="server" Text="Edition"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_edition" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style29">
                            <asp:Label ID="Label7" runat="server" Text="Price"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_price" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style29">
                            <asp:Label ID="Label8" runat="server" Text="No. Of Pages"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_no_of_pages" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style29">
                            <asp:Label ID="Label9" runat="server" Text="Publisher"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_publisher" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style21"></td>
                        <td class="auto-style23" colspan="2">
                            <asp:Button ID="btn_submit_update" runat="server" CssClass="auto-style34" Text="Submit" />
                        </td>
                        <td class="auto-style23">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

