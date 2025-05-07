<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AllowsResetPassword.aspx.cs" Inherits="AllowsResetPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta charset="UTF-8">
   <title>Security Verification</title>
    <link href="/Final_year_project/Style/AllowsResetPassword.css"  rel="Stylesheet" />
</head>
<body>

  <div class="navbar">
            <p class="logo">E-VoteIndia</p>
           
            <a href="login.aspx" style="margin-left:20px; color:White;  " target=_top>Login</a>
            <br />
   
        </div>
  <form id="form1" runat="server">
    <div class="container">
        <h2>Security Verification</h2>
        <p>Answer the following security questions to reset your password.</p>

        <!-- Security Questions Panel -->
        <asp:Panel ID="pnlSecurityQuestions" runat="server">
            <asp:Label ID="lblQuestion1" runat="server"></asp:Label><br />
            <asp:TextBox ID="txtAnswer1" runat="server" CssClass="input-text"></asp:TextBox><br />

            <asp:Label ID="lblQuestion2" runat="server"></asp:Label><br />
            <asp:TextBox ID="txtAnswer2" runat="server" CssClass="input-text"></asp:TextBox><br />

            <asp:Button ID="btnSubmit" runat="server" Text="Verify & Continue" CssClass="submit-btn" OnClick="btnSubmit_Click" />
        </asp:Panel>

        <!-- Password Reset Panel -->
        <asp:Panel ID="pnlResetPassword" runat="server" Visible="false">
            <h2>Reset Your Password</h2>
            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="input-text" TextMode="Password" placeholder="New Password"></asp:TextBox><br />
            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="input-text" TextMode="Password" placeholder="Confirm Password"></asp:TextBox><br />
            <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" CssClass="reset-btn" OnClick="btnResetPassword_Click" />
        </asp:Panel>

        <br /><br />
        <asp:Label ID="lblMessage" runat="server" CssClass="error"></asp:Label>
    </div>
</form>


</body>
</html>