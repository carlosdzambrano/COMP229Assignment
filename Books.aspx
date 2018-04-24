<%@ Page Title="Books" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Books.aspx.cs" Inherits="Books" %>

<%@ Register Src="~/BooksGrid.ascx" TagPrefix="uc1" TagName="BooksGrid" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Your Book Collection</h1>
    <asp:Label ID="booksLabel" runat="server" Text=""></asp:Label>
    <uc1:BooksGrid runat="server" id="BooksGrid" />
    <asp:Button runat="server" id="btnExport" Text="Export" OnClick="btnExport_Click"/>
    <asp:SqlDataSource runat="server" ID="sqlExport" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" SelectCommand="SELECT [title] FROM [Books]" ></asp:SqlDataSource>
</asp:Content>

