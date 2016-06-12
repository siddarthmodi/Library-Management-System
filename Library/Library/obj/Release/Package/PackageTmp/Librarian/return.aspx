<%@ Page Title="" Language="C#" Theme="Theme1" MasterPageFile="~/Lib.master" AutoEventWireup="true" CodeBehind="return.aspx.cs" Inherits="Library.Librarian._return" %>
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
            height: 476px;
        }
    .auto-style36 {
        font-size: 30pt;
        text-align: center;
            width: 289px;
        }
        .auto-style32 {
            height: 102px;
            width: 162px;
        }
        .auto-style31 {
            text-align: center;
            width: 289px;
        }
        .auto-style33 {
            width: 162px;
        }
        .auto-style38 {
        height: 46px;
    }
    .auto-style39 {
        text-align: center;
        height: 46px;
            width: 289px;
        }
    .auto-style40 {
        width: 162px;
        height: 46px;
    }
        .auto-style41 {
        height: 13px;
    }
        .auto-style34 {
            width: 56px;
            height: 26px;
            position: absolute;
            left: 400px;
            top: 356px;
        }
        .auto-style49 {
            text-align: right;
            width: 289px;
        }
        .auto-style50 {
            height: 40px;
        }
        .auto-style51 {
            width: 289px;
            text-align: center;
            height: 40px;
        }
        .auto-style52 {
            width: 162px;
            height: 40px;
        }
        .auto-style53 {
            width: 60px;
            height: 26px;
            position: absolute;
            left: 492px;
            top: 357px;
        }
        .auto-style54 {
            width: 203px;
        }
        .auto-style55 {
            height: 46px;
            width: 203px;
        }
        .auto-style56 {
            height: 40px;
            width: 203px;
        }
        .auto-style57 {
            height: 13px;
            width: 203px;
        }
        .auto-style58 {
            width: 100%;
            height: 493px;
        }
        </style>
    <script type="text/javascript" src="../jquery.js"></script>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <table class="auto-style58">
        
        <tr>
            <td colspan="2">
                <table class="auto-style35">
                    <tr>
                        <td class="auto-style54"></td>
                        <td class="auto-style36">Return Details</td>
                        <td class="auto-style32"></td>
                        <td class="auto-style20">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style54">&nbsp;</td>
                        <td class="auto-style31">
                            Accession No</td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_accn_no" runat="server" TextMode="Number" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_accn_no" ErrorMessage="Accession Number must be given" ForeColor="Red"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style54">&nbsp;</td>
                        <td class="auto-style31">
                            Student ID</td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_stu_id" runat="server" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_stu_id" ErrorMessage="Student ID must be given" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style54">&nbsp;</td>
                        <td class="auto-style49">
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Submit" />
                        </td>
                        <td class="auto-style33">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style54">&nbsp;</td>
                        <td class="auto-style31">
                            <asp:Label ID="lb_today_date" runat="server" Text="Today's Date" Visible="False"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_date" runat="server" Visible="False" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style54">&nbsp;</td>
                        <td class="auto-style31">
                            <asp:Label ID="lb_return_date" runat="server" Text="Due Return Date" Visible="False"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_return_date" runat="server" Visible="False" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style55"></td>
                        <td class="auto-style39">
                            <asp:Label ID="lb_fine_to_pay" runat="server" Text="Fine to Pay" Visible="False"></asp:Label>
                        </td>
                        <td class="auto-style40">
                            <asp:TextBox ID="tb_fine_to_pay" runat="server" Visible="False" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td class="auto-style38">
                            </td>
                    </tr>
                    <tr>
                        <td class="auto-style56"></td>
                        <td class="auto-style51">
                            </td>
                        <td class="auto-style52">
                            <asp:Button ID="Button3" runat="server" CssClass="auto-style53" OnClick="Button3_Click" Text="Cancel" Visible="False" />
                        </td>
                        <td class="auto-style50"></td>
                    </tr>
                    <tr>
                        <td class="auto-style54">&nbsp;</td>
                        <td class="auto-style31">
                            &nbsp;</td>
                        <td class="auto-style33">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        <td class="auto-style57"></td>
                        <td class="auto-style41" colspan="2">
                            <asp:Button ID="Button1" runat="server" CssClass="auto-style34" Text="Return" OnClick="Button1_Click" Visible="False" />
                        </td>
                        <td class="auto-style41"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>


