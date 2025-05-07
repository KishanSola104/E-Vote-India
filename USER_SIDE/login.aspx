<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login Page</title>
   
 <link href="/Final_year_project/Style/Login.css" rel="Stylesheet"/>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
           
   <div class="left-side">
    <h1 class="animated-heading">E-VoteIndia</h1>
    <p class="animated-paragraph">Unity in diversity is the true essence of India!</p>
</div>



            <!-- Login form -->
            <div class="login-box">
                <h2 style="color:#fff">Login</h2>
                <asp:TextBox ID="txtEmail" runat="server" Placeholder="Voter ID or Email address " CssClass="input-box" TextMode="SingleLine"></asp:TextBox>
                <asp:TextBox ID="txtPassword" runat="server" Placeholder="Password" CssClass="input-box" TextMode="Password"></asp:TextBox>
                <asp:Button ID="btnLogin" runat="server" Text="Log in"  CssClass="input-box" onclick="btnLogin_Click" />
                <a href="forgot_password.aspx" style="color: #ff8a00; text-decoration: none;" 
   onmouseover="this.style.color='#ff4500'; this.style.textDecoration='underline';" 
   onmouseout="this.style.color='#ff8a00'; this.style.textDecoration='none';">
   Forgot Password?
</a>
 <asp:Label ID="lblmsg" runat="server" Visible="false"></asp:Label>
               
                <asp:Button ID="new_acc" runat="server" Text="Create new account" class="create-account" onclick="new_acc_Click" />
            </div>
        </div>

      
    </form>
    <script>
document.addEventListener("DOMContentLoaded", () => {
    const heading = document.querySelector(".animated-heading");
    const text = heading.textContent;
    heading.textContent = "";

    const colors = ["#FF9933", "#FFFFFF", "#138808"]; // Indian flag colors

    // Split text into individual characters and animate each
    text.split("").forEach((char, index) => {
        const span = document.createElement("span");
        span.textContent = char;
        span.style.animationDelay = `${index * 0.2}s`; // Delay each character
        span.style.color = colors[index % colors.length]; // Cycle through colors
        heading.appendChild(span);
    });

    // Optional: Ensure paragraph animation triggers on load
    const paragraph = document.querySelector(".animated-paragraph");
    paragraph.style.animationPlayState = "running";
});

</script>
</body>
</html>