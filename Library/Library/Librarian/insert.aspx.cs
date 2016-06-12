using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Library.Librarian
{
    public partial class insert : System.Web.UI.Page
    {
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
            
            
            string constring = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);

            SqlCommand cmd = new SqlCommand("SP_INSERT_BOOK", con);
            try
            {

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@ISBN_NUMBER", SqlDbType.VarChar));
                cmd.Parameters.Add(new SqlParameter("@BOOK_TITLE", SqlDbType.VarChar));
                cmd.Parameters.Add(new SqlParameter("@SUBJECT", SqlDbType.VarChar));
                cmd.Parameters.Add(new SqlParameter("@AUTHOR_NAME", SqlDbType.VarChar));
                cmd.Parameters.Add(new SqlParameter("@PURCHASE_DATE", SqlDbType.Date));
                cmd.Parameters.Add(new SqlParameter("@EDITION", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@PRICE", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@NUMBER_OF_PAGES", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@PUBLISHER_NAME", SqlDbType.VarChar));

                cmd.Parameters["@ISBN_NUMBER"].Value = tb_isbn_no_insert.Text.Trim();
                cmd.Parameters["@BOOK_TITLE"].Value = tb_book_title_insert.Text.Trim();
                cmd.Parameters["@SUBJECT"].Value = tb_subject_insert.Text.Trim();
                cmd.Parameters["@AUTHOR_NAME"].Value = tb_author_insert.Text.Trim();
                cmd.Parameters["@PURCHASE_DATE"].Value = tb_purchase_date_insert.Text.Trim();
                cmd.Parameters["@EDITION"].Value = int.Parse(tb_edition_insert.Text.Trim());
                //Note that date must be given in proper date time
                cmd.Parameters["@PRICE"].Value = int.Parse(tb_price_insert.Text.Trim());
                cmd.Parameters["@NUMBER_OF_PAGES"].Value = int.Parse(tb_no_of_pages_insert.Text.Trim());
                cmd.Parameters["@PUBLISHER_NAME"].Value = tb_no_of_pages_insert.Text.Trim();
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('Data Inserted Successfully!');</script>");
                con.Open();
                cmd.ExecuteNonQuery();
                
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>");
            }
            finally
            {

                con.Close();
                
                tb_author_insert.Text = "";
                tb_book_title_insert.Text = "";
                tb_edition_insert.Text = "";
                tb_isbn_no_insert.Text = "";
                tb_no_of_pages_insert.Text = "";
                tb_price_insert.Text = "";
                tb_publisher_insert.Text = "";
                tb_purchase_date_insert.Text = "";
                tb_subject_insert.Text = "";


            }
        }
    }
}