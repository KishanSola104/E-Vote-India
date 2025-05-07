<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCandidates.aspx.cs" Inherits="AddCandidates" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <title>  Add Candidates Page</title>
<link href="/Final_year_project/Style/AddCandidates.css" rel="Stylesheet"/>
</head>
<body>
    <!-- Include Font Awesome for Icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<!-- Include Google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Header -->
<div class="header">
    <div>Add Candidates</div>
    <div class="sidebar-toggle" onclick="toggleSidebar()">☰</div>

    <!-- Navbar Icons -->
    <div class="navbar-icons">
        <!-- Dark Mode Toggle Icon -->
        <div class="icon" onclick="toggleDarkMode()" id="darkModeIcon">
            <i class="fas fa-moon"></i>
        </div>

        <!-- Email Notifications Icon -->
        <div class="icon" onclick="openEmailNotifications()">
            <i class="fas fa-envelope"></i>
        </div>

        <!-- General Notifications Icon -->
        <div class="icon" onclick="openNotifications()">
            <i class="fas fa-bell"></i>
        </div>

        <!-- Admin Profile -->
        <a href="#" class="profile-link" onclick="toggleDropdown(event)">
            <div class="profile-container">
                <!-- Bind image source dynamically -->
                <img id="ProfilePic" src="kishan.jpeg" class="profile-pic" alt="Admin Picture" runat="server">

                <!-- Display admin's name dynamically -->
                <div id="AdminName" runat="server" class="admin-name"></div>
            </div>
        </a>

        <!-- Dropdown Menu -->
        <div class="dropdown-menu" id="dropdownMenu">
            <a href="adminProfile.aspx" class="dropdown-item">
                <span class="material-icons">account_circle</span> My Account
            </a>
            <a href="adminResetPassword.aspx" class="dropdown-item">
                <span class="material-icons">lock</span> Reset Password
            </a>
            <a href="http://localhost:35218/Final_year_project/AdminLoginVerification.aspx" class="dropdown-item logout">
                <span class="material-icons">exit_to_app</span> Log Out
            </a>
        </div>
    </div>
</div>

<!-- Sidebar -->
<div class="sidebar">
    <!-- Logo -->
    <div class="logo-container">
        <div class="logo-icon">
            <i class="fas fa-vote-yea"></i>
        </div>
        <div class="logo-text">E-Vote<span style="color: #ff9933;">India</span></div>
    </div>

    <!-- Sidebar Links -->
    <a href="adminDashboard.aspx"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a>
    <a href="Elections.aspx"><i class="fas fa-poll"></i><span>Elections</span></a>
    <a href="Parties_Page.aspx"><i class="fas fa-users"></i><span>Parties</span></a>
    <a href="candidates.aspx"><i class="fas fa-user-tie"></i><span>Candidates</span></a>
    <a href="voters.aspx"><i class="fas fa-users"></i><span>Voters</span></a>
    <a href="results.aspx"><i class="fas fa-chart-bar"></i><span>Results</span></a>
   
</div>


   
   <form id="form1" runat="server">
    <div class="signup-container">

        <center><h3>Add Candidates&nbsp;
   <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </h3></center>

        <!-- Non-Editable Fields for Session Variables -->

        
        <div class="form-field">
            <label for="txtElectionId">Election Id:</label>
            <asp:TextBox ID="txtElectionId" runat="server"  ReadOnly="true" Enabled="false"></asp:TextBox>
        </div>

        <div class="form-field">
            <label for="txtPartyId">Party Id:</label>
            <asp:TextBox ID="txtPartyId" runat="server"  ReadOnly="true" Enabled="false"></asp:TextBox>
        </div>


        <div class="form-field">
            <label for="txtPartyName">Party Name:</label>
            <asp:TextBox ID="txtPartyName" runat="server"  ReadOnly="true" Enabled="false"></asp:TextBox>
        </div>

        <!-- Candidate ID -->
        <div class="form-field">
            <label for="txtCandidateId">Candidate ID:</label>
            <asp:TextBox ID="txtCandidId" runat="server" placeholder="Enter candidate's ID" required></asp:TextBox>
        </div>

         <!-- Candidate Name -->
        <div class="form-field">
            <label for="txtCandidateName">Candidate Name:</label>
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter candidate's name" required></asp:TextBox>
        </div>

      

        <!-- State Dropdown -->
        <div class="form-field">
            <label>State:</label>
            <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" required></asp:DropDownList>
        </div>

        <!-- District Dropdown -->
        <div class="form-field">
            <label>District:</label>
            <asp:DropDownList ID="ddlDistrict" runat="server" required></asp:DropDownList>
        </div>

          <!-- Candidate Image Upload -->
        <div class="form-field">
            <label for="fuCandidateImage">Candidate Image:</label>
            <asp:FileUpload ID="fuCandidateImage" runat="server" required/>
        </div>
     

        <!-- Date of Birth -->
            <div class="form-field">
                <label>Date of Birth:</label>
                <div class="dob-fields">
                    <asp:DropDownList ID="ddlDay" runat="server" Width="32%"></asp:DropDownList>
                    <asp:DropDownList ID="ddlMonth" runat="server" Width="32%"></asp:DropDownList>
                    <asp:DropDownList ID="ddlYear" runat="server" Width="32%"></asp:DropDownList>
                </div>
            </div>

        <!-- Gender -->
        <div class="form-field">
            <label>Gender:</label>
            <div class="gender-options">
                <asp:RadioButton ID="rbMale" runat="server" GroupName="Gender" Text="Male" />
                <asp:RadioButton ID="rbFemale" runat="server" GroupName="Gender" Text="Female" />
                <asp:RadioButton ID="rbOther" runat="server" GroupName="Gender" Text="Other" />
            </div>
        </div>

        <!-- Email -->
        <div class="form-field">
            <label for="txtEmail">Email Address:</label>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter candidate's email" TextMode="Email" required></asp:TextBox>
        </div>

        <!-- Mobile Number -->
        <div class="form-field">
            <label for="txtPhoneNumber">Mobile Number:</label>
            <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Enter candidate's phone number" required></asp:TextBox>
        </div>


        <!-- Submit and Cancel Buttons -->
        <div class="form-field" style="display: flex; justify-content: space-between; align-items: center;">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="signup-button" />
            <asp:Button ID="btnCancel" runat="server" Text="Reset"  
                CssClass="signup-button cancel-button" onclick="btnCancel_Click1" />
        </div>

    </div>
</form>


    <!-- Footer Section -->
<div class="footer">
    <span class="material-icons">lock</span> All Rights Reserved &copy; E-VoteIndia
</div>


    <script>
        // Sidebar toggle functionality
        function toggleSidebar() {
            document.querySelector('.sidebar').classList.toggle('open');
        }

        // Dark Mode Toggle functionality
     // Dark Mode Toggle Function
function toggleDarkMode() {
    document.body.classList.toggle('dark-mode');
    const darkModeIcon = document.getElementById('darkModeIcon');
    
    if (document.body.classList.contains('dark-mode')) {
        darkModeIcon.textContent = '🌕';  // Change icon to sun
        localStorage.setItem('dark-mode', 'enabled');  // Store the preference
    } else {
        darkModeIcon.textContent = '🌑';  // Change icon to moon
        localStorage.setItem('dark-mode', 'disabled');  // Store the preference
    }
}

// Apply dark mode based on previous user preference
window.onload = function() {
    const darkModeSetting = localStorage.getItem('dark-mode');
    if (darkModeSetting === 'enabled') {
        document.body.classList.add('dark-mode');
        document.getElementById('darkModeIcon').textContent = '🌕';
    }
};



        // Email and Notifications functions
        function openEmailNotifications() {
            alert('Open email notifications');
        }

        function openNotifications() {
            alert('Open general notifications');
        }


        // Toggle the dropdown menu when the admin clicks on the profile image or name
    function toggleDropdown(event) {
        event.preventDefault(); // Prevent the default action of the anchor tag
        const dropdown = document.getElementById('dropdownMenu');
        dropdown.classList.toggle('show-dropdown');
    }

    // Close the dropdown if the user clicks outside of it
    window.onclick = function(event) {
        const dropdown = document.getElementById('dropdownMenu');
        if (!event.target.matches('.profile-link') && !event.target.matches('.profile-container *')) {
            if (dropdown.classList.contains('show-dropdown')) {
                dropdown.classList.remove('show-dropdown');
            }
        }
    }

 

    </script>

    <!-- Font Awesome Icons -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js" crossorigin="anonymous"></script>

</body>
</html>
