<%@ Page Title="Add Books" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddBooks.aspx.cs" Inherits="AddBooks" %>

<%@ Register src="GenreDDL.ascx" tagname="GenreDDL" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">

        <asp:View runat="server" ID="contentView">
            <h1>Welcome, add books here</h1>
            <p>
                <asp:Label ID="lblName" runat="server" Text="Name of book: "></asp:Label>
                <asp:TextBox ID="txtName"  runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="<br/>Name of book is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="lblAuthor" runat="server" Text="Author:"></asp:Label>
                <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAuthor" ErrorMessage="<br/>Author is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="lblISBN" runat="server" Text="ISBN:"></asp:Label>
                <asp:TextBox ID="txtISBN" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<br/>ISBN is required" ForeColor="Red" Display="Dynamic" ControlToValidate="txtISBN"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="lblGenre"  runat="server" Text="Genre:"></asp:Label>
               
                <uc1:GenreDDL ID="GenreDDL1" runat="server" />
            </p>
            <p>
                <asp:Label ID="Label1"  runat="server" Text="Number of pages:"></asp:Label>
                <asp:TextBox ID="txtPages"  runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="&lt;br/&gt;Number of pages is required" ForeColor="Red" ControlToValidate="txtPages"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" ErrorMessage="&lt;br/&gt;Number must be a positive number" ForeColor="Red" Operator="GreaterThan" Type="Integer" ValueToCompare="0" ControlToValidate="txtPages"></asp:CompareValidator>
            </p>
            <p>
                <asp:Label ID="lblLend"  runat="server" Text="lended to a friend?:"></asp:Label>
                &nbsp;<asp:CheckBox ID="ckboxYes" runat="server" OnCheckedChanged="ckboxYes_CheckedChanged" Text="Yes" AutoPostBack="True" />
            </p>
            <p>
                <asp:Label ID="lblFriend"  runat="server" Text="Name of friend lended to: "></asp:Label>
                <asp:TextBox ID="txtFriend"  runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqFriend" runat="server" ControlToValidate="txtFriend" ErrorMessage="&lt;br/&gt;Who did you lend it to?" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="lblComments"  runat="server" Text="Comments:"></asp:Label>
                <asp:TextBox ID="txtComments"  runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" CausesValidation="False" />
            </p>
            </asp:View>
            <asp:View runat="server" ID="loginView">
                <h1>Login</h1>
                Username: <asp:TextBox ID="txtLUser" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtLUser" Display="Dynamic" ErrorMessage="&lt;br/&gt;Enter username" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator id="RegularExpressionValidator2"
                    runat="server"
                    ControlToValidate="txtLUser" Display="Dynamic" 
                    ErrorMessage="&lt;br/&gt;Invalid Username" ForeColor="Red" 
                    ValidationExpression="[0-9a-zA-Z]{3,100}" />
                <br />
                Password: <asp:TextBox ID="txtLPass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtLPass" Display="Dynamic" ErrorMessage="&lt;br/&gt;Enter password" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator id="RegularExpressionValidator1"
                    runat="server"
                    ControlToValidate="txtLPass" Display="Dynamic" 
                    ErrorMessage="&lt;br/&gt;Incorrect password" ForeColor="Red" 
                    ValidationExpression="[0-9a-zA-Z]{8,100}" />
                <br />
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                <br />
                Register here: <asp:LinkButton ID="btnReg" runat="server" OnClick="btnReg_Click" ValidationGroup="regGroup">Register</asp:LinkButton>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" SelectCommand="SELECT [username], [password] FROM [Account] WHERE ([username] = @username)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtLUser" Name="username" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View runat="server" ID="registerView">
                <h1>Create an account</h1>
                Username: <asp:TextBox ID="txtRUser" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtRUser" Display="Dynamic" ErrorMessage="&lt;br/&gt;Enter username" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtRUser" Display="Dynamic" ErrorMessage="&lt;br/&gt;Username must be at least 3 characters long" ForeColor="Red" ValidationExpression="[0-9a-zA-Z]{3,100}" />
                <br />
                Password: <asp:TextBox ID="txtRPass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtRPass" Display="Dynamic" ErrorMessage="&lt;br/&gt;Enter password" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtRPass" Display="Dynamic" ErrorMessage="&lt;br/&gt;Password must be at least 8 characters long" ForeColor="Red" ValidationExpression="[0-9a-zA-Z]{8,100}" />
                <br />
                Confirm Password: <asp:TextBox ID="txtCPass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCPass" Display="Dynamic" ErrorMessage="&lt;br/&gt;Enter password" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtRPass" ControlToValidate="txtCPass" ErrorMessage="Passwords must match" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                <br />
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
            </asp:View>
        </asp:MultiView>

    
</asp:Content>

