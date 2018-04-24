using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.PreviousPage != null)
        {
            GridView GridView1 = (GridView)Page.PreviousPage.FindControl("booksGridID");
            //GridViewRow selectedRow = GridView1.SelectedRow;
            //Session["isbn"] = GridView1.SelectedValue;
        }

        if (Session["username"] == null)
        {
            LinkButton btnEdit = (LinkButton)bookDetails.FindControl("btnEdit");
            btnEdit.Visible = false;
            LinkButton btnDelete = (LinkButton)bookDetails.FindControl("btnDelete");
            btnDelete.Visible = false;
        }
        else
        {
            LinkButton btnEdit = (LinkButton)bookDetails.FindControl("btnEdit");
            btnEdit.Visible = true;
            LinkButton btnDelete = (LinkButton)bookDetails.FindControl("btnDelete");
            btnDelete.Visible = true;
        }
    }

    protected void bookDetails_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        Server.Transfer("Books.aspx");
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