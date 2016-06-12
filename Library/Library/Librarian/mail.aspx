<%@ Page Title="" Language="C#" MasterPageFile="~/Lib.master" Theme="Theme1" AutoEventWireup="true" CodeBehind="mail.aspx.cs" Inherits="Library.Librarian.mail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style18 {
            width: 100%;
            height: 561px;
        }
        .auto-style19 {
            height: 49px;
        }
        .auto-style22 {
            height: 49px;
            width: 194px;
        }
        .auto-style23 {
            width: 194px;
        }
        .auto-style24 {
            text-align: center;
        }
        .auto-style27 {
            position: absolute;
            left: 210px;
            top: 332px;
            width: 391px;
            height: 85px;
        }
        .auto-style29 {
            width: 194px;
            height: 55px;
        }
        .auto-style30 {
            width: 194px;
            height: 55px;
            text-align: center;
        }
        .auto-style31 {
            width: 391px;
            height: 85px;
            position: absolute;
            left: 210px;
            top: 440px;
        }
        .auto-style32 {
            height: 49px;
            width: 196px;
        }
        .auto-style33 {
            width: 196px;
        }
        .auto-style34 {
            height: 49px;
            width: 216px;
        }
        .auto-style35 {
            width: 216px;
        }
        .auto-style36 {
            width: 194px;
            height: 73px;
        }
        .auto-style37 {
            width: 216px;
            height: 73px;
            text-align: center;
        }
        .auto-style38 {
            width: 196px;
            height: 73px;
            text-align: center;
        }
        .auto-style39 {
            height: 73px;
        }
        .auto-style40 {
            width: 55px;
            height: 26px;
            position: absolute;
            left: 313px;
            top: 569px;
        }
        .auto-style41 {
            width: 88px;
            height: 26px;
            position: absolute;
            left: 455px;
            top: 569px;
        }
        .auto-style45 {
            height: 55px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style18">
        <tr>
            <td class="auto-style22"></td>
            <td class="auto-style34"></td>
            <td class="auto-style32"></td>
            <td class="auto-style19"></td>
        </tr>
        <tr>
            <td class="auto-style30">
                <asp:Label ID="Label1" runat="server" Text="To" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style24" colspan="2" rowspan="2">
                <asp:TextBox ID="tb_to_address" runat="server" CssClass="auto-style27" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="auto-style45">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style29"></td>
            <td class="auto-style45"></td>
        </tr>
        <tr>
            <td class="auto-style30">
                <asp:Label ID="Label2" runat="server" Text="Message" ForeColor="White"></asp:Label>
            </td>
            <td colspan="2" rowspan="2">
                
                <asp:TextBox ID="tb_message" runat="server" CssClass="auto-style31" TextMode="MultiLine">Kindly return the book in two days else fine will be charged</asp:TextBox>
                
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style29"></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style36"></td>
            <td class="auto-style37">
                <asp:Button ID="check_mail" runat="server" Text="Check" CssClass="auto-style40" OnClick="check_mail_Click" />
            </td>
            <td class="auto-style38">
                <asp:Button ID="send_mail" runat="server" Text="Send Mail" CssClass="auto-style41" OnClick="send_mail_Click" />
            </td>
            <td class="auto-style39"></td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td class="auto-style33">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
