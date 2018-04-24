using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddBooks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            MultiView1.SetActiveView(loginView);
            LinkButton btnLogout = (LinkButton)Master.FindControl("btnLogout");
            btnLogout.Visible = false;
            Label lblWelcome = (Label)Master.FindControl("lblWelcome");
            lblWelcome.Text = "";
        }
        else
        {
            MultiView1.SetActiveView(contentView);
            LinkButton btnLogout = (LinkButton)Master.FindControl("btnLogout");
            btnLogout.Visible = true;
            Label lblWelcome = (Label)Master.FindControl("lblWelcome");
            lblWelcome.Text = "Welcome " + (string)Session["username"];
        }
        reqFriend.Enabled = false;
    }

    private void AddBook()
    {
        DropDownList ddlGenre = (DropDownList)GenreDDL1.FindControl("ddlGenre");
        string genre = ddlGenre.SelectedValue;
        SqlConnection conn;
        SqlCommand comm;
        // Read the connection string from Web.config
        string connectionString =
            ConfigurationManager.ConnectionStrings[
            "BooksConnectionString"].ConnectionString;
        // Initialize connection
        conn = new SqlConnection(connectionString);
        // Create command
        comm = new SqlCommand(
          "insert into [books] values ('" + txtName.Text + "', '" + txtAuthor.Text + "', " +
          "'" + txtISBN.Text + "', '" + txtPages.Text + "', '" + genre + "', '" + txtFriend.Text + "', '"+ txtComments.Text +"')"
          ,
          conn);

        try
        {
            conn.Open();

            comm.ExecuteReader();

        }
        finally
        {
            conn.Close();
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        AddBook();

        Response.Redirect("Books.aspx");

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }


    protected void ckboxYes_CheckedChanged(object sender, EventArgs e)
    {
        if (ckboxYes.Checked)
            reqFriend.Enabled = true;
        else
            reqFriend.Enabled = false;
    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(contentView);
        Session["username"] = txtLUser.Text;
        LinkButton btnLogout = (LinkButton)Master.FindControl("btnLogout");
        btnLogout.Text = "Log Out";
        Response.Redirect(Request.FilePath);
        //Response.Redirect("default.aspx");
    }

    protected void btnReg_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(registerView);
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        // Define data objects
        SqlConnection conn;
        SqlCommand comm;
        // Read the connection string from Web.config
        string connectionString =
            ConfigurationManager.ConnectionStrings[
            "BooksConnectionString"].ConnectionString;
        // Initialize connection
        conn = new SqlConnection(connectionString);
        // Create command 
        string sqlString = "insert into account values (@username, @password)";
        comm = new SqlCommand(sqlString, conn);

        comm.Parameters.Add("@username", System.Data.SqlDbType.Text);
        comm.Parameters["@username"].Value = txtRUser.Text;
        comm.Parameters.Add("@password", System.Data.SqlDbType.VarChar);
        comm.Parameters["@password"].Value = txtRPass.Text;

        try
        {
            conn.Open();

            comm.ExecuteNonQuery();

            MultiView1.SetActiveView(contentView);
            Session["username"] = txtRUser.Text;
            Response.Redirect("Default.aspx");
        }
        catch
        {
            throw;

        }
        finally
        {
            conn.Close();
        }

    }
}