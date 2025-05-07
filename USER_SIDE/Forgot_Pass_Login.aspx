<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forgot_Pass_Login.aspx.cs" Inherits="Forgot_Pass_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Log in to E-VoteIndia</title>
  <link href="/Final_year_project/Style/Forgot_Pass_Login.css" rel="Stylesheet"/>
</head>
<body>
<form id="form1" runat="server">
    <div class="login-page">
        <div class="login-box">
            <h1>E-VoteIndia</h1>
            <asp:TextBox ID="voterID" runat="server" CssClass="input" Placeholder="Voter ID"></asp:TextBox>
            <asp:TextBox ID="password" runat="server" CssClass="input" TextMode="Password" Placeholder="Password"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" CssClass="button" Text="Log In" OnClick="btnLogin_Click" />

            <div class="forgot-link">
                <asp:HyperLink ID="forgotPassword" runat="server" NavigateUrl="forgot_password.aspx">Forgotten account?</asp:HyperLink>
                <br />
                <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </div>

            <div class="separator">or</div>

            <asp:HyperLink ID="createAccount" runat="server" CssClass="create-account" NavigateUrl="UserVerification.aspx">Create new account</asp:HyperLink>
        </div>
    </div>
</form>
</body>
</html>