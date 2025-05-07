<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgot_password.aspx.cs" Inherits="forgot_password" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Your Account</title>

  <link href="/Final_year_project/Style/forgot_password.css" rel="Stylesheet"/>

</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <p class="logo">E-VoteIndia</p>
            <asp:TextBox ID="txtEmailOrPhone" runat="server" CssClass="login-input" placeholder="Voter ID  "></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="login-input" placeholder="Password"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Log in" CssClass="login-button" 
                onclick="btnLogin_Click" />
            <a href="forgot_password.aspx" style="margin-left:20px; color:White;" target=_top>Forgotten account?</a>
            <br />
            
          
        </div>
       <center> <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label></center>
        <div class="container">
            <h2>Find Your Account</h2>
            <p>Please enter your Voter id</p>
            <asp:TextBox ID="txtEmailOrMobile" runat="server" CssClass="input-text" 
                placeholder="Voter ID "></asp:TextBox>
            <div class="buttons">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="cancel-btn" onclick="btnCancel_Click" />
                <asp:Button ID="btnSearch" runat="server" Text="Search" 
                    CssClass="search-button" onclick="btnSearch_Click" />
            </div>
        </div>
    </form>
</body>
</html>