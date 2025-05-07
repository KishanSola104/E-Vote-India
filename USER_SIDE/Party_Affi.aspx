<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Party_Affi.aspx.cs" Inherits="Party_Affi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Party Affidavits</title>
   <link href="/Final_year_project/Style/Party_Affi.css" rel="Stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <h2>List of Political Parties</h2>
        <div class="party-container">
         <asp:Repeater ID="rptParties" runat="server">
    <ItemTemplate>
        <div class="party-card">
            <!-- Use correct paths -->
            <img src='<%# ResolveUrl("~/") + Eval("PartyLogo") %>' alt="Party Logo" />
            <h3><%# Eval("PartyName") %></h3>
            <p><strong>Leader:</strong> <%# Eval("PartyLeader") %></p>
            <img src='<%# ResolveUrl("~/") + Eval("LeaderPicture") %>' alt="Leader Picture" />
            <p><strong>Slogan:</strong> <%# Eval("PartySlogan") %></p>
            <p><strong>Established Year:</strong> <%# Eval("EstablishedYear") %></p>
            <p><strong>Total Candidates:</strong> <%# Eval("TotalCandidates") %></p>
        </div>
    </ItemTemplate>
</asp:Repeater>

        </div>
    </form>
</body>
</html>