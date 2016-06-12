<%@ Page Title="" Language="C#" MasterPageFile="~/Lib.master" AutoEventWireup="true" CodeBehind="insert.aspx.cs" Inherits="Library.Librarian.insert" Theme="Theme1"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style29 {
            width: 321px;
            text-align: center;
        }

        .auto-style31 {
            text-align: center;
        }

        .auto-style32 {
            height: 102px;
            width: 191px;
        }

        .auto-style33 {
            width: 191px;
        }

        .auto-style34 {
            width: 56px;
            position: absolute;
            left: 544px;
            top: 563px;
        }

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
            font-size: 30pt;
            text-align: center;
        }

        .auto-style37 {
            width: 100%;
            height: 608px;
        }

        .auto-style38 {
            width: 103px;
        }
        .input,textbox
        {
            border-radius:10px;
        }
    </style>
    <script type="text/javascript" src="../jquery.js"></script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <table class="auto-style37">

        <tr>
            <td colspan="2">
                <table class="auto-style35">
                    <tr>
                        <td class="auto-style38"></td>
                        <td class="auto-style36">Enter Book Info</td>
                        <td class="auto-style32"></td>
                        <td class="auto-style20">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style38">&nbsp;</td>
                        <td class="auto-style31">
                            <asp:Label ID="Label1" runat="server" Text="ISBN No"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_isbn_no_insert" runat="server" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_isbn_no_insert" ErrorMessage="ISBN Number must be given" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style38">&nbsp;</td>
                        <td class="auto-style31">
                            <asp:Label ID="Label2" runat="server" Text="Book Title"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_book_title_insert" runat="server" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_book_title_insert" ErrorMessage="Book Title must be given" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style38">&nbsp;</td>
                        <td class="auto-style31">
                            <asp:Label ID="Label3" runat="server" Text="Subject"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_subject_insert" runat="server" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tb_subject_insert" ErrorMessage="Subject must be given" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style38">&nbsp;</td>
                        <td class="auto-style31">
                            <asp:Label ID="Label4" runat="server" Text="Author"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_author_insert" runat="server" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tb_author_insert" ErrorMessage="Author must be given" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style38">&nbsp;</td>
                        <td class="auto-style31">
                            <asp:Label ID="Label5" runat="server" Text="Purchase Date"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_purchase_date_insert" runat="server" TextMode="Date" Width="170px" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tb_purchase_date_insert" ErrorMessage="Purchase Date must be given" ForeColor="Red"></asp:RequiredFieldValidator>

                            <br />

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style38">&nbsp;</td>
                        <td class="auto-style29">
                            <asp:Label ID="Label6" runat="server" Text="Edition"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_edition_insert" runat="server" TextMode="Number" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tb_edition_insert" ErrorMessage="Edition must be given" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style38">&nbsp;</td>
                        <td class="auto-style29">
                            <asp:Label ID="Label7" runat="server" Text="Price"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_price_insert" runat="server" TextMode="Number" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tb_price_insert" ErrorMessage="Price must be given" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style38">&nbsp;</td>
                        <td class="auto-style29">
                            <asp:Label ID="Label8" runat="server" Text="No. Of Pages"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_no_of_pages_insert" runat="server" TextMode="Number" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tb_no_of_pages_insert" ErrorMessage="Number of pages must be given" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style38">&nbsp;</td>
                        <td class="auto-style29">
                            <asp:Label ID="Label9" runat="server" Text="Publisher"></asp:Label>
                        </td>
                        <td class="auto-style33">
                            <asp:TextBox ID="tb_publisher_insert" runat="server" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="tb_publisher_insert" ErrorMessage="Publisher name must be given" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style38"></td>
                        <td class="auto-style23" colspan="2">
                            <asp:Button ID="Button1" runat="server" CssClass="auto-style34" Text="Submit" OnClick="Button1_Click" />
                        </td>
                        <td class="auto-style23"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
