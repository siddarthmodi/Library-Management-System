using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
/*
Button 1 = Renew
Button 3 = Submit
Button 4 = Cancel
*/
namespace Library.Librarian
{
    public partial class renew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lb_fine_to_pay.Visible = false;
            lb_next_return_dt.Visible = false;
            lb_prev_return_dt.Visible = false;
            lb_todays_date.Visible = false;

            tb_fine_to_pay.Visible = false;
            tb_next_return_date.Visible = false;
            tb_prev_return_date.Visible = false;
            tb_today_date.Visible = false;

            Button1.Visible = false;
            Button4.Visible = false;
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
            string temp_err_msg = "";
            string book_title = "";
            string author_name = "";
            string publisher_name = "";
            string constring = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand("SP_UPDATE_LOAN", con);
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
                while(idr.Read())
                {
                    temp_result = Convert.ToInt32(idr.GetValue(0).ToString());
                    temp_err_msg = idr.GetValue(1).ToString();
                    book_title = idr.GetValue(2).ToString();
                    author_name = idr.GetValue(3).ToString();
                    publisher_name = idr.GetValue(4).ToString();
                }
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('Renew Completed...\\r\\nThe book title is : " + book_title + ".\\r\\nWritten By : " + author_name + ".\\r\\nPublished By : " + publisher_name + ".\\r\\nPlease return the book on the specfied return date !');</script>");
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
                }
                catch (Exception exe)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + exe.Message + "');</script>");
                }
                finally
                {
                    lb_fine_to_pay.Visible = false;
                    lb_next_return_dt.Visible = false;
                    lb_prev_return_dt.Visible = false;
                    lb_todays_date.Visible = false;

                    tb_fine_to_pay.Visible = false;
                    tb_next_return_date.Visible = false;
                    tb_prev_return_date.Visible = false;
                    tb_today_date.Visible = false;

                    Button1.Visible = false;
                    Button4.Visible = false;

                    tb_accn_no.Text = "";
                    tb_stu_id.Text = "";
            }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
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
                cmd1.Parameters["@STUDENT_ID"].Value = tb_stu_id.Text.Trim();
                cmd1.Parameters["@ACCESSION_NO"].Value = int.Parse(tb_accn_no.Text.Trim());
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
            catch (Exception exe)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + exe.Message + "');</script>");
            }
            finally
            {
                idr1.Close();
                con1.Close();
            }
            if(result==1)
            {

                lb_next_return_dt.Visible = true;
                lb_prev_return_dt.Visible = true;
                lb_todays_date.Visible = true;


                tb_next_return_date.Visible = true;
                tb_prev_return_date.Visible = true;
                tb_today_date.Visible = true;

                Button1.Visible = true;
                Button4.Visible = true;

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
                    
                    tb_today_date.Text = c.TodaysDate.ToShortDateString();
                    tb_prev_return_date.Text = due_date_returned.ToString();
                    DateTime dt = Convert.ToDateTime(tb_prev_return_date.Text);
                    tb_next_return_date.Text = c.TodaysDate.AddDays(15).ToShortDateString();
                    if (fine < 0)
                    {
                        tb_fine_to_pay.Visible = false;
                        lb_fine_to_pay.Visible = false;
                    }
                    else
                    { 
                        tb_fine_to_pay.Visible = true;
                        lb_fine_to_pay.Visible = true;
                        tb_fine_to_pay.Text = fine.ToString();
                    }
                }
            }           
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            lb_fine_to_pay.Visible = false;
            lb_next_return_dt.Visible = false;
            lb_prev_return_dt.Visible = false;
            lb_todays_date.Visible = false;

            tb_fine_to_pay.Visible = false;
            tb_next_return_date.Visible = false;
            tb_prev_return_date.Visible = false;
            tb_today_date.Visible = false;

            Button1.Visible = false;
            Button4.Visible = false;
        }
    }
}