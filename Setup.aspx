<%@ Page Title="Setup" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Setup.aspx.cs" Inherits="Setup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Select your theme</h1>
<asp:DropDownList ID="ddlTheme" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTheme_SelectedIndexChanged">
        <asp:ListItem></asp:ListItem>
        <asp:ListItem>Light</asp:ListItem>
        <asp:ListItem>Dark</asp:ListItem>
    </asp:DropDownList>
</asp:Content>

