<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <link href="/Final_year_project/Style/ContactUs.css" rel="Stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div class="contact-container">
      <h2>E-Vote India</h2>
    <h2>Contact Us</h2>
    <p>If you have any queries or feedback, feel free to reach out to us.</p>

    <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

    <div class="contact-form">
        <asp:TextBox ID="txtName" runat="server" CssClass="input-field" placeholder="Your Name"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtName" ErrorMessage="Name is Required" CssClass="error-message" runat="server" />

        <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" placeholder="Your Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtEmail" ErrorMessage="Email is Required" CssClass="error-message" runat="server" />

        <asp:TextBox ID="txtMessage" runat="server" CssClass="input-field message-box" TextMode="MultiLine" placeholder="Your Message"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtMessage" ErrorMessage="Message is Required" CssClass="error-message" runat="server" />

        <asp:Button ID="btnSubmit" runat="server" CssClass="submit-btn" Text="Send Message" OnClick="btnSubmit_Click" />
         <!-- Back Page Link -->
        <a href="javascript:history.back()" class="back-link">← Back</a>
      </div>
    </div>

    </form>
</body>
</html>
