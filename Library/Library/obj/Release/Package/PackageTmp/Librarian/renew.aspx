<%@ Page Title="" Language="C#" Theme="Theme1" MasterPageFile="~/Lib.master" AutoEventWireup="true" CodeBehind="renew.aspx.cs" Inherits="Library.Librarian.renew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style35 {
            border: 2px solid #a1a1a1;
            padding: 10px 40px;
            background: #dddddd;
            width: 1110px;
            border-radius: 25px;
            top: 274px;
            left: 103px;
            position: absolute;
            height: 470px;
        }
    .auto-style36 {
        font-size: 30pt;
        text-align: center;
    }
        .auto-style32 {
            height: 100px;
            width: 197px;
        }
        .auto-style50 {
            text-align: center;
            height: 40px;
        }
        .auto-style51 {
            width: 197px;
            height: 40px;
        }
        .auto-style57 {
            width: 321px;
            text-align: center;
            height: 40px;
        }
        .auto-style60 {
            height: 20px;
        }
        .auto-style61 {
            height: 39px;
        }
        .auto-style62 {
            text-align: center;
            height: 39px;
        }
        .auto-style63 {
            width: 197px;
            height: 39px;
        }
        .auto-style64 {
            height: 40px;
        }
        .auto-style65 {
            width: 56px;
            height: 26px;
            position: absolute;
            left: 492px;
            top: 447px;
        }
        .auto-style66 {
            text-align: right;
            height: 40px;
        }
        .auto-style67 {
            width: 56px;
            height: 26px;
            position: absolute;
            left: 413px;
            top: 447px;
            right: 637px;
        }
        .auto-style68 {
            width: 100%;
            height: 498px;
        }
        .auto-style69 {
            width: 180px;
        }
        .auto-style70 {
            height: 39px;
            width: 180px;
        }
        .auto-style71 {
            height: 40px;
            width: 180px;
        }
        </style>
    <script type="text/javascript" src="../jquery.js"></script>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <table class="auto-style68">
        
        <tr>
            <td colspan="2">
                <table class="auto-style35">
                    <tr>
                        <td class="auto-style69"></td>
                        <td class="auto-style36">Renew Details</td>
                        <td class="auto-style32"></td>
                        <td class="auto-style20">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style70">&nbsp;</td>
                        <td class="auto-style62">
                            <asp:Label ID="Label1" runat="server" Text="Accession No"></asp:Label>
                        </td>
                        <td class="auto-style63">
                            <asp:TextBox ID="tb_accn_no" runat="server" TextMode="Number" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td class="auto-style61">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_accn_no" ErrorMessage="Accession Number must be given" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style70">&nbsp;</td>
                        <td class="auto-style62">
                            Student ID</td>
                        <td class="auto-style63">
                            <asp:TextBox ID="tb_stu_id" runat="server" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td class="auto-style61">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_stu_id" ErrorMessage="Student ID must be given" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style71"></td>
                        <td class="auto-style66">
                            
                            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Submit" />
                        </td>
                        <td class="auto-style51">
                            &nbsp;</td>
                        <td class="auto-style64">
                            </td>
                    </tr>
                    <tr>
                        <td class="auto-style71">&nbsp;</td>
                        <td class="auto-style50">
                            <asp:Label ID="lb_todays_date" runat="server" Text="Today's Date"></asp:Label>
                        </td>
                        <td class="auto-style51">
                            <asp:TextBox ID="tb_today_date" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td class="auto-style64">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style71"></td>
                        <td class="auto-style50">
                            <asp:Label ID="lb_prev_return_dt" runat="server" Text="Previous Return Date"></asp:Label>
                        </td>
                        <td class="auto-style51">
                            <asp:TextBox ID="tb_prev_return_date" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td class="auto-style64">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style71"></td>
                        <td class="auto-style57">
                            <asp:Label ID="lb_next_return_dt" runat="server" Text="Next Return Date"></asp:Label>
                        </td>
                        <td class="auto-style51">
                            <asp:TextBox ID="tb_next_return_date" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td class="auto-style64">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style71">&nbsp;</td>
                        <td class="auto-style57">
                            <asp:Label ID="lb_fine_to_pay" runat="server" Text="Fine To Pay"></asp:Label>
                        </td>
                        <td class="auto-style51">
                            <asp:TextBox ID="tb_fine_to_pay" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td class="auto-style64">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style71"></td>
                        <td class="auto-style57">
                        </td>
                        <td class="auto-style51">
                        </td>
                        <td class="auto-style64"></td>
                    </tr>
                    <tr>
                        <td colspan="3" rowspan="2">
                            <asp:Button ID="Button1" runat="server" CssClass="auto-style67" Text="Renew" OnClick="Button1_Click" />
                            <asp:Button ID="Button4" runat="server" CssClass="auto-style65" OnClick="Button4_Click" Text="Cancel" />
                        </td>
                        <td class="auto-style60"></td>
                    </tr>
                    <tr>
                        <td class="auto-style60"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>


