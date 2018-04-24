<%@ Page Title="Support" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Support.aspx.cs" Inherits="Support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Support</h1>

    <asp:Table ID="Table1" runat="server" CssClass="email">
        <asp:TableRow>
            <asp:TableCell>Email:</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtFrom" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="emailCheck" runat="server" ControlToValidate="txtFrom" Display="Dynamic" ErrorMessage="&lt;br&gt;Email Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexEmail" runat="server" ErrorMessage="&lt;br&gt;Please Enter Valid Email ID" ControlToValidate="txtFrom" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>Password:</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="passwordCheck" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="&lt;br&gt;Password Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>Subject:</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>Body:</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtBody" runat="server" Height="81px" TextMode="MultiLine" Width="210px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="bodyCheck" runat="server" ControlToValidate="txtBody" Display="Dynamic" ErrorMessage="&lt;br&gt;Body Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>Attachment:</asp:TableCell>
            <asp:TableCell><asp:FileUpload ID="fuAttachment" runat="server" /></asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="Button1" runat="server" OnClick="btnSend_Click" Text="Send" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>

