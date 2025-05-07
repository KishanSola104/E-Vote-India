<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminForgotPassword.aspx.cs" Inherits="AdminForgotPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
      <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Your Account Admin </title>
<link href="/Final_year_project/Style/AdminForgotPassword.css" rel="Stylesheet"/>


</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <p class="logo">E-VoteIndia Admin</p>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="login-input" placeholder="Admin ID or Email"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="login-input" placeholder="Password"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Log in" CssClass="login-button" 
                onclick="btnLogin_Click" />
            <a href="AdminForgotPassword.aspx" style="margin-left:20px; color:White;" target=_top>Forgotten account?</a>
            <br />

                <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>

        </div>

        <div class="container">
            <h2>Find Your Account</h2>
            <p>Please enter your Admin id or email address  to search for your account.</p>
            <asp:TextBox ID="txtEmailOrID" runat="server" CssClass="input-text" 
                placeholder="Admin ID or Email address" 
                ></asp:TextBox>
            <div class="buttons">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="cancel-btn" onclick="btnCancel_Click" />
                <asp:Button ID="btnSearch" runat="server" Text="Search" 
                    CssClass="search-button" onclick="btnSearch_Click" />
                    <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
