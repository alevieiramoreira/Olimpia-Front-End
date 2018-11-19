using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;

namespace Olimpia_Front_End
{
    public partial class login : System.Web.UI.Page

    {

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogar_Click(object sender, EventArgs e)
        {
            Login();


        }

        private void Login()
        {
            // Recupera elementos do formulario
            string usuario = Request.Form["txtUserLogin"];
            string senha = Request.Form["txtPassLogin"];

            string conector = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn1 = new SqlConnection(conector);
            string userAd, passAd, user, pass;


            string loginAdmin = "SELECT UserAdmin, PassAdmin, UserName, Password FROM VWLOGIN2 WHERE (UserAdmin='" + txtUserLogin.Text + "' AND PassAdmin='" + txtPassLogin.Text + "')" +
                " OR (UserName = '" + txtUserLogin.Text + "' and Password = '" + txtPassLogin.Text + "') ";


            SqlCommand command = new SqlCommand(loginAdmin, conn1);
            command.CommandType = System.Data.CommandType.Text;
            SqlDataReader reader;
            try
            {
                conn1.Open();
                reader = command.ExecuteReader();

                if (reader.Read())
                {
                    userAd = reader[0].ToString();
                    passAd = reader[1].ToString();
                    user = reader[2].ToString();
                    pass = reader[3].ToString();
                    conn1.Close();

                    if (userAd == txtUserLogin.Text && passAd == txtPassLogin.Text)
                    {
                        this.lblMensagem.Text = "Admin logado com sucesso!.";
                        Session["UserName"] = usuario;
                        Response.Redirect("Usuarios.aspx");
                    }

                    else if (user == txtUserLogin.Text && pass == txtPassLogin.Text)
                    {
                        this.lblMensagem.Text = "Logado com sucesso!.";
                        Session["UserName"] = usuario;
                        Response.Redirect("Salas.aspx");
                    }

                }
                else
                {
                    this.lblMensagem.Text = "Usuário e/ou senha incorretos.";
                }

            }
            catch (Exception ex)
            {
                this.lblMensagem.Text = "Deu erro! " + ex;
            }



        }
    }
}






