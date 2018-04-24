<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GenreDDL.ascx.cs" Inherits="GenreDDL" %>
<asp:DropDownList ID="ddlGenre" runat="server" DataSourceID="GenreSqlDataSource" DataTextField="GENRE" 
    DataValueField="GENRE" CssClass="ddl" OnSelectedIndexChanged="ddlGenre_SelectedIndexChanged" 
    AutoPostBack="True"></asp:DropDownList>
<asp:SqlDataSource ID="GenreSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" SelectCommand="SELECT DISTINCT [genre] FROM [Books]"></asp:SqlDataSource>
<br />Genre not available? Add it here:
        <asp:TextBox ID="txtNewGenre" runat="server" ValidationGroup="genre"></asp:TextBox>
        <asp:Button ID="btnNewGenre" runat="server" OnClick="btnNewGenre_Click" Text="Add" ValidationGroup="genre"/>