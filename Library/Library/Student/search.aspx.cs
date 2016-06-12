using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Library
{
    public partial class s_search : System.Web.UI.Page
    {
        private void GetCustomersPageWise(int pageIndex)
        {
            string constring = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand("SP_GET_BOOKS_PAGEWISE_STUDENT", con);
            IDataReader idr = null;
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@SEARCHTAG", SqlDbType.VarChar));
                cmd.Parameters.Add(new SqlParameter("@PAGEINDEX", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@PAGESIZE", SqlDbType.Int));
                cmd.Parameters["@SEARCHTAG"].Value = tb_search.Text.Trim();
                cmd.Parameters["@PAGEINDEX"].Value = pageIndex;
                cmd.Parameters["@PAGESIZE"].Value = int.Parse(tb_records_per_page.Text.Trim());
                cmd.Parameters.Add("@RECORDCOUNT", SqlDbType.Int, 4);
                cmd.Parameters["@RECORDCOUNT"].Direction = ParameterDirection.Output;
                con.Open();
                idr = cmd.ExecuteReader();
                GridView1.DataSource = idr;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>");
            }
            finally
            {
                try
                {
                    idr.Close();
                    con.Close();
                    int recordCount = Convert.ToInt32(cmd.Parameters["@RECORDCOUNT"].Value);
                    this.PopulatePager(recordCount, pageIndex);
                }
                catch (Exception exe)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + exe.Message + "');</script>");
                }

            }
        }
        private void PopulatePager(int recordCount, int currentPage)
        {
            double dblPageCount = (double)((decimal)recordCount / decimal.Parse(tb_records_per_page.Text));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                pages.Add(new ListItem("First", "1", currentPage > 1));
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem("Last", pageCount.ToString(), currentPage < pageCount));
            }
            rptPager.DataSource = pages;
            rptPager.DataBind();
        }
        protected void Page_Changed(object sender, EventArgs e)
        {

            int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
            this.GetCustomersPageWise(pageIndex);

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                String str = Session["stu"].ToString();
                if (int.Parse(str) != 3)
                {
                    Session.Add("Failure", -1);
                    Response.Redirect("../Login.aspx");
                }
            }
            catch (Exception ex)
            {
                Session.Add("Failure", -1);
                Response.Redirect("../Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void tb_records_per_page_TextChanged(object sender, EventArgs e)
        {
            this.GetCustomersPageWise(1);
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            this.GetCustomersPageWise(1);
        }
    }
}