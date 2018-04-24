using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Support : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSend_Click(object sender, EventArgs e)
    {

        try
        {
            MailMessage mm = new MailMessage(txtFrom.Text, "carlosdzambrano@outlook.com");
            mm.Subject = txtSubject.Text;
            mm.Body = txtBody.Text;
            if (fuAttachment.HasFile == true)
            {
                string FileName = Path.GetFileName(fuAttachment.PostedFile.FileName);
                mm.Attachments.Add(new Attachment(fuAttachment.PostedFile.InputStream, FileName));
            }

            SmtpClient smtp = new SmtpClient("smtp.outlook.com", 587);
            smtp.Credentials = new System.Net.NetworkCredential()
            {
                UserName = txtFrom.Text,
                Password = txtPassword.Text
            };
            smtp.EnableSsl = true;
            smtp.Send(mm);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We will get back to you as soon as possible')", true);
            Response.Redirect("default.aspx");
        }
        catch (Exception ex)
        {
            txtBody.Text = ex.Message;
        }
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        string theme;
        theme = (string)Session["theme"];
        if ((theme != null) && (theme.Length != 0))
        {
            Page.Theme = theme;
        }
        else
        {
            Page.Theme = "Light";
        }
    }
}