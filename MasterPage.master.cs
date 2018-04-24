using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["username"] == null)
        {
            btnLogout.Text = "Log In";
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


    protected void btnLogout_Click(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            Session["username"] = null;
            Response.Redirect("Default.aspx"); 
        }
        else
        {
            Response.Redirect("addbooks.aspx");
        }
    }
}
