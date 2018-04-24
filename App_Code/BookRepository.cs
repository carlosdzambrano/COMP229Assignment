using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookRepository
/// </summary>
public class BookRepository
{
    List<Book> bookList;
    public BookRepository()
    {
        bookList = new List<Book>();
    }

    public List<Book> GetAllBooks()
    {
        return bookList;
    }

    public void AddBook(Book aBook)
    {
        bookList.Add(aBook);
    }

    public void RemoveBook(Book aBook)
    {
        bookList.Remove(aBook);
    }
}