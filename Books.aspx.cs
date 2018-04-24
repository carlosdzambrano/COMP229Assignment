using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OracleClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Books : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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

    protected void btnExport_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView)sqlExport.Select(DataSourceSelectArguments.Empty);
        string str = "";
        for(int i = 0; i < dv.Table.Rows.Count; i++)
        {
            str += dv.Table.Rows[i][0] + " | ";
        }
        
        using (StreamWriter streamWriter = File.AppendText(MapPath("BooksList.txt")))
        {
            streamWriter.WriteLine(str);
        }
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('All books have been exported')", true);
    }
}