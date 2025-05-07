<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminDashboard.aspx.cs" Inherits="adminDashboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <title>Admin Dashboard</title>
<link href="/Final_year_project/Style/adminDashboard.css" rel="Stylesheet"/>

</head>
<body>
   <!-- Include Font Awesome for Icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<!-- Include Google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Header -->
<div class="header">
    <div>Admin Dashboard</div>
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
            <a href="/Final_year_project/ADMIN_SIDE/AdminLoginVerification.aspx" class="dropdown-item logout">
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



   <!-- Content -->
<div class="content-container">
    <div class="content">
        <h2 class="title">The Role of Elections in India</h2>
        <p>
            Elections are the lifeblood of democracy in India, the world's largest democracy. They allow citizens to
            choose leaders who represent their aspirations and vision for the nation. Conducted by the 
            <span class="highlight">Election Commission of India</span>, elections ensure transparency, accountability, and the will of the people.
        </p>

        <h3 class="section-title">History of Indian Elections</h3>
        <p>
            Indian elections have a rich history that started with the first general elections in 1951-52. Over decades,
            the process has evolved to embrace inclusivity, fairness, and innovation, becoming a model for democracies worldwide.
        </p>
        <ul>
            <li><strong>1951-52:</strong> The first general elections were held.</li>
            <li><strong>Universal Voting Rights:</strong> Every citizen aged 18 or above can vote.</li>
            <li><strong>Introduction of EVMs:</strong> Electronic Voting Machines revolutionized voting in 1999.</li>
        </ul>

        <h3 class="section-title">Rules and Regulations</h3>
        <p>Indian elections are governed by strict rules to ensure free and fair participation:</p>
        <ul>
            <li><span class="highlight">Model Code of Conduct:</span> Prevents misuse of power and ensures fair play.</li>
            <li><span class="highlight">Voter ID:</span> Mandatory for identification and voting eligibility.</li>
            <li><span class="highlight">No Malpractices:</span> Bribery, coercion, and misconduct are punishable offenses.</li>
        </ul>

        <h3 class="section-title">Unique Features of Indian Elections</h3>
        <ul>
            <li><strong>Massive Electorate:</strong> With over 900 million eligible voters, India leads the world in democratic participation.</li>
            <li><strong>Accessibility:</strong> Polling stations are established even in remote areas like the Himalayas and deserts.</li>
            <li><strong>NOTA Option:</strong> Introduced in 2013, it empowers voters to reject all candidates.</li>
            <li><strong>Security:</strong> Advanced technology and strict vigilance make the process robust and tamper-proof.</li>
        </ul>

        <h3 class="section-title">Importance of Voting</h3>
        <p>
            Voting is not just a right but a fundamental responsibility. It shapes the future of the nation and reflects the 
            collective voice of its citizens. Participate actively, as every vote counts in strengthening the democratic framework.
        </p>
    </div>
</div>


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
