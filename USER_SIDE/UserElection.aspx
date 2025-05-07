<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserElection.aspx.cs" Inherits="UserElection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>User Dashboard - E-Vote India</title>
    <!-- Font Awesome Link -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <link href="/Final_year_project/Style/UserElection.css" rel="Stylesheet"/>
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

 

 <div class="container">

        <!-- Election Details Section -->
        <div class="election-card">
            <h2>Election Details</h2>
            <p><strong>Election Name:</strong> <asp:Label ID="lblElectionName" runat="server" /></p>
            <p><strong>State:</strong> <asp:Label ID="lblState" runat="server" /></p>
            <p><strong>Total Voters:</strong> <asp:Label ID="lblTotalVoters" runat="server" /></p>
            <p><strong>Date of Election:</strong> <asp:Label ID="lblDateOfElection" runat="server" /></p>
            <p><strong>Date of Result:</strong> <asp:Label ID="lblDateOfResult" runat="server" /></p>
        </div>

        <!-- Party Information -->
        <h2>Parties in the Election</h2>
        <asp:GridView ID="gvParties" runat="server" CssClass="party-table" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="PartyName" HeaderText="Party Name" />
                <asp:BoundField DataField="PartyLeader" HeaderText="Leader" />
                <asp:BoundField DataField="TotalCandidates" HeaderText="Total Candidates" />
            </Columns>
        </asp:GridView>

        <!-- Candidate Information -->
        <h2>Candidates Standing in Election</h2>
        <div class="candidate-grid">
            <asp:Repeater ID="rptCandidates" runat="server">
                <ItemTemplate>
                    <div class="candidate-card">
                       <img src='<%# ResolveUrl("~/" + Eval("Image").ToString()) %>' 
     alt="Candidate Photo" 
     onerror="this.onerror=null; this.src='Images/default.png';" />

                        <h3><%# Eval("CandidateName") %></h3>
                        <p><strong>Party:</strong> <%# Eval("PartyName") %></p>
                     
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>

            <style>
/* Full-page Layout Fix */
html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
}

/* Ensure Main Content Expands Fully */
.container {
    flex: 1;
    max-width: 1200px;
    margin: auto;
    padding: 20px;
    padding-top: 100px; /* Space for fixed header */
    padding-bottom: 60px; /* Space to prevent footer overlap */
}


/* Election Card Styling */
.election-card {
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    margin-bottom: 20px;
}

/* Party Table Styling */
.party-table {
    width: 100%;
    border-collapse: collapse;
    background: white;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
}

.party-table th, .party-table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

.party-table th {
    background: #007BFF;
    color: white;
}

/* Candidate Grid Styling */
.candidate-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
    margin-top: 20px;
}

/* Candidate Card */
.candidate-card {
    background: white;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
    text-align: center;
}

/* Candidate Image */
.candidate-card img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
}

/* Headers Styling */
h2, h3 {
    color: #333;
}

/* === Responsive Design === */
@media (max-width: 768px) {
    .container {
        padding: 15px;
    }
    
    .candidate-grid {
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    }
}

/* === Header, Sidebar & Footer Fixes === */

/* Header Fix */
.header 
{
    
    position: fixed;
    width: 100%;
    top: 0;
    left: 0;
    background: #333;
    color: white;
    padding: 15px 0;
    text-align: center;
    z-index: 1000;
}

/* Sidebar Fix */
.sidebar {
    position: fixed;
    width: 200px;
    height: 100vh;
    background: #222;
    color: white;
    top: 0;
    left: 0;
    padding: 20px;
    z-index: 999;
}

.container {
    margin-left: 270px; /* Adjusts content after sidebar */
}

/* Footer Fix */
.footer {
    width: 100%;
    background: #333;
    color: white;
    text-align: center;
    padding: 10px 0;
    margin-top: auto; /* Pushes footer to bottom */
    position: relative; /* Removes overlap effect */
}
            </style>

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
        <ul style="font-weight: lighter">
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
