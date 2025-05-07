<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddParties.aspx.cs" Inherits="AddParties" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <title>Add Parties</title>
<link href="/Final_year_project/Style/AddParties.css" rel="Stylesheet"/>


<script>
document.addEventListener("DOMContentLoaded", function () {
    const electionID = document.getElementById("ElectionIDHiddenField").value;
    const totalParties = parseInt(document.getElementById("TotalPartiesHiddenField").value);

    if (!electionID || isNaN(totalParties) || totalParties <= 0) {
        alert("Error: Missing or invalid election details.");
        return;
    }

    generateForms(totalParties, electionID);
});

function generateForms(totalParties, electionID) {
    const contentDiv = document.getElementById("contentSection");

    for (let i = 1; i <= totalParties; i++) {
        const formDiv = document.createElement("div");
        formDiv.classList.add("party-form");
        formDiv.style.border = "1px solid #ccc";
        formDiv.style.margin = "10px";
        formDiv.style.padding = "10px";

        const currentYear = new Date().getFullYear();
        let yearOptions = "";
        for (let year = 1949; year <= currentYear; year++) {
            yearOptions += `<option value="${year}">${year}</option>`;
        }

        formDiv.innerHTML = `
            <h2 class="form-heading">Form ${i}</h2>
            <label>Election ID:</label>
            <input type="text" value="${electionID}" readonly><br><br>
            
            <label>Party ID:</label>
            <input type="text" id="partyId_${i}" placeholder="Enter Party ID"><br><br>
            
            <label>Party Name:</label>
            <input type="text" id="partyName_${i}" placeholder="Enter Party Name"><br><br>
            
            <label>Party Leader:</label>
            <input type="text" id="partyLeader_${i}" placeholder="Enter Party Leader"><br><br>

            <label>Leader Picture:</label>
            <input type="file" id="leaderPicture_${i}"><br><br>
            
            <label>Party Slogan / Mantra:</label>
            <input type="text" id="partySlogan_${i}" placeholder="Enter Party Slogan/Mantra"><br><br>
            
            <label>Party Established Year:</label>
            <select id="partyYear_${i}">
                <option value="" disabled selected>Select Year</option>
                ${yearOptions}
            </select><br><br>
            
            <label>Party Logo:</label>
            <input type="file" id="partyLogo_${i}"><br><br>
            
            <label>Total Candidates:</label>
            <input type="number" id="totalCandidates_${i}" placeholder="Enter Total Candidates" min="1"><br><br>
            
            <button type="button" onclick="submitForm(${i})">Submit</button>
            <button type="button" onclick="cancelForm(${i})">Cancel</button>
        `;

        contentDiv.appendChild(formDiv);
    }
}

function submitForm(formIndex) {
    const partyId = document.getElementById(`partyId_${formIndex}`).value;
    const partyName = document.getElementById(`partyName_${formIndex}`).value;
    const partyLeader = document.getElementById(`partyLeader_${formIndex}`).value;
    const leaderPicture = document.getElementById(`leaderPicture_${formIndex}`).files[0];
    const partySlogan = document.getElementById(`partySlogan_${formIndex}`).value;
    const partyYear = document.getElementById(`partyYear_${formIndex}`).value;
    const partyLogo = document.getElementById(`partyLogo_${formIndex}`).files[0];
    const totalCandidates = document.getElementById(`totalCandidates_${formIndex}`).value;

    // Validate all fields
    if (!partyId || !partyName || !partyLeader || !leaderPicture || 
        !partySlogan || !partyYear || !partyLogo || !totalCandidates) {
        alert("All fields are required!");
        return;
    }

    // Prepare form data
    const formData = new FormData();
    formData.append("PartyID", partyId);
    formData.append("PartyName", partyName);
    formData.append("PartyLeader", partyLeader);
    formData.append("LeaderPicture", leaderPicture);
    formData.append("PartySlogan", partySlogan);
    formData.append("EstablishedYear", partyYear);
    formData.append("PartyLogo", partyLogo);
    formData.append("TotalCandidates", totalCandidates);

    // Send data to server
    fetch("SavePartyDataHandler.ashx", {
        method: "POST",
        body: formData,
    })
        .then((response) => response.text())
        .then((result) => {
            alert(`Form ${formIndex}: ${result}`);
        })
        .catch((error) => {
            console.error("Error:", error);
            alert(`Form ${formIndex}: Failed to save data.`);
        });
}

function cancelForm(formIndex) {
    const formDiv = document.getElementById(`partyId_${formIndex}`).closest(".party-form");
    if (formDiv) formDiv.remove();
    alert(`Form ${formIndex} Cancelled!`);
}

</script>





</head>
<body>
   <!-- Include Font Awesome for Icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<!-- Include Google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Header -->
<div class="header">
    <div>Add Parties</div>
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
            <a href="/Final_year_project/AdminLoginVerification.aspx" class="dropdown-item logout">
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



<!-- Main Content Section -->
<form id="form1" runat="server">
    <div class="content" id="contentSection">
        
    </div>
    <!-- Hidden Fields to Pass Server Data -->
    <input type="hidden" id="ElectionIDHiddenField" runat="server" />
    <input type="hidden" id="TotalPartiesHiddenField" runat="server" />
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

       // Email and Notifications functions
        function openEmailNotifications() {
            alert('Open email notifications');
        }

        function openNotifications() {
            alert('Open general notifications');
        }



    </script>

    <!-- Font Awesome Icons -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js" crossorigin="anonymous"></script>

</body></html>
