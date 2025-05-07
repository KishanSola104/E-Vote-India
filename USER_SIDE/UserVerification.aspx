<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserVerification.aspx.cs" Inherits="UserVerification" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>User Verification</title>
   <link href="/Final_year_project/Style/UserVerification.css" rel="Stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <header>
            <div>
                <a href="login.aspx"> Login</a>
 
            </div>
        </header>

        
        <!-- Content Section -->
        <div class="content">
         <!-- Error Message Label -->
           
            <h2>User Identity Verification</h2>
            <p>Please enter your Aadhar ID to verify your identity.</p>
            
            <!-- Aadhar ID TextBox -->
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtAadharID" runat="server" CssClass="form-control" Placeholder="Enter Aadhar ID" />

            <!-- CAPTCHA Section: Change div to asp:Label -->
            <asp:Label ID="lblCaptcha" runat="server" CssClass="form-control" Text="Captcha will be here"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control" Placeholder="Enter CAPTCHA" />

            <!-- Verify Identity Button -->
            <asp:Button ID="btnVerify" runat="server" Text="Verify Identity" OnClick="btnVerify_Click" CssClass="form-control"  />
            <asp:Button ID="Button1" runat="server" Text="Generate OTP"  Visible="false"  
                CssClass="form-control" onclick="Button1_Click"/>

           
            <br />
            <br />

           
            <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
             <!-- Display OTP in Label -->
            <asp:Label ID="lblOTP" runat="server" CssClass="form-control" ForeColor="green" Visible="false"></asp:Label>
        </div>
        
        <!-- Footer Section -->
        <footer>
            <p>&copy; 2024 E-Vote India. All Rights Reserved.</p>
        </footer>
    </form>

     
</body>
</html>

