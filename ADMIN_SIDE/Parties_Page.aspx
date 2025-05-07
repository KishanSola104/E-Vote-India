<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Parties_Page.aspx.cs" Inherits="Parties_Page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <title> Parties Page</title>
 <link href="/Final_year_project/Style/Parties_Page.css" rel="Stylesheet"/>

</head>
<body>
     <!-- Include Font Awesome for Icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<!-- Include Google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Header -->
<div class="header">
    <div>Parties Page</div>
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



<!-- Content -->
<form id="Form1" runat="server">
    <div class="container">
        <div class="content">

            <!-- Scrollable GridView Wrapper -->
            <div class="grid-scroll-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataKeyNames="ElectionID,TotalParties" DataSourceID="SqlDataSource1"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ElectionID" HeaderText="ElectionID" SortExpression="ElectionID" />
                    <asp:BoundField DataField="ElectionName" HeaderText="ElectionName" SortExpression="ElectionName" />
                    <asp:BoundField DataField="StateName" HeaderText="StateName" SortExpression="StateName" />
                    <asp:BoundField DataField="TotalParties" HeaderText="TotalParties" SortExpression="TotalParties" />
                    <asp:BoundField DataField="TotalCandidates" HeaderText="TotalCandidates" SortExpression="TotalCandidates" />
                    <asp:BoundField DataField="TotalVoters" HeaderText="TotalVoters" SortExpression="TotalVoters" />
                    <asp:BoundField DataField="DateOfElection" HeaderText="DateOfElection" SortExpression="DateOfElection" />
                    <asp:BoundField DataField="DateOfResult" HeaderText="DateOfResult" SortExpression="DateOfResult" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
            </div>

            <!-- CRUD Buttons Panel -->
            <asp:Panel ID="CrudButtons" runat="server" Visible="false">
                <asp:Button ID="Button1" runat="server" Text="Add Party Data" OnClick="btnAddParty_Click" CssClass="crud-btn" />
                <asp:Button ID="Button2" runat="server" Text="Update Party Data" OnClick="btnUpdateParty_Click" CssClass="crud-btn" />
                <asp:Button ID="Button3" runat="server" Text="View Party Data" OnClick="btnViewParty_Click" CssClass="crud-btn" />
                <asp:Button ID="Button4" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="crud-btn" />
            </asp:Panel>
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [Election]"
                UpdateCommand="UPDATE [Election] SET [ElectionName] = @ElectionName, [StateName] = @StateName, [TotalParties] = @TotalParties, [TotalCandidates] = @TotalCandidates, [TotalVoters] = @TotalVoters, [DateOfElection] = @DateOfElection, [DateOfResult] = @DateOfResult WHERE [ElectionID] = @ElectionID"
                InsertCommand="INSERT INTO [Election] ([ElectionID], [ElectionName], [StateName], [TotalParties], [TotalCandidates], [TotalVoters], [DateOfElection], [DateOfResult]) VALUES (@ElectionID, @ElectionName, @StateName, @TotalParties, @TotalCandidates, @TotalVoters, @DateOfElection, @DateOfResult)"
                DeleteCommand="DELETE FROM [Election] WHERE [ElectionID] = @ElectionID">

                <DeleteParameters>
                    <asp:Parameter Name="ElectionID" Type="Int32" />
                </DeleteParameters>

                <InsertParameters>
                    <asp:Parameter Name="ElectionID" Type="Int32" />
                    <asp:Parameter Name="ElectionName" Type="String" />
                    <asp:Parameter Name="StateName" Type="String" />
                    <asp:Parameter Name="TotalParties" Type="Int32" />
                    <asp:Parameter Name="TotalCandidates" Type="Int32" />
                    <asp:Parameter Name="TotalVoters" Type="Int32" />
                    <asp:Parameter Name="DateOfElection" Type="DateTime" />
                    <asp:Parameter Name="DateOfResult" Type="DateTime" />
                </InsertParameters>

                <UpdateParameters>
                    <asp:Parameter Name="ElectionID" Type="Int32" />
                    <asp:Parameter Name="ElectionName" Type="String" />
                    <asp:Parameter Name="StateName" Type="String" />
                    <asp:Parameter Name="TotalParties" Type="Int32" />
                    <asp:Parameter Name="TotalCandidates" Type="Int32" />
                    <asp:Parameter Name="TotalVoters" Type="Int32" />
                    <asp:Parameter Name="DateOfElection" Type="DateTime" />
                    <asp:Parameter Name="DateOfResult" Type="DateTime" />
                </UpdateParameters>
            </asp:SqlDataSource>
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
