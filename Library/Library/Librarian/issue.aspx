<%@ Page Title="" Language="C#" Theme="Theme1" MasterPageFile="~/Lib.master" AutoEventWireup="true" CodeBehind="issue.aspx.cs" Inherits="Library.Librarian.issue" %>
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
            width: 292px;
        }
        .auto-style32 {
            height: 102px;
            width: 155px;
        }
        .auto-style31 {
            text-align: center;
            width: 292px;
        }
        .auto-style33 {
            width: 155px;
        }
        .auto-style34 {
            width: 56px;
            height: 26px;
            position: absolute;
            left: 259px;
            top: 331px;
        }
        .auto-style38 {
        height: 46px;
    }
    .auto-style39 {
        text-align: center;
        height: 46px;
            width: 292px;
        }
    .auto-style40 {
        width: 155px;
        height: 46px;
    }
    .auto-style41 {
        height: 13px;
    }
    .auto-style43 {
        width: 292px;
        text-align: center;
        height: 3px;
    }
    .auto-style44 {
        width: 155px;
        height: 3px;
    }
    .auto-style45 {
        height: 3px;
    }
    .auto-style46 {
        height: 5px;
    }
    .auto-style47 {
        width: 292px;
        text-align: center;
        height: 5px;
    }
    .auto-style48 {
        width: 155px;
        height: 5px;
    }
    #Content2
    {
        clear:both;
    }
        .auto-style49 {
            width: 100%;
            height: 556px;
        }
        .auto-style50 {
            width: 23px;
        }
        .auto-style51 {
            height: 46px;
            width: 23px;
        }
        .auto-style52 {
            height: 3px;
            width: 23px;
        }
        .auto-style53 {
            height: 5px;
            width: 23px;
        }
        .auto-style54 {
            height: 13px;
            width: 23px;
        }
    </style>
    <script type="text/javascript" src="../jquery.js"></script>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <table class="auto-style49">
           
        <tr>
            <td colspan="2">
                <table class="auto-style35">
                    <tr>
                        <td class="auto-style50"></td>
                        <td class="auto-style36">Issue Details</td>
                        <td class="auto-style32"></td>
                        <td class="auto-style20">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style50">&nbsp;</td>
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
                        <td class="auto-style50">&nbsp;</td>
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
                        <td class="auto-style50">&nbsp;</td>
                        <td class="auto-style31">
                            Today&#39;s
                            Date</td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_date" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style50">&nbsp;</td>
                        <td class="auto-style31">
                            Return Date</td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_return_date" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style51"></td>
                        <td class="auto-style39">
                        </td>
                        <td class="auto-style40">
                        </td>
                        <td class="auto-style38">
                            </td>
                    </tr>
                    <tr>
                        <td class="auto-style50">&nbsp;</td>
                        <td class="auto-style31">
                            &nbsp;</td>
                        <td class="auto-style33">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style50">&nbsp;</td>
                        <td class="auto-style31">
                            &nbsp;</td>
                        <td class="auto-style33">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style52"></td>
                        <td class="auto-style43">
                        </td>
                        <td class="auto-style44">
                        </td>
                        <td class="auto-style45"></td>
                    </tr>
                    <tr>
                        <td class="auto-style53"></td>
                        <td class="auto-style47">
                        </td>
                        <td class="auto-style48">
                        </td>
                        <td class="auto-style46"></td>
                    </tr>
                    <tr>
                        <td class="auto-style54"></td>
                        <td class="auto-style41" colspan="2">
                            <asp:Button ID="Button1" runat="server" CssClass="auto-style34" Text="Submit" OnClick="Button1_Click" />
                        </td>
                        <td class="auto-style41"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>


