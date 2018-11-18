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
    public partial class Usuarios : System.Web.UI.Page
    { 
        protected int IdUser;
        protected string UserName;
        protected string UserEmail;
        public string lblMessage;

        #region Gerando DataTable
        protected void Page_Load(object sender, EventArgs e)
        {
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
                PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
            }
        }

        private DataTable GetData()
        {
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConn))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT IdUsers, UserName, Email FROM Users"))
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

        #region Deletando Usuário
        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

            using (SqlConnection conn3 = new SqlConnection(strConn))
            {

                conn3.Open();

            // Cria um comando para excluir o registro cujo Id é o selecionado
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Users WHERE IdUsers = @idDelete", conn3))
                {
                    // Esse valor poderia vir de qualquer outro lugar, como uma TextBox...
                   cmd.Parameters.AddWithValue("@idDelete", numDelUser.Text);

                    cmd.ExecuteNonQuery();
                }

                Response.Redirect("Usuarios.aspx");

            }
        }
        #endregion

        #region Cadastrando Usuário
        protected void btnCadastrarUser_Click(object sender, EventArgs e)
        {
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

            using (SqlConnection conn1 = new SqlConnection(strConn))
            {
                conn1.Open();

                using (SqlCommand cmdNewUser = new SqlCommand("INSERT INTO Users(UserName, CPF, Email, Password)" +
                    "OUTPUT INSERTED.IdUsers VALUES(@UserName, @CPFUser, @EmailUser, @PwdUser)", conn1))
                {
                    cmdNewUser.Parameters.AddWithValue("@UserName", txtUserName.Text);
                    cmdNewUser.Parameters.AddWithValue("@CPFUser", numUserCPF.Text);
                    cmdNewUser.Parameters.AddWithValue("@EmailUser", txtUserEmail.Text);
                    cmdNewUser.Parameters.AddWithValue("@PwdUser", txtUserPwd.Text);

                    // Agora a variável id conterá o valor do campo Id do registro criado
                       int idUsers= (int)cmdNewUser.ExecuteScalar();
                }

                Response.Redirect("Usuarios.aspx");
            }
        }
        #endregion

        #region Editando Usuário
        protected void btnEditarUser_Click(object sender, EventArgs e)
        {
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
            
            
                using (SqlConnection conn2 = new SqlConnection(strConn))
                {
                    conn2.Open();
                    using (SqlCommand cmdUserEdit = new SqlCommand("UPDATE Users SET UserName=@UserName, Email=@EmailUser WHERE IdUsers=@idUserEdit", conn2))
                    {

                        cmdUserEdit.Parameters.AddWithValue("@UserName", txtUserNameEdit.Text);
                        cmdUserEdit.Parameters.AddWithValue("@EmailUser", txtUserEmailEdit.Text);

                        cmdUserEdit.Parameters.AddWithValue("@idUserEdit", numUserEdit.Text);

                        cmdUserEdit.ExecuteNonQuery();
                    }
                }
            

                Response.Redirect("Usuarios.aspx");
        }
        #endregion
    }
}
