using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Book
/// </summary>
public class Book
{
    private string name;
    private string author;
    private string isbn;
    private string genre;
    private int    noOfPages;
    private bool   lended;
    private string friend;
    private string comment;
    
    public Book()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Book(string name, string author, string isbn, string genre, int noOfPages, bool lended, string friend, string comment)
    {
        this.name = name;
        this.author = author;
        this.isbn = isbn;
        this.genre = genre;
        this.noOfPages = noOfPages;
        this.lended = lended;
        this.friend = friend;
        this.comment = comment;
    }

    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    public string Author { get => author; set => author = value; }
    public string Isbn { get => isbn; set => isbn = value; }
    public string Genre { get => genre; set => genre = value; }
    public int NoOfPages { get => noOfPages; set => noOfPages = value; }
    public bool Lended { get => lended; set => lended = value; }
    public string Friend { get => friend; set => friend = value; }
    public string Comment { get => comment; set => comment = value; }


}