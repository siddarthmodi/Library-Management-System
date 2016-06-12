<%@ Page Language="C#" AutoEventWireup="true" Theme="Theme1" CodeBehind="Login.aspx.cs" Inherits="Library.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">
        .auto-style12 {
            width: 93%;
            top: 30px;
            left: 19px;
            position: absolute;
            height: 240px;
        }
        .innertable
        {
            border: 2px solid #a1a1a1;
            padding: 10px 40px; 
            background: #dddddd;
            width: 410px;
            border-radius: 25px;
            top: 167px;
            left: 86px;
            position: absolute;
            height: 304px;
        }
        .rules
        {
            border: 2px solid #a1a1a1;
            padding: 10px 40px; 
            width: 410px;
            border-radius: 25px;
            top: 170px;
            left: 718px;
            position: absolute;
            height: 304px;
            background-color:#dddddd;
        }
        .auto-style14 {
        }
        .auto-style15 {
            width: 218px;
            text-align: left;
            height: 41px;
        }
        .auto-style16 {
            height: 41px;
        }
        .auto-style17 {
            font-family: "Times New Roman", Times, serif;
        }
        .auto-style18 {
            width: 117px;
            text-align: left;
            font-family: "Times New Roman", Times, serif;
            height: 40px;
        }
        .auto-style20 {
            width: 218px;
            text-align: left;
            height: 40px;
        }
        .auto-style23 {
            width: 117px;
            text-align: left;
            height: 40px;
        }
        .auto-style24 {
            width: 98%;
            top: 0px;
            left: 5px;
            position: absolute;
            height: 318px;
        }
        .auto-style26 {
            height: 57px;
        }
        .auto-style28 {
            width: 25px;
            font-weight: 700;
            text-align: right;
            height: 26px;
        }
        .auto-style29 {
            height: 26px;
            text-align: justify;
        }
        .auto-style34 {
            width: 25px;
            font-weight: 700;
            text-align: right;
            height: 27px;
        }
        .auto-style35 {
            height: 27px;
        }
        .auto-style36 {
            width: 711px;
            height: 68px;
            position: absolute;
            left: 340px;
            top: 33px;
        }
        body
        {
            background-color:#06213f;
        }
        </style>
</head>
<body >
    <form id="form1" runat="server">
    <div style="width: 100%">
    
        <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl="~/gjv.jpg" Width="250px" />

        <asp:Label ID="Label3" runat="server" Text="Library Management" CssClass="auto-style36" Font-Bold="False" Font-Size="50pt" ForeColor="White" Font-Names="Times New Roman"></asp:Label>
        <hr />
        </div>
        
        <div class ="rules">
        <table class="auto-style24">
            <tr>
                <td class="auto-style26" colspan="2"></td>
            </tr>
            <tr>
                <td class="auto-style28">1.</td>
                <td class="auto-style29">
                    <asp:Label ID="Label2" runat="server" style="top: 3px; left: 25px; position: absolute; height: 62px; width: 128px; font-size: 40pt" Text="Rules"></asp:Label>
                    Library Cards and books are not transferable.</td>
            </tr>
            <tr>
                <td class="auto-style28">2.</td>
                <td class="auto-style29">Books will be issued for a period of 15 days.</td>
            </tr>
            <tr>
                <td class="auto-style28">3.</td>
                <td class="auto-style29">A fine of ₹.2/- will be levied per day after the due date.</td>
            </tr>
            <tr>
                <td class="auto-style28">4.</td>
                <td class="auto-style29">Report Immediately the loss of card / books.</td>
            </tr>
            <tr>
                <td class="auto-style28">5.</td>
                <td class="auto-style29">See the library notice board from time to time.</td>
            </tr>
            <tr>
                <td class="auto-style34">6.</td>
                <td class="auto-style35">A fine of ₹. 50/- will be levied for issue of duplicate library card.</td>
            </tr>
            <tr>
                <td class="auto-style34">7.</td>
                <td class="auto-style35">The card has to be surrendered before the issue of hall ticket.</td>
            </tr>
            <tr>
                <td class="auto-style34">8.</td>
                <td class="auto-style35">Violation of the above rules will be viewed seriously</td>
            </tr>
        </table>
            </div>
    <p class="auto-style17">
        &nbsp;</p>
    <p class="auto-style17">
        &nbsp;</p>
    <div class ="innertable">
    <table class="auto-style12">
        <tr>
            <td class="auto-style14" colspan="2">
                <asp:Label ID="Label1" runat="server" style="top: -18px; left: 153px; position: absolute; height: 62px; width: 128px; font-size: 40pt" Text="Login"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style18">Username</td>
            <td class="auto-style20">
                <asp:TextBox ID="tb_username" runat="server" CssClass="auto-style17" Width="180px" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style23">Password</td>
            <td class="auto-style20">
                <asp:TextBox ID="tb_password" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">&nbsp;</td>
            <td class="auto-style15">
                <asp:Button ID="btn_submit_login" runat="server" style="top: 220px; left: 188px; position: absolute; width: 61px" Text="Submit" OnClick="User_Submit" />
            </td>
        </tr>
    </table>
        </div>
    </form>
    </body>
</html>
