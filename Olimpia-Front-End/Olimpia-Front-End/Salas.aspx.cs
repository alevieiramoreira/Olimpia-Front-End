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
    public partial class Salas : System.Web.UI.Page
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
                PlaceHolder2.Controls.Add(new Literal { Text = html.ToString() });
            }
        }

        private DataTable GetData()
        {
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConn))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT IdClass, Class, NumberOfMachines, IdUsers FROM Class"))
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

        #region Excluindo Salas
        protected void btnDeleteClass_Click(object sender, EventArgs e)
        {


            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

            using (SqlConnection conn3 = new SqlConnection(strConn))
            {

                conn3.Open();

                // Cria um comando para excluir o registro cujo Id é o selecionado
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Class WHERE idClass = @idDelete", conn3))
                {
                    // Esse valor poderia vir de qualquer outro lugar, como uma TextBox...
                    cmd.Parameters.AddWithValue("@idDelete", numDelClass.Text);

                    cmd.ExecuteNonQuery();
                }

                Response.Redirect("Salas.aspx");
            }
        }
        #endregion

        #region Criando Salas
        protected void btnInsertClass_Click(object sender, EventArgs e)
        {
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

            using (SqlConnection conn6 = new SqlConnection(strConn))
            {
                conn6.Open();

                using (SqlCommand cmdNewClass = new SqlCommand("INSERT INTO Class(Class, IdUsers)" +
                    "OUTPUT INSERTED.idClass VALUES(@ClassName, @IdUser)", conn6))
                {
                    cmdNewClass.Parameters.AddWithValue("@ClassName", txtClassName.Text);
                    cmdNewClass.Parameters.AddWithValue("@IdUser", txtIdUser.Text);


                    // Agora a variável id conterá o valor do campo Id do registro criado
                    int idClass = (int)cmdNewClass.ExecuteScalar();
                }

                Response.Redirect("Salas.aspx");
            }
        }
        #endregion

        #region Editando Salas
        protected void btnEditClass_Click(object sender, EventArgs e)
        {

            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();


            using (SqlConnection conn12 = new SqlConnection(strConn))
            {
                conn12.Open();
                using (SqlCommand cmdClassEdit = new SqlCommand("UPDATE Class SET Class=@EditClassName, IdUsers=@EditUserid WHERE idClass=@idClassEdit", conn12))
                {
                    cmdClassEdit.Parameters.AddWithValue("@EditClassName", txtClassNameEdit.Text);
                    cmdClassEdit.Parameters.AddWithValue("@EditUserId", txtRespEdit.Text);

                    cmdClassEdit.Parameters.AddWithValue("@idClassEdit", numClassEdit.Text);

                    cmdClassEdit.ExecuteNonQuery();
                
                }
            }


            Response.Redirect("Salas.aspx");
        }
        #endregion

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