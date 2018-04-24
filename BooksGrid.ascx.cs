using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BooksGrid : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnAddMore_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddBooks.aspx");
    }

    protected void booksGridID_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["isbn"] = booksGridID.SelectedRow.Cells[3].Text;
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (booksGridID.SelectedRow != null)
        {
            Server.Transfer("BookDetails.aspx");
        }
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please select a book')", true);
    }
}