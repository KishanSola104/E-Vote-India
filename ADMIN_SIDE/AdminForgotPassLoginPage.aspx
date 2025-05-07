<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminForgotPassLoginPage.aspx.cs" Inherits="AdminForgotPassLoginPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Log in to E-VoteIndia</title>
 <link href="/Final_year_project/Style/AdminForgotPassLoginPage.css" rel="Stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-page">
            <div class="login-box">
                <h1>E-VoteIndia Admin</h1>
             <asp:TextBox ID="txtEmail" runat="server" Placeholder="Admin ID or Email address" CssClass="input-box" TextMode="SingleLine"></asp:TextBox>
                <asp:TextBox ID="txtPassword" runat="server" Placeholder="Password" CssClass="input-box" TextMode="Password"></asp:TextBox>
                <asp:Button ID="btnLogin" runat="server" Text="Log in" CssClass="input-box" onclick="btnLogin_Click" />

                  <a href="AdminForgotPassword.aspx">Forgotten password?</a>

                <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
   
               
            </div>
        </div>
    </form>
</body>
</html>
