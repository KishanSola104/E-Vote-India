<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_insert.aspx.cs" Inherits="admin_insert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Insert</title>
    <link href="/Final_year_project/Style/admin_insert.css" rel="Stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Insert Admin</h2>

            <!-- Admin Username -->
            <asp:TextBox ID="txtAdminUsername" runat="server" placeholder="Enter admin username"></asp:TextBox>
            
            <!-- Admin Email -->
            <asp:TextBox ID="txtAdminEmail" runat="server" placeholder="Enter admin email"></asp:TextBox>
            
            <!-- Admin Password -->
            <asp:TextBox ID="txtAdminPassword" runat="server" placeholder="Enter admin password" TextMode="Password"></asp:TextBox>
            
            <!-- Admin Mobile -->
            <asp:TextBox ID="txtAdminMobile" runat="server" placeholder="Enter admin mobile"></asp:TextBox>
            
            <!-- Admin Gender -->
            <asp:DropDownList ID="ddlAdminGender" runat="server">
                <asp:ListItem Text="Select Gender" Value="" />
                <asp:ListItem Text="Male" Value="Male" />
                <asp:ListItem Text="Female" Value="Female" />
                <asp:ListItem Text="Other" Value="Other" />
            </asp:DropDownList>
            
            <!-- Admin Address -->
            <asp:TextBox ID="txtAdminAddress" runat="server" placeholder="Enter admin address"></asp:TextBox>
            
            <!-- Admin Birthdate -->
            <asp:TextBox ID="txtAdminBirthdate" runat="server" placeholder="Enter admin birthdate (YYYY-MM-DD)" TextMode="Date"></asp:TextBox>

            <!-- Admin Image -->
            <asp:TextBox ID="txtAdminImage" runat="server" placeholder="Enter admin Image URL"></asp:TextBox>
            
            <!-- Submit Button -->
            <asp:Button ID="btnInsertAdmin" runat="server" Text="Insert Admin" OnClick="btnInsertAdmin_Click" />
        </div>
    </form>
</body>
</html>
