using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace Library.Librarian
{
    public partial class update : System.Web.UI.Page
    {
        String strtemp = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                String str = Session["lib"].ToString();
                if (int.Parse(str) != 2)
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
            this.GetCustomersPageWise(1);
        }
            
        private void GetCustomersPageWise(int pageIndex)
        {
            string constring = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand("SP_GET_BOOKS_PAGEWISE", con);
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
        protected void tb_records_per_page_TextChanged(object sender, System.EventArgs e)
        {
            this.GetCustomersPageWise(1);
        }
        protected void Page_Changed(object sender, EventArgs e)
        {

            int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
            this.GetCustomersPageWise(pageIndex);

        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.GetCustomersPageWise(1);
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string constring = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("SP_DELETE_BOOK", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@ACCESSION_NUMBER", SqlDbType.VarChar));
                int index = e.RowIndex;
                cmd.Parameters["@ACCESSION_NUMBER"].Value = GridView1.Rows[index].Cells[2].Text;

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>");
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            strtemp = GridView1.SelectedRow.Cells[2].Text.ToString();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string constring = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("SP_UPDATE_BOOK", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@ACCESSION_NO", SqlDbType.VarChar));
                cmd.Parameters.Add(new SqlParameter("@ISBN_NUMBER", SqlDbType.VarChar));
                cmd.Parameters.Add(new SqlParameter("@BOOK_TITLE", SqlDbType.VarChar));
                cmd.Parameters.Add(new SqlParameter("@SUBJECT", SqlDbType.VarChar));
                cmd.Parameters.Add(new SqlParameter("@AUTHOR_NAME", SqlDbType.VarChar));
                cmd.Parameters.Add(new SqlParameter("@EDITION", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@NUMBER_OF_PAGES", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@PUBLISHER_NAME", SqlDbType.VarChar));
                cmd.Parameters["@ACCESSION_NO"].Value = e.NewValues[0].ToString().Trim();
                cmd.Parameters["@ISBN_NUMBER"].Value = e.NewValues[1].ToString().Trim();
                cmd.Parameters["@BOOK_TITLE"].Value = e.NewValues[2].ToString().Trim();
                cmd.Parameters["@SUBJECT"].Value = e.NewValues[3].ToString().Trim();
                cmd.Parameters["@AUTHOR_NAME"].Value = e.NewValues[4].ToString().Trim();
                cmd.Parameters["@PUBLISHER_NAME"].Value = e.NewValues[5].ToString().Trim();
                cmd.Parameters["@EDITION"].Value = int.Parse(e.NewValues[6].ToString().Trim());
                cmd.Parameters["@NUMBER_OF_PAGES"].Value = int.Parse(e.NewValues[7].ToString().Trim());
                //e.NewValues
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>");
            }
            finally
            {
                GridView1.EditIndex = -1;
                this.GetCustomersPageWise(1);
                tb_search.Text = "";
            }
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            this.GetCustomersPageWise(1);
        }
        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }
        protected void Button1_Click1(object sender, System.EventArgs e)
        {

        }
    }
}