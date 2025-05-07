<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="admin_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login Page</title>
   <link href="/Final_year_project/Style/admin_login.css" rel="Stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Left side for large screens (like Facebook layout) -->
            <div class="left-side">
                <h1>E-VoteIndia</h1>
                <p>E-VoteIndia helps you Vote from your comfort place.</p>
            </div>

            <!-- Login form -->
            <div class="login-box">
                <h2>Admin Login</h2>
                <asp:TextBox ID="txtEmail" runat="server" Placeholder="Admin ID or Email address " CssClass="input-box" TextMode="SingleLine"></asp:TextBox>
                <asp:TextBox ID="txtPassword" runat="server" Placeholder="Password" CssClass="input-box" TextMode="Password"></asp:TextBox>
                <asp:Button ID="btnLogin" runat="server" Text="Log in" CssClass="input-box" onclick="btnLogin_Click" />
                <a href="AdminForgotPassword.aspx">Forgotten password?</a>

                <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
