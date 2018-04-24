<%@ Page Title="Search" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<%@ Register src="GenreDDL.ascx" tagname="GenreDDL" tagprefix="uc1" %>
<%@ Register Src="~/GenreDDL.ascx" TagPrefix="uc2" TagName="GenreDDL" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <h1>Select a genre</h1>
    
        <%--<asp:DropDownList ID="ddlFriend" runat="server" DataSourceID="FriendDataSource" DataTextField="friend" DataValueField="friend">
        </asp:DropDownList>--%>
    <asp:DropDownList ID="ddlGenre" runat="server" DataSourceID="GenreSqlDataSource" DataTextField="GENRE" 
    DataValueField="GENRE" CssClass="ddl" OnSelectedIndexChanged="ddlGenre_SelectedIndexChanged" 
    AutoPostBack="True"></asp:DropDownList>
    <asp:SqlDataSource ID="GenreSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" SelectCommand="SELECT DISTINCT [genre] FROM [Books]"></asp:SqlDataSource>
    <br />Genre not available? Add it here:
        <asp:TextBox ID="txtNewGenre" runat="server" ValidationGroup="genre"></asp:TextBox>
        <asp:Button ID="btnNewGenre" runat="server" OnClick="btnNewGenre_Click" Text="Add" ValidationGroup="genre"/>
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />

        <%--<asp:SqlDataSource ID="FriendDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" SelectCommand="SELECT DISTINCT [friend] FROM [Books]"></asp:SqlDataSource>--%>

    <asp:GridView ID="booksGrid" runat="server" AutoGenerateColumns="False" AllowSorting="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" DataKeyNames="isbn" DataSourceID="OGenreSqlDataSource">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
            <asp:BoundField DataField="isbn" HeaderText="isbn" ReadOnly="True" SortExpression="isbn" />
            <asp:BoundField DataField="pages" HeaderText="pages" SortExpression="pages" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
    <asp:SqlDataSource ID="OGenreSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" 
        SelectCommand="SELECT [title], [author], [isbn], [pages] FROM [Books] WHERE ([genre] = @genre)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlGenre" Name="genre" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        </asp:SqlDataSource>
        <%--<asp:SqlDataSource ID="OFriendSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" SelectCommand="SELECT [title], [author], [isbn], [pages] FROM [Books] WHERE ([friend] = @friend)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlFriend" Name="friend" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>--%>        <%--<asp:SqlDataSource ID="BSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" SelectCommand="SELECT [title], [isbn], [author], [pages] FROM [Books] WHERE (([genre] = @genre) AND ([friend] = @friend))">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlGenre" Name="genre" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlFriend" Name="friend" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
        <asp:SqlDataSource ID="NSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" SelectCommand="SELECT [title], [author], [isbn], [pages] FROM [Books]"></asp:SqlDataSource>
        
</asp:Content>

