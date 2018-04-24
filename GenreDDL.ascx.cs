using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GenreDDL : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }

    protected void btnNewGenre_Click(object sender, EventArgs e)
    {
        if(txtNewGenre.Text != "")
            ddlGenre.Items.Insert(1, new ListItem(txtNewGenre.Text, txtNewGenre.Text));
        //ddlGenre.DataBind();
    }

    protected void ddlGenre_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}