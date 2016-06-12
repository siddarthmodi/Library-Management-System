<%@ Page Title="" Language="C#" Theme="Theme1" MasterPageFile="~/Student.master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="Library.s_search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style18 {
            width: 90%;
            overflow: auto;
        
            top: 381px;
            left: 166px;
            text-align: left;
            
        }
        .auto-style19 {
            width: 100%;
            height: 51px;
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
        #ContentPlaceHolder1_rptPager_lnkPage_5
        {
            color:white;
        }
        #ContentPlaceHolder1_rptPager_lnkPage_6
        {
            color:white;
        }
        #ContentPlaceHolder1_rptPager_lnkPage_7
        {
            color:white;
        }
        .auto-style20 {
            text-align: left;
        }
        #items
        {
            padding-left:61px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">

         <div id="items">       
        <asp:TextBox ID="tb_search" runat="server" CssClass="auto-style21" TextMode="Search"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button1_Click1" Text="Search" CssClass="auto-style25" />
         <br/>
             <br/>
        <asp:Label ID="Label2" runat="server" Text="Page Size : " CssClass="auto-style23" ForeColor="White"></asp:Label>
        <asp:TextBox ID="tb_records_per_page" runat="server" AutoPostBack="true" OnTextChanged="tb_records_per_page_TextChanged" value="10" Width="24px" CssClass="auto-style24"></asp:TextBox>
                
          </div>
        <table class="auto-style19">
        <tr>
            <td class="auto-style14" colspan="3">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
			
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
			<br />
                        
			            <div class="auto-style18" style="padding-left:61px;">
                            <asp:GridView ID="GridView1" runat="server" Width="100%" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                <FooterStyle BackColor="Tan" />
                                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                            </asp:GridView>
                        </div>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ 

ConnectionStrings:LibraryConnectionString %>" SelectCommand="SP_GET_BOOKS_PAGEWISE_STUDENT" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="tb_search" DefaultValue="NULL" Name="SEARCHTAG" PropertyName="Text" Type="String" />
                                <asp:Parameter Name="PAGEINDEX" Type="Int32" />
                                <asp:ControlParameter ControlID="tb_records_per_page" DefaultValue="10" Name="PAGESIZE" PropertyName="Text" Type="Int32" />
                                <asp:Parameter Direction="InputOutput" Name="RECORDCOUNT" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
			<br />
                        <asp:Repeater ID="rptPager" runat="server">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkPage" runat="server" CommandArgument='<%# Eval("Value") %>' Enabled='<%# Eval("Enabled") %>' OnClick="Page_Changed" Text='<%#Eval("Text") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        </table>
        
</asp:Content>

