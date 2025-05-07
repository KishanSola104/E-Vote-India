<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Elections.aspx.cs" Inherits="Elections" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <title> Elections Page</title>
    <link href="/Final_year_project/Style/Elections.css" rel="Stylesheet"/>
</head>
<body>
<!-- Include Google Material Icons -->
     <!-- Include Font Awesome for Icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Header -->
<div class="header">
    <div>Elections Page</div>
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
  <!-- Add Elections Container Content will come here  -->
  <form runat="server">
      <div class="signup-container">
         <center> <h2 style="color:Gray;">Manage Election Information</h2></center>
         <div class="form-field">
        <label for="ddlSate">Select The Election:</label>  
             <asp:DropDownList 
                ID="DropDownList1" runat="server" Height="29px" AutoPostBack="true" Width="200px" 
                 DataSourceID="SqlDataSource1" DataTextField="ElectionID" 
                 DataValueField="ElectionID" onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                 >
                  <asp:ListItem Text="Select The Election" runat="server"></asp:ListItem>
            </asp:DropDownList>
        
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 SelectCommand="SELECT [ElectionID] FROM [Election]"></asp:SqlDataSource>
        
             <asp:Label ID="Label1" runat="server"></asp:Label>
</div>

 

          <!-- Election ID -->
            <div class="form-field">
                <label for="txtElectionID">Election ID:</label>
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter Election ID"></asp:TextBox>
            </div>

            <!-- Election Name -->
            <div class="form-field">
                <label for="txtElectionName">Election Name:</label>
                <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter Election Name"></asp:TextBox>
            </div>

               <!-- State -->
            <div class="form-field">
                <label>State:</label>
                <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>
            </div>

                    <!-- Total No. of Parties -->
                 <div class="form-field">
                <label for="txtTotalNoOfParties">Total No. of Parties:</label>
                <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter Total No. Of Parties" 
                         ontextchanged="TextBox3_TextChanged"></asp:TextBox>
            </div>

                <!-- Total No. of Candidates -->
                 <div class="form-field">
                <label for="txtTotalNoOfCandidates">Total No. of Candidates:</label>
                <asp:TextBox ID="TextBox4" runat="server" placeholder="Enter Total No. Of Candidates"></asp:TextBox>
            </div>

              <!-- Total No. of Voters -->
                 <div class="form-field">
                <label for="txtTotalNoOfVoters">Total No. of Voters:</label>
                <asp:TextBox ID="TextBox5" runat="server" placeholder="Enter Total No. Of Voters"></asp:TextBox>
            </div>
     
            <!-- Date of BElection -->
            <div class="form-field">
                <label>Date of Election:</label>
                <div class="dob-fields">
                    <asp:DropDownList ID="ddlDay" runat="server" Width="32%"></asp:DropDownList>
                    <asp:DropDownList ID="ddlMonth" runat="server" Width="32%"></asp:DropDownList>
                    <asp:DropDownList ID="ddlYear" runat="server" Width="32%"></asp:DropDownList>
                </div>
            </div>

              <!-- Date of Results -->
            <div class="form-field">
                <label>Date of Results:</label>
                <div class="dob-fields">
                    <asp:DropDownList ID="ddlDay1" runat="server" Width="32%"></asp:DropDownList>
                    <asp:DropDownList ID="ddlMonth1" runat="server" Width="32%"></asp:DropDownList>
                    <asp:DropDownList ID="ddlYear1" runat="server" Width="32%"></asp:DropDownList>
                </div>
            </div>
            

<!-- Sign Up Buttons -->
<div class="form-field1" style="margin-top: 15px; display: flex; gap: 10px; justify-content: center;">
    <asp:Button ID="btnSubmit1" runat="server" Text="Add Election" 
        CssClass="signup-button"   onclick="btnSubmit1_Click"  />
        <asp:Button ID="btnSubmit4" runat="server" Text="Update Election" 
        CssClass="signup-button" onclick="btnSubmit4_Click"   />
        <asp:Button ID="btnSubmit5" runat="server" Text="Delete Election" 
        CssClass="signup-button"   onclick="btnSubmit5_Click"   />
    <asp:Button ID="btnSubmit2" runat="server" Text="View Elections" 
        CssClass="signup-button"   onclick="btnSubmit2_Click"  />
    <asp:Button ID="btnSubmit3" runat="server" Text="Cancel" 
        CssClass="signup-button" onclick="btnSubmit3_Click"  />
         
          
   
</div>
        </div>


         <div class="gridview-container">
             <asp:GridView ID="GridView1" runat="server" class="gridview" 
                 AutoGenerateColumns="False" DataKeyNames="ElectionID" 
                 DataSourceID="SqlDataSource3">
                 <Columns>
                     <asp:BoundField DataField="ElectionID" HeaderText="ElectionID" ReadOnly="True" 
                         SortExpression="ElectionID" />
                     <asp:BoundField DataField="ElectionName" HeaderText="ElectionName" 
                         SortExpression="ElectionName" />
                     <asp:BoundField DataField="StateName" HeaderText="StateName" 
                         SortExpression="StateName" />
                     <asp:BoundField DataField="TotalParties" HeaderText="TotalParties" 
                         SortExpression="TotalParties" />
                     <asp:BoundField DataField="TotalCandidates" HeaderText="TotalCandidates" 
                         SortExpression="TotalCandidates" />
                     <asp:BoundField DataField="TotalVoters" HeaderText="TotalVoters" 
                         SortExpression="TotalVoters" />
                     <asp:BoundField DataField="DateOfElection" HeaderText="DateOfElection" 
                         SortExpression="DateOfElection" />
                     <asp:BoundField DataField="DateOfResult" HeaderText="DateOfResult" 
                         SortExpression="DateOfResult" />
                 </Columns>
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 SelectCommand="SELECT * FROM [Election]"></asp:SqlDataSource>
     </div>
    
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         DeleteCommand="DELETE FROM [Election] WHERE [ElectionID] = @ElectionID" 
         InsertCommand="INSERT INTO [Election] ([ElectionID], [ElectionName], [StateName], [TotalParties], [TotalCandidates], [TotalVoters], [DateOfElection], [DateOfResult]) VALUES (@ElectionID, @ElectionName, @StateName, @TotalParties, @TotalCandidates, @TotalVoters, @DateOfElection, @DateOfResult)" 
         SelectCommand="SELECT * FROM [Election]" 
         UpdateCommand="UPDATE [Election] SET [ElectionName] = @ElectionName, [StateName] = @StateName, [TotalParties] = @TotalParties, [TotalCandidates] = @TotalCandidates, [TotalVoters] = @TotalVoters, [DateOfElection] = @DateOfElection, [DateOfResult] = @DateOfResult WHERE [ElectionID] = @ElectionID">
         <DeleteParameters>
             <asp:Parameter Name="ElectionID" Type="String" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="ElectionID" Type="String" />
             <asp:Parameter Name="ElectionName" Type="String" />
             <asp:Parameter Name="StateName" Type="String" />
             <asp:Parameter Name="TotalParties" Type="String" />
             <asp:Parameter Name="TotalCandidates" Type="String" />
             <asp:Parameter Name="TotalVoters" Type="String" />
             <asp:Parameter DbType="Date" Name="DateOfElection" />
             <asp:Parameter DbType="Date" Name="DateOfResult" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="ElectionName" Type="String" />
             <asp:Parameter Name="StateName" Type="String" />
             <asp:Parameter Name="TotalParties" Type="String" />
             <asp:Parameter Name="TotalCandidates" Type="String" />
             <asp:Parameter Name="TotalVoters" Type="String" />
             <asp:Parameter DbType="Date" Name="DateOfElection" />
             <asp:Parameter DbType="Date" Name="DateOfResult" />
             <asp:Parameter Name="ElectionID" Type="String" />
         </UpdateParameters>
     </asp:SqlDataSource>



      
    </form>
  
   


    <!-- Footer Section -->
<div class="footer">
    <span class="material-icons">lock</span> All Rights Reserved &copy; E-VoteIndia
</div>
</form>

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

</body>
</html>
