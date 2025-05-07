<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OTP_Verification.aspx.cs" Inherits="OTP_Verification" %>

<!DOCTYPE html>
<html>
<head>
    <title>OTP Verification</title>
    <link href="/Final_year_project/Style/OTP_Verification.css" rel="Stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>OTP Verification</h2>
            <p>
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </p>
            <p>Please enter the OTP sent to your registered number.</p>

            <div class="otp-boxes">
                <asp:TextBox ID="txtBox1" runat="server" MaxLength="1" CssClass="otp-box" oninput="moveToNextBox(this, 'txtBox2')" />
                <asp:TextBox ID="txtBox2" runat="server" MaxLength="1" CssClass="otp-box" oninput="moveToNextBox(this, 'txtBox3')" />
                <asp:TextBox ID="txtBox3" runat="server" MaxLength="1" CssClass="otp-box" oninput="moveToNextBox(this, 'txtBox4')" />
                <asp:TextBox ID="txtBox4" runat="server" MaxLength="1" CssClass="otp-box" oninput="moveToNextBox(this, null)" />
            </div>

            <asp:Button ID="btnVerifyOTP" runat="server" Text="Verify OTP" OnClick="btnVerifyOTP_Click" CssClass="btn" />

            <div class="timer" id="timer">15 seconds remaining</div>
        </div>
    </form>

    <script>
        let countdown = 15;
        const timerElement = document.getElementById('timer');

        const timer = setInterval(() => {
            countdown--;
            timerElement.textContent = countdown + " seconds remaining";
            if (countdown === 0) {
                clearInterval(timer);
                window.location.href = 'UserVerification.aspx';
            }
        }, 1000);

        function moveToNextBox(currentBox, nextBoxId) {
            if (currentBox.value.length === currentBox.maxLength) {
                if (nextBoxId) {
                    document.getElementById(nextBoxId).focus();
                }
            }
        }
    </script>
</body>
</html>
