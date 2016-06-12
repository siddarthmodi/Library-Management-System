using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace Library.Librarian
{
    public partial class mail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            send_mail.Visible = false;
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

        protected void check_mail_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand("SP_GET_EMAIL_ID", con);
            IDataReader idr = null;
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                idr = cmd.ExecuteReader();
                while(idr.Read())
                {
                    tb_to_address.Text += idr.GetString(0).Trim() + ",";
                }
                send_mail.Visible = true;
            }
            catch(Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>");
            }
        }

        protected void send_mail_Click(object sender, EventArgs e)
        {
            if (tb_to_address.Text == "")
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('No Mails today!!');</script>");
            }
            else
            {
                try
                {
                    String myemailid = "yvss.santosh@gmail.com";
                    String mypassword = "Santosh_taurus6";
                    //get the email id and password from file
                    SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                    client.EnableSsl = true;
                    client.Timeout = 10000;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential(myemailid, mypassword);
                    MailMessage message = new MailMessage();
                    string[] email_arr = tb_to_address.Text.Split(',');
                    foreach (String email in email_arr)
                        message.To.Add(email);
                    message.From = new MailAddress(myemailid);
                    message.Subject = "KMIT Library";
                    message.Body = tb_message.Text;
                    client.Send(message);
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('Mail sent successfully!!');</script>");
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type=\"text/javascript\">alert('" + ex.Message + "');</script>");
                }
            }
        }
    }
}