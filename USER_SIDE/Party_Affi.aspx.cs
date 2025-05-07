using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI.WebControls;

public partial class Party_Affi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadPartyData();
        }
    }

    private void LoadPartyData()
    {
        try
        {
            string connStr = ConfigurationManager.ConnectionStrings["Database"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT PartyName, PartyLeader, LeaderPicture, PartySlogan, EstablishedYear, TotalCandidates, PartyLogo FROM Party";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        // Direct Image Path Fix
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            string logoFile = "Uploads/KishanPartyLogo.jpeg";
                            string leaderFile = "Uploads/KishanLeader.jpg";

                            if (i == 1)
                            {
                                logoFile = "Uploads/ManavPartyLogo.jpeg";
                                leaderFile = "Uploads/LeaderManav.jpg";
                            }
                            else if (i == 2)
                            {
                                logoFile = "Uploads/KeyurPartyLogo.jpeg";
                                leaderFile = "Uploads/LeaderKeyur.jpg";
                            }

                            // Assign Correct Paths
                            dt.Rows[i]["PartyLogo"] = logoFile;
                            dt.Rows[i]["LeaderPicture"] = leaderFile;
                        }

                        rptParties.DataSource = dt;
                        rptParties.DataBind();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Error fetching data: " + ex.Message + "');</script>");
        }
    }
}
