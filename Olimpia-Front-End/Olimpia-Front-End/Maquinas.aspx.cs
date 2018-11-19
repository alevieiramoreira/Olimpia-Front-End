using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Olimpia_Front_End
{
    public partial class Maquinas : System.Web.UI.Page
    {
        #region Gerando DataTable
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
        }

        private DataTable GetData()
        {
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConn))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT idMachines, CpuName, HdTotal, RamTotal, IP, IdClass FROM Machines"))
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
        #endregion

        #region Editando Máquinas
        protected void btnEditMachine_Click(object sender, EventArgs e)
        {
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();


            using (SqlConnection conn102 = new SqlConnection(strConn))
            {
                conn102.Open();
                using (SqlCommand cmdMachineEdit = new SqlCommand("UPDATE Machines SET idClass=@idEditClass WHERE idMachines=@idMachinesEdit", conn102))
                {
                    cmdMachineEdit.Parameters.AddWithValue("@idEditClass", txtNewClassEdit.Text);

                    cmdMachineEdit.Parameters.AddWithValue("@idMachinesEdit", numMachineEdit.Text);

                    cmdMachineEdit.ExecuteNonQuery();

                }
            }


            Response.Redirect("Maquinas.aspx");
        }
        #endregion

        #region Excluindo Máquinas
        protected void btnDeleteMachine_Click(object sender, EventArgs e)
        {
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

            using (SqlConnection conn103 = new SqlConnection(strConn))
            {

                conn103.Open();

                // Cria um comando para excluir o registro cujo Id é o selecionado
                using (SqlCommand cmdDelMachine = new SqlCommand("DELETE FROM Machines WHERE idMachines = @idDelMachines", conn103))
                {
                    // Esse valor poderia vir de qualquer outro lugar, como uma TextBox...
                    cmdDelMachine.Parameters.AddWithValue("@idDelMachines", numDelMachine.Text);

                    cmdDelMachine.ExecuteNonQuery();
                }

                Response.Redirect("Maquinas.aspx");
            }
        }
        #endregion

        protected void btnViewMachine_Click(object sender, EventArgs e)
        {
            //aqui seria aquele botão de visualizar, eu comecei mas não sei mto como fazer...

            //string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            //using (SqlConnection con104 = new SqlConnection(strConn))
            //{
            //    using (SqlCommand cmd104 = new SqlCommand("SELECT * FROM Machines WHERE idMachines=@idMachineView"))
            //    {
            //        cmd104.Parameters.AddWithValue("@idMachineView", );
            //    }

            //    Response.Redirect("Dashboard.aspx");
            //}
        }

        #region Realizando Logout
        protected void btnLogoutUsers_Click(object sender, EventArgs e)
        {
            // Invalida Sessão
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
        #endregion
    }
}