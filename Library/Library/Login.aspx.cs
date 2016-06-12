using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Library
{

    public partial class Login : System.Web.UI.Page
    {
        SqlConnection myconn = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            int fail=0;
            try
            {
                fail = int.Parse(Session["failure"].ToString());
            }
            catch (Exception ex)
            {
                
                
            }
            if(fail == -1)
            {

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('Please login first!!');</script>");
            }
        }
        protected void User_Submit(object sender, EventArgs e)
        {
            Boolean good = false;
            String errormsg = "";
            int roleid = 0;
            try
            {
                string constring = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("SP_LOGIN_VERIFICATION", con);
                IDataReader idr = null;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@USERNAME", SqlDbType.VarChar));
                cmd.Parameters.Add(new SqlParameter("@PASSWORD", SqlDbType.VarChar));
                cmd.Parameters["@USERNAME"].Value = tb_username.Text.ToString().Trim();
                cmd.Parameters["@PASSWORD"].Value = tb_password.Text.ToString().Trim();
                con.Open();
                idr = cmd.ExecuteReader();
                while (idr.Read())
                {
                    good = Convert.ToBoolean(idr.GetValue(0));
                    errormsg = idr.GetValue(1).ToString();
                    roleid = Convert.ToInt16(idr.GetValue(2));
                }
                con.Close();
            }
            catch (Exception ex)
            {            
               Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>");
            }
            finally
            {
                if (good)
                {
                    if (roleid == 1)
                    {
                        Session.Add("admin", roleid);
                        Response.Redirect("~/Admin/update.aspx");
                    }
                    else if (roleid == 2)
                    {
                        Session.Add("lib", roleid);
                        Response.Redirect("~/Librarian/insert.aspx");
                    }
                    else if (roleid == 3)
                    {
                        Session.Add("stu", roleid);
                        Session.Add("stu_id",tb_username.Text);
                        Response.Redirect("~/Student/search.aspx");
                    }
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + errormsg + "');</script>");
                }
                tb_username.Text = "";
                tb_password.Text = "";
            }
            





            //Response.Redirect("Student/profile.aspx");    
        }
    }
}