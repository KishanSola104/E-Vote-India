<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLoginVerification.aspx.cs" Inherits="AdminLoginVerification" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Admin Verification - E-VoteIndia</title>
  <link href="/Final_year_project/Style/AdminLoginVerification.css" rel="Stylesheet"/>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Admin Verification</h1>
            <asp:Label ID="lblInstructions" runat="server" Text="Please enter your personal verification password to continue."></asp:Label>
            
            <asp:TextBox ID="txtVerificationPassword" runat="server" CssClass="input-box" TextMode="Password" Placeholder="Verification Password"></asp:TextBox>
            <asp:Button ID="btnVerify" runat="server" Text="Verify" CssClass="btn-send-link" OnClick="btnVerify_Click" />
            
            <asp:Label ID="lblMessage" runat="server" ForeColor="Yellow" Font-Bold="True" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
