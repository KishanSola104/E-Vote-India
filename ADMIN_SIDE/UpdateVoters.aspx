<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateVoters.aspx.cs" Inherits="UpdateVoters" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <title>Update Voters</title>

   
  <link href="/Final_year_project/Style/UpdateVoters.css" rel="Stylesheet"/>
</head>
<body>
   <!-- Include Font Awesome for Icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<!-- Include Google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Header -->
<div class="header">
    <div>Update Voters</div>
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
<form id="form1" runat="server">
    <div class="content">
        <h2>Update Voters Information<asp:Label ID="Label1" runat="server"></asp:Label></h2>

        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="VoterID" 
            DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="VoterID" HeaderText="VoterID" ReadOnly="True" 
                    SortExpression="VoterID" />
                <asp:BoundField DataField="AadharID" HeaderText="AadharID" 
                    SortExpression="AadharID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="District" HeaderText="District" SortExpression="District" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" 
                    SortExpression="Gender" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Voters] WHERE [VoterID] = @VoterID" 
            InsertCommand="INSERT INTO [Voters] ([VoterID], [AadharID], [Name], [DOB], [State], [District], [Gender]) VALUES (@VoterID, @AadharID, @Name, @DOB, @State, @District, @Gender)" 
            SelectCommand="SELECT * FROM [Voters]" 
            UpdateCommand="UPDATE [Voters] SET [AadharID] = @AadharID, [Name] = @Name, [DOB] = @DOB, [State] = @State, [District] = @District, [Gender] = @Gender WHERE [VoterID] = @VoterID">
            <DeleteParameters>
                <asp:Parameter Name="VoterID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="VoterID" Type="String" />
                <asp:Parameter Name="AadharID" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="DOB" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="District" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AadharID" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="DOB" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="District" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="VoterID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Voters] WHERE [VoterID] = @VoterID" 
            InsertCommand="INSERT INTO [Voters] ([VoterID], [Name], [DOB], [Gender], [State], [District]) VALUES (@VoterID, @Name, @DOB, @Gender, @State, @District)" 
            SelectCommand="SELECT * FROM [Voters] WHERE [State] = @State AND [District] = @District" 
            UpdateCommand="UPDATE [Voters] SET [Name] = @Name, [DOB] = @DOB, [Gender] = @Gender, [State] = @State, [District] = @District WHERE [VoterID] = @VoterID">
            <SelectParameters>
                <asp:SessionParameter Name="State" SessionField="SelectedState" Type="String" />
                <asp:SessionParameter Name="District" SessionField="SelectedDistrict" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="VoterID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="VoterID" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="DOB" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="District" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="DOB" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="District" Type="String" />
                <asp:Parameter Name="VoterID" Type="String" />
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