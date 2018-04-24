using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       //if(!IsPostBack)
       // {
            ddlGenre.Items.Insert(0, new ListItem("All", "All"));
        //}
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
    protected void btnNewGenre_Click(object sender, EventArgs e)
    {
        if (txtNewGenre.Text != "")
            ddlGenre.Items.Insert(1, new ListItem(txtNewGenre.Text, txtNewGenre.Text));
        //ddlGenre.DataBind();
    }

    protected void ddlGenre_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //if (ddlGenre.SelectedValue == "All") //&& ddlFriend.SelectedValue == "All")
        //{
        //    //booksGrid.DataSource = NSqlDataSource;
        //    //booksGrid.DataBind();
            
        //    SqlDataAdapter comm = new SqlDataAdapter("SELECT title, author, isbn, pages FROM books", ConfigurationManager.ConnectionStrings["BooksConnectionString"].ConnectionString);
        //    DataSet obj = new DataSet();
        //    comm.Fill(obj);

        //    booksGrid.DataSource = obj;
        //    booksGrid.DataBind();

        //}
        ////else if (ddlGenre.SelectedValue == "All" && ddlFriend.SelectedValue != "All")
        ////{
        ////    //booksGrid.DataSource = OFriendSqlDataSource;
        ////    SqlDataAdapter adapter = new SqlDataAdapter("select title, author, isbn, pages from books where friend = @friend;", ConfigurationManager.ConnectionStrings["BooksConnectionString"].ConnectionString);
        ////    adapter.SelectCommand.Parameters.AddWithValue("@friend", ddlFriend.SelectedValue);
        ////    DataSet dataSet = new DataSet();
        ////    adapter.Fill(dataSet);

        ////    booksGrid.DataSource = dataSet;
        ////    booksGrid.DataBind();
        ////}
        //else if (ddlGenre.SelectedValue != "All") //&& ddlFriend.SelectedValue == "All")
        //{
        //    //booksGrid.DataSource = OGenreSqlDataSource;
        //    SqlDataAdapter adapter = new SqlDataAdapter("select title, author, isbn, pages from books where genre = @genre;", ConfigurationManager.ConnectionStrings["BooksConnectionString"].ConnectionString);
        //    adapter.SelectCommand.Parameters.AddWithValue("@genre", ddlGenre.SelectedValue);
        //    DataSet dataSet = new DataSet();
        //    adapter.Fill(dataSet);

        //    booksGrid.DataSource = dataSet;
        //    booksGrid.DataBind();
        //}
        //else
        //{
        //    //booksGrid.DataSource = BSqlDataSource.SelectCommand;

        //    SqlDataAdapter adapter = new SqlDataAdapter("select title, author, isbn, pages from books", ConfigurationManager.ConnectionStrings["BooksConnectionString"].ConnectionString);
        //    DataSet dataSet = new DataSet();
        //    adapter.Fill(dataSet);

        //    booksGrid.DataSource = dataSet;

        //    booksGrid.DataBind();

        //}
    }
}