<%@ Page Title="" Language="C#" Theme="Theme1" MasterPageFile="~/Lib.master" AutoEventWireup="true" CodeBehind="update.aspx.cs" Inherits="Library.Librarian.update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #ContentPlaceHolder1
        {
            clear:both;
            padding-left:100px;
        }
        .auto-style18 {
            width: 90%;
            overflow: auto;
            padding-left:30px;
            top: 381px;
            left: 166px;
            text-align: left;
            padding-left:30px;
        }
        #ContentPlaceHolder1_rptPager_lnkPage_0
        {
            padding-left:65px;
            color:white;
        }
        #ContentPlaceHolder1_rptPager_lnkPage_1
        {
            color:white;
        }
        #ContentPlaceHolder1_rptPager_lnkPage_2
        {
            color:white;
        }
        #ContentPlaceHolder1_rptPager_lnkPage_3
        {
            color:white;
        }
        #ContentPlaceHolder1_rptPager_lnkPage_4
        {
            color:white;
        }
       
        #items
        {
            padding-left:61px;
        }
        
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>
			<div id="items">
			<asp:TextBox ID="tb_search" runat="server" TextMode="Search"></asp:TextBox>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
			<br />
			<br />
			<br />
			
			<asp:Label ID="Label1" runat="server" Text="Page Size : " ForeColor="White"></asp:Label>
			&nbsp;&nbsp;&nbsp;
			
			<asp:TextBox ID="tb_records_per_page" value ="10" AutoPostBack="true" runat="server" OnTextChanged="tb_records_per_page_TextChanged" Width="24px"></asp:TextBox>
			<br />
			<br />
                </div>
            <div class="auto-style18" style ="padding-left:31px">
                <div style="padding-left:31px">
			<asp:GridView ID="GridView1" runat="server" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" >
				<AlternatingRowStyle BackColor="PaleGoldenrod" />
				<Columns>
                    <asp:CommandField HeaderText="Edit" ShowEditButton="True" ShowHeader="True" />
                </Columns>
			    <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
			</asp:GridView></div>
                </div>
			<br />
			<asp:Repeater ID="rptPager" runat="server" >
				<ItemTemplate>
					<asp:LinkButton ID="lnkPage" runat="server" Text = '<%#Eval("Text") %>' CommandArgument = '<%# Eval("Value") %>' Enabled = '<%# Eval("Enabled") %>' OnClick = "Page_Changed"></asp:LinkButton>
				</ItemTemplate>
			</asp:Repeater>
		</ContentTemplate>
	</asp:UpdatePanel><br /><br />
</asp:Content>


