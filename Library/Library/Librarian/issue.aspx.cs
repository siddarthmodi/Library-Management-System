using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web;

namespace Library.Librarian
{
    public partial class issue : System.Web.UI.Page
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
            Calendar c = new Calendar();
            tb_date.Text = c.TodaysDate.ToShortDateString();
            tb_return_date.Text = c.TodaysDate.AddDays(15).ToShortDateString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int result = 0;
            string errormsg = "";
            string book_title = "";
            string publisher_name = "";
            string author_name = "";
            int result1 = 0;
            string temp_student_id = "";
            string errormsg1 = "";
            string constring = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            SqlConnection con1 = new SqlConnection(constring);
            SqlConnection con2 = new SqlConnection(constring);
            IDataReader idr = null;
            IDataReader idr1 = null;
            IDataReader idr2 = null;

            SqlCommand cmd = new SqlCommand("SP_CAN_GET_LOAN", con);

            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@STUDENT_ID", SqlDbType.VarChar));
                cmd.Parameters["@STUDENT_ID"].Value = tb_stu_id.Text.Trim();
                con.Open();
                idr = cmd.ExecuteReader();
                while (idr.Read())
                {
                    result = Convert.ToInt32(idr.GetValue(0));
                    errormsg = idr.GetValue(1).ToString();
                }
                if (tb_stu_id.Text.Length < 10 || tb_stu_id.Text.Length > 10)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('Please enter valid Student ID !');</script>");
                    tb_accn_no.Text = "";
                    tb_stu_id.Text = "";
                }
                else if (result == -1)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('Cant make more than TWO issues !');</script>");
                    tb_accn_no.Text = "";
                    tb_stu_id.Text = "";
                }
                else
                {
                    SqlCommand cmd1 = new SqlCommand("SP_IS_IN_LOAN_TABLE_ISSUE", con1);
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
                            errormsg1 = idr1.GetValue(0).ToString();
                            result1 = Convert.ToInt32(idr1.GetValue(1));
                            temp_student_id = idr1.GetValue(2).ToString();
                        }
                        if (result1 == -1)
                        {
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('The book is already issued to you so either return or renew !!');</script>");
                            tb_accn_no.Text = "";
                            tb_stu_id.Text = "";
                        }
                        else if (result1 == -2)
                        {
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('The book is already issued to another student with id " + temp_student_id + ".');</script>");
                            tb_accn_no.Text = "";
                            tb_stu_id.Text = "";
                        }

                        else
                        {
                            try
                            {
                                SqlCommand cmd2 = new SqlCommand("SP_INSERT_LOAN", con2);
                                cmd2.CommandType = CommandType.StoredProcedure;
                                cmd2.Parameters.Add(new SqlParameter("@ACCESSION_NO", SqlDbType.BigInt));
                                cmd2.Parameters.Add(new SqlParameter("@STUDENT_ID", SqlDbType.VarChar));
                                cmd2.Parameters["@ACCESSION_NO"].Value = int.Parse(tb_accn_no.Text.Trim());
                                cmd2.Parameters["@STUDENT_ID"].Value = tb_stu_id.Text.Trim();
                                con2.Open();
                                idr2 = cmd2.ExecuteReader();
                                int temp_result = 0;
                                string temp_err_msg = "";
                                while (idr2.Read())
                                {
                                    temp_result = Convert.ToInt32(idr2.GetValue(0).ToString());
                                    temp_err_msg = idr2.GetValue(1).ToString();
                                    book_title = idr2.GetValue(2).ToString();
                                    author_name = idr2.GetValue(3).ToString();
                                    publisher_name = idr2.GetValue(4).ToString();
                                }
                                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('Issue Completed...\\r\\nThe book title is : " + book_title + "\\r\\n Written By : " + author_name + "\\r\\n Published By : " + publisher_name + ".\\r\\n Please return the book on the specfied return date !');</script>");
                                tb_accn_no.Text = "";
                                tb_stu_id.Text = "";
                            }
                            catch (Exception ex)
                            {
                                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>");
                            }
                            finally
                            {
                                idr2.Close();
                                con2.Close();
                            }
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
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>");
            }
            finally
            {
                idr.Close();
                con.Close();
            }
        }
    }
}
