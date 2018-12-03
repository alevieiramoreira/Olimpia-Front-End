using System;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Olimpia_Front_End
{
    public partial class ByHD : System.Web.UI.Page
    {
        Models.getIdCompany get = new Models.getIdCompany();

        protected void Page_Load(object sender, EventArgs e)
        {

            #region Recuperando Sessão
            // Recupera usuario da sessão
            string usuario = (string)Session["UserName"];

            // Sessão for invalida
            if (usuario == null)
            {
                Response.Redirect("login.aspx");
            }
            #endregion


            #region Gerando DataTable

            if (!this.IsPostBack)
            {
                //Populating a DataTable from database.
                DataTable dt = this.GetData();

                //Building an HTML string.
                StringBuilder html = new StringBuilder();

                //Table start.
                html.Append("<table class = 'table'>");

                //Building the Header row.
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<th>");
                    html.Append(column.ColumnName);
                    html.Append("</th>");

                }

                html.Append("</tr>");

                //Building the Data rows.
                foreach (DataRow row in dt.Rows)
                {
                    html.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        html.Append("<td>");
                        html.Append(row[column.ColumnName]);
                        html.Append("</td>");
                    }
                    html.Append("</tr>");
                }

                //Table end.
                html.Append("</table>");

                //Append the HTML string to Placeholder.
                PlaceHolder3.Controls.Add(new Literal { Text = html.ToString() });
            }
            #endregion

        }

        private DataTable GetData()
        {
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConn))
            {

                using (SqlCommand cmd = new SqlCommand($"SELECT DISTINCT Machines.idMachines 'Código da Máquina', HardDiskInf.datetime 'Data e Hora', HardDiskInf.HdUsage '% Uso do HD' , Machines.IP, Class.Class 'Sala' FROM Machines, Class, HardDiskInf WHERE Machines.idClass=Class.idClass and Machines.idCompany='{get.getSessionidCompany()}' AND RamMemoryInf.idMachines=Machines.idMachines AND HardDiskInf.HDUsage >= '70'"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }


        #region Realizando Logout
        protected void btnLogoutUsers_Click(object sender, EventArgs e)
        {
            // Invalida Sessão
            Session.Abandon();
            Response.Redirect("login.aspx");
        }

        #endregion

        protected void btnIdMachines_Click(object sender, EventArgs e)
        {
            Session["getIdMachine"] = txtGetidMachines.Text;
            Response.Redirect("dash.aspx");
        }
    }
}