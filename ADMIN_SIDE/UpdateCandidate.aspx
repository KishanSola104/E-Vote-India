<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateCandidate.aspx.cs" Inherits="UpdateCandidate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <title>Admin Dashboard  Update Candidates Page</title>

<link href="/Final_year_project/Style/UpdateCandidate.css" rel="Stylesheet"/>
 
</head>
<body>
     <!-- Include Font Awesome for Icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<!-- Include Google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Header -->
<div class="header">
    <div>Update Candidates</div>
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
    <div class="content" style="overflow-x: auto; padding: 20px;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="CandidateId" DataSourceID="SqlDataSource2"
            AllowPaging="True" AllowSorting="True" CssClass="gridview-style" 
            OnRowEditing="GridView1_RowEditing" 
            OnRowUpdating="GridView1_RowUpdating" 
            OnRowCancelingEdit="GridView1_RowCancelingEdit" 
            OnRowDeleting="GridView1_RowDeleting">
            <Columns>
               
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
               
                <asp:BoundField DataField="ElectionId" HeaderText="ElectionId" 
                    SortExpression="ElectionId" />
                <asp:BoundField DataField="PartyId" HeaderText="PartyId" 
                    SortExpression="PartyId" />
                <asp:BoundField DataField="PartyName" HeaderText="PartyName" 
                    SortExpression="PartyName" />
                <asp:BoundField DataField="CandidateId" HeaderText="CandidateId" 
                    ReadOnly="True" SortExpression="CandidateId" />

                
                <asp:BoundField DataField="CandidateName" HeaderText="CandidateName" 
                    SortExpression="CandidateName" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="District" HeaderText="District" 
                    SortExpression="District" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" 
                    SortExpression="Gender" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Mobile" HeaderText="Mobile" 
                    SortExpression="Mobile" />
                <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Candidates] WHERE [CandidateId] = @CandidateId" 
            InsertCommand="INSERT INTO [Candidates] ([ElectionId], [PartyId], [PartyName], [CandidateId], [CandidateName], [State], [District], [DOB], [Gender], [Email], [Mobile], [Image]) VALUES (@ElectionId, @PartyId, @PartyName, @CandidateId, @CandidateName, @State, @District, @DOB, @Gender, @Email, @Mobile, @Image)" 
            SelectCommand="SELECT * FROM [Candidates]" 
            UpdateCommand="UPDATE [Candidates] SET [ElectionId] = @ElectionId, [PartyId] = @PartyId, [PartyName] = @PartyName, [CandidateName] = @CandidateName, [State] = @State, [District] = @District, [DOB] = @DOB, [Gender] = @Gender, [Email] = @Email, [Mobile] = @Mobile, [Image] = @Image WHERE [CandidateId] = @CandidateId">
            <DeleteParameters>
                <asp:Parameter Name="CandidateId" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ElectionId" Type="String" />
                <asp:Parameter Name="PartyId" Type="String" />
                <asp:Parameter Name="PartyName" Type="String" />
                <asp:Parameter Name="CandidateId" Type="String" />
                <asp:Parameter Name="CandidateName" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="District" Type="String" />
                <asp:Parameter Name="DOB" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Mobile" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ElectionId" Type="String" />
                <asp:Parameter Name="PartyId" Type="String" />
                <asp:Parameter Name="PartyName" Type="String" />
                <asp:Parameter Name="CandidateName" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="District" Type="String" />
                <asp:Parameter Name="DOB" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Mobile" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="CandidateId" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Candidates] WHERE [CandidateId] = @CandidateId" 
            SelectCommand="SELECT * FROM [Candidates] WHERE PartyId = @PartyId" 
            UpdateCommand="UPDATE [Candidates] SET [CandidateName] = @CandidateName, [State] = @State, [District] = @District, [DOB] = @DOB, [Gender] = @Gender, [Email] = @Email, [Mobile] = @Mobile WHERE [CandidateId] = @CandidateId">
            <SelectParameters>
                <asp:Parameter Name="PartyId" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="CandidateId" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="CandidateName" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="District" Type="String" />
                <asp:Parameter Name="DOB" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Mobile" Type="String" />
                <asp:Parameter Name="CandidateId" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
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