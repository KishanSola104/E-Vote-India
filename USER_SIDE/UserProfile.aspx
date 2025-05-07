<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>User Dashboard - E-Vote India</title>
    <!-- Font Awesome Link -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
<link href="/Final_year_project/Style/UserProfile.css" rel="Stylesheet"/>
</head>
<body>

    <form id="adminDashboardForm" runat="server">
        <!-- Header Section -->
        <header class="admin-header">
            <div class="logo">E-Vote India</div>
            <div class="admin-info">
                <span>Welcome, <asp:Label ID="lblAdminName" runat="server" Text=""></asp:Label></span>
                <asp:Image ID="imgAdminProfile" runat="server" CssClass="admin-profile-img" Width="40px" Height="40px" />
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout-btn" OnClick="btnLogout_Click" />
            </div>
        </header>

        <!-- Sidebar Section -->
        <div class="sidebar">
            <a href="UserDashboard.aspx"><i class="fas fa-home"></i>Home</a>
     

          <a href="UserElection.aspx"><i class="fas fa-landmark"></i> Elections</a> <!-- Government/Building icon -->
<a href="CastVote.aspx"><i class="fas fa-vote-yea"></i> Cast Vote</a> <!-- Voting icon -->
<a href="UserResults.aspx"><i class="fas fa-poll"></i> Results</a> <!-- Poll/Results icon -->


            <div class="settings">
                <a href="#" id="settings-btn"><i class="fas fa-cogs"></i> Settings <i class="fas fa-chevron-down"></i></a>
                <div class="dropdown" id="settings-dropdown">
                    <a href="UserProfile.aspx"><i class="fas fa-user"></i> My Account</a>
                    <a href="UserResetPassword.aspx"><i class="fas fa-key"></i> Reset Password</a>
                    <a href="login.aspx"><i class="fas fa-sign-out-alt"></i> Log Out</a>
                </div>
            </div>
        </div>

   <!-- Content -->
<div class="container">
    <div class="content">
        <!-- Voter Profile Links -->
        <div class="voter-profile-links">
            <a href="UserProfile.aspx" class="profile-link-button">
                My Account
            </a>
            <a href="UserResetPassword.aspx" class="profile-link-button">
               Reset Password
            </a>
            <a href="login.aspx" class="profile-link-button logout-button">
                 Log Out
            </a>
        </div>

        <!-- Horizontal Line with Title -->
        <div class="voter-info-section">
            <span class="voter-info-title">Voter Information</span>
            <hr class="voter-info-hr" />
        </div>

        <!-- Voter Profile Display Section -->
        <div class="voter-profile-display">
            <img id="VoterProfileImage" src="default.jpg" alt="Voter Profile Picture" class="voter-profile-img" runat="server" />
            <div id="VoterProfileName" class="voter-profile-name" runat="server"></div>
        </div>

        <!-- Voter Info Display Section -->
        <div class="voter-info-container">
            <div class="row">
                <div class="label">Voter ID:</div>
                <div class="value">
                    <asp:Label ID="voterIDLabel" runat="server" Text="Voter ID"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="label">Aadhar ID:</div>
                <div class="value">
                    <asp:Label ID="aadharIDLabel" runat="server" Text="Aadhar ID"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="label">Name:</div>
                <div class="value">
                    <asp:Label ID="voterNameLabel" runat="server" Text="Voter Name"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="label">Date of Birth:</div>
                <div class="value">
                    <asp:Label ID="dobLabel" runat="server" Text="DOB"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="label">State:</div>
                <div class="value">
                    <asp:Label ID="stateLabel" runat="server" Text="State"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="label">District:</div>
                <div class="value">
                    <asp:Label ID="districtLabel" runat="server" Text="District"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="label">Gender:</div>
                <div class="value">
                    <asp:Label ID="voterGenderLabel" runat="server" Text="Gender"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</div>



        <!-- Footer Section -->
        <!-- Footer Section -->
<footer>
    <div class="footer-container">
        <!-- About Section -->
        <div class="footer-section about">
            <h3>E-Vote India</h3>
            <p>E-Vote India ensures secure, transparent, and fair elections with advanced technology.</p>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
            </div>
        </div>

        <!-- Quick Links Section -->
        <div class="footer-section links">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="UserAboutUs.aspx">About E-Vote India</a></li>
                 <li><a href="ContactUs.aspx">Contact Us</a></li>
                <li><a href="Party_Affi.aspx">Party Affidavits</a></li>
               
            </ul>
        </div>

        <div class="footer-section links">
        <h3>Quick Links</h3>
        <ul>
         <li><a href="Terms_Conditions.aspx">Election Guidelines</a></li>
                <li><a href="Candidate_Affi.aspx">Candidate Affidavits</a></li>
                   <li><a href="https://voicenet.in/">VoiceNet</a></li>
        </ul>
        </div>
    </div>

    <!-- Copyright Section -->
    <div class="footer-bottom">
        <p>© 2025 E-Vote India. All Rights Reserved.</p>
    </div>
</footer>




    </form>

    <!-- JavaScript for Settings Dropdown -->
    <script>
        document.getElementById('settings-btn').addEventListener('click', function (event) {
            event.preventDefault();
            var dropdown = document.getElementById('settings-dropdown');
            var settings = document.querySelector('.settings');

            dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
            settings.classList.toggle('open');
        });
    </script>
</body>
</html>
    
</body>
</html>
