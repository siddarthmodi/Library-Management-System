using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/*
 Button1 = Return
 Button2 = Submit
 Button3 = Cancel
*/

namespace Library.Librarian
{
    public partial class _return : System.Web.UI.Page
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

            int temp_result = 0;
            string temp_err_msg= "";
            string book_title = "";
            string publisher_name = "";
            string author_name = "";
            string constring = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand("SP_DELETE_LOAN", con);
            IDataReader idr = null;
            
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@ACCESSION_NO", SqlDbType.BigInt));
                cmd.Parameters.Add(new SqlParameter("@STUDENT_ID", SqlDbType.VarChar));

                cmd.Parameters["@ACCESSION_NO"].Value = int.Parse(tb_accn_no.Text.Trim());
                cmd.Parameters["@STUDENT_ID"].Value = tb_stu_id.Text.Trim();
                con.Open();
                idr = cmd.ExecuteReader();
                while (idr.Read())
                {
                    temp_result = Convert.ToInt32(idr.GetValue(0).ToString());
                    temp_err_msg = idr.GetValue(1).ToString();
                    book_title = idr.GetValue(2).ToString();
                    author_name = idr.GetValue(3).ToString();
                    publisher_name = idr.GetValue(4).ToString();
                }
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('Return Successfull...\\r\\nThe book title is : " + book_title + ".\\r\\nWritten By : " + author_name + ".\\r\\nPublished By : " + publisher_name + "!!!');</script>");

            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>");
            }
            finally
            {
                idr.Close();
                con.Close();

                tb_fine_to_pay.Visible = false;
                tb_return_date.Visible = false;
                tb_date.Visible = false;

                lb_fine_to_pay.Visible = false;
                lb_return_date.Visible = false;
                lb_today_date.Visible = false;

                Button1.Visible = false;
                Button3.Visible = false;

                tb_stu_id.Text = "";
                tb_accn_no.Text = "";
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            int fine = 0;
            String due_date_returned = null;
            int result = 0;
            string errormsg = "";
            string temp_student_id = "";
            string constring = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
            SqlConnection con1 = new SqlConnection(constring);
            SqlConnection con2 = new SqlConnection(constring);
            IDataReader idr1 = null;
            IDataReader idr2 = null;

            SqlCommand cmd1 = new SqlCommand("SP_IS_IN_LOAN_TABLE_UPDATE_DELETE", con1);
            
            try
            {
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add(new SqlParameter("@ACCESSION_NO", SqlDbType.BigInt));
                cmd1.Parameters.Add(new SqlParameter("@STUDENT_ID", SqlDbType.VarChar));
                cmd1.Parameters["@ACCESSION_NO"].Value = int.Parse(tb_accn_no.Text.Trim());
                cmd1.Parameters["@STUDENT_ID"].Value = tb_stu_id.Text.Trim();
                con1.Open();
                idr1 = cmd1.ExecuteReader();

                while (idr1.Read())
                {
                    errormsg = idr1.GetValue(0).ToString();
                    result = Convert.ToInt32(idr1.GetValue(1));
                    temp_student_id = idr1.GetValue(2).ToString();
                }
                if (result == -1)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('The book needs to be issued first !!');</script>");
                    tb_stu_id.Text = "";
                    tb_accn_no.Text = "";
                }

                else if (result == -2)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('The book is already issued to another student with id " + temp_student_id + ".\\r\\n Ask him to return first!!');</script>");
                    tb_stu_id.Text = "";
                    tb_accn_no.Text = "";
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>");
            }
            finally
            {
               idr1.Close();
               con1.Close(); 
            }
            if(result==1)
            {
                tb_fine_to_pay.Visible = true;
                tb_return_date.Visible = true;
                tb_date.Visible = true;

                lb_fine_to_pay.Visible = true;
                lb_return_date.Visible = true;
                lb_today_date.Visible = true;

                Button1.Visible = true;
                Button3.Visible = true;

                SqlCommand cmd2 = new SqlCommand("SP_GET_DATE_DUE_RETURNED", con2);
        
                try
                {
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.Add(new SqlParameter("@ACCESSION_NO", SqlDbType.BigInt));
                    cmd2.Parameters.Add(new SqlParameter("@STUDENT_ID", SqlDbType.VarChar));

                    cmd2.Parameters["@ACCESSION_NO"].Value = int.Parse(tb_accn_no.Text.Trim());
                    cmd2.Parameters["@STUDENT_ID"].Value = tb_stu_id.Text.Trim();
                    con2.Open();
                    idr2 = cmd2.ExecuteReader();

                    while (idr2.Read())
                    {
                        due_date_returned = Convert.ToDateTime(idr2.GetValue(0)).ToShortDateString();
                        fine = Convert.ToInt32(idr2.GetValue(1));

                    }
                }
                catch (Exception ex)
                {

                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>");
                }
                finally
                {
                    idr2.Close();
                    con2.Close();
                    Calendar c = new Calendar();
                    tb_date.Text = c.TodaysDate.ToShortDateString();
                    tb_return_date.Text = due_date_returned.ToString();
                    if (fine < 0)
                        tb_fine_to_pay.Text = "0";
                    else
                        tb_fine_to_pay.Text = fine.ToString();
                }
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            tb_fine_to_pay.Visible = false;
            tb_return_date.Visible = false;
            tb_date.Visible = false;

            lb_fine_to_pay.Visible = false;
            lb_return_date.Visible = false;
            lb_today_date.Visible = false;

            Button1.Visible = false;
            Button3.Visible = false;

            tb_stu_id.Text = "";
            tb_accn_no.Text = "";
        }
    }
}