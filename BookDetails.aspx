<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookDetails.aspx.cs" Inherits="BookDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:DetailsView CssClass="table" ID="bookDetails" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="bookDataSource" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" DataKeyNames="isbn" OnItemDeleted="bookDetails_ItemDeleted">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <Fields>
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
            <asp:BoundField DataField="isbn" HeaderText="isbn" SortExpression="isbn" ReadOnly="True" />
            <asp:BoundField DataField="genre" HeaderText="genre" SortExpression="genre" />
            <asp:BoundField DataField="pages" HeaderText="pages" SortExpression="pages" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>

        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <HeaderTemplate>
            <%# Eval("title")%>
        </HeaderTemplate>
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />

    </asp:DetailsView>

    
    <asp:SqlDataSource ID="bookDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" 
        SelectCommand="SELECT [title], [author], [isbn], [genre], [pages] FROM [Books] WHERE ([isbn] = @isbn)" 
        DeleteCommand="DELETE FROM [Books] WHERE [isbn] = @isbn" UpdateCommand="UPDATE [Books] SET [title] = @title, [author] = @author, [genre] = @genre, [pages] = @pages WHERE [isbn] = @isbn">
        <DeleteParameters>
            <asp:Parameter Name="isbn" Type="String" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter Name="isbn" SessionField="isbn" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="author" Type="String" />
            <asp:Parameter Name="genre" Type="String" />
            <asp:Parameter Name="pages" Type="Decimal" />
            <asp:Parameter Name="isbn" Type="String" />
        </UpdateParameters>

    </asp:SqlDataSource>
</asp:Content>

