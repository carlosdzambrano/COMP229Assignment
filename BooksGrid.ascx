<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BooksGrid.ascx.cs" Inherits="BooksGrid" %>
    
    <asp:GridView DataKeyNames="ISBN" CssClass="booksGrid" ID="booksGridID" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="booksDataSource" 
        OnSelectedIndexChanged="booksGridID_SelectedIndexChanged" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title"  />
            <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
            <asp:BoundField DataField="isbn" HeaderText="isbn" SortExpression="isbn" />
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
    <asp:Button ID="btnDetails" runat="server" Text="View Book Details" OnClick="LinkButton2_Click" style="width: 145px"/>

    <asp:SqlDataSource ID="booksDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" 
        SelectCommand="SELECT [title], [author], [isbn] FROM [Books]">
    </asp:SqlDataSource>

    <asp:Button ID="btnAddMore" runat="server" Text="Add More Books" OnClick="btnAddMore_Click" style="width: 145px"/>


