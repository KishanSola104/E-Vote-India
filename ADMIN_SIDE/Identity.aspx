<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Identity.aspx.cs" Inherits="Identity" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Identity.aspx.cs" Inherits="Identity" %>
<link href="/Final_year_project/Style/.css" rel="Stylesheet"/>
</head>
<body>
  <form id="Form1" runat="server">
   

    
        <h2>Insert Identity Data<asp:Label ID="lblMessage" runat="server"></asp:Label>
        </h2>

        <!-- Aadhar ID -->
        <label for="txtAadharID">Aadhar ID:</label>
        <asp:TextBox ID="txtAadharID" runat="server" placeholder="Enter User's Aadhar ID"></asp:TextBox>

        <!-- User's Name -->
        <label for="txtName">Name:</label>
        <asp:TextBox ID="txtName" runat="server" placeholder="Enter User's Name"></asp:TextBox>

        <!-- Date of Birth -->
        <label for="txtUserBirthdate">Date of Birth:</label>
        <input type="date" id="txtUserBirthdate" name="txtUserBirthdate" placeholder="YYYY-MM-DD" />

        <!-- Gender -->
        <label for="ddlAdminGender">Gender:</label>
        <asp:DropDownList ID="ddlAdminGender" runat="server">
            <asp:ListItem Text="Select Gender" Value="" />
            <asp:ListItem Text="Male" Value="Male" />
            <asp:ListItem Text="Female" Value="Female" />
            <asp:ListItem Text="Other" Value="Other" />
        </asp:DropDownList>

           <!-- State -->
            <div class="form-field">
                <label>State:</label>
                <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>
            </div>

            <!-- District -->
            <div class="form-field">
                <label>District:</label>
                <asp:DropDownList ID="ddlDistrict" runat="server"></asp:DropDownList>
            </div>


        <!-- Submit Button -->
        <asp:Button ID="btnInsertAdmin" runat="server" Text="Insert Data" 
            onclick="btnInsertAdmin_Click" />
  
</form>

</body>
</html>
