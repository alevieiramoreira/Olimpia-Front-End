using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Olimpia_Front_End 
{
    public partial class Maquinas :  System.Web.UI.Page 
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //Alimentando as DropDownLists da página
            feedDdlSala();
            feedDdlSalaEdit();
            feedDdlEditMachine();
            feedDdlDelMachine();

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

        }

        private DataTable GetData()
        {
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConn))
            {
                using (SqlCommand cmd = new SqlCommand($"SELECT Machines.idMachines 'Código da Máquina', Machines.CpuName 'Info. Processador', Machines.HdTotal 'HD Total', Machines.RamTotal 'Memória RAM Total' , Machines.IP, Class.Class 'Sala' FROM Machines, Class WHERE Machines.idClass=Class.idClass and Machines.idCompany='{getSessionidCompany()}'"))
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
                    cmdMachineEdit.Parameters.AddWithValue("@idEditClass", ddlSalaEdit.Text);
                    cmdMachineEdit.Parameters.AddWithValue("@idMachinesEdit", ddlEditMachine.Text);
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
                    cmdDelMachine.Parameters.AddWithValue("@idDelMachines", ddlDelMachine.Text);

                    cmdDelMachine.ExecuteNonQuery();
                }

                Response.Redirect("Maquinas.aspx");
            }
        }
        #endregion

        #region Filtro Máquinas
        protected void btnViewMachine_Click(object sender, EventArgs e)
        {
            string selecionado = ddlFiltroMaquina.SelectedValue.ToString();
            if (selecionado == "1")
            {
                DataTable GetDataSala()
                {
                    string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(strConn))
                    {
                        using (SqlCommand cmd = new SqlCommand($"SELECT Machines.idMachines 'Código da Máquina', Machines.CpuName 'Info. Processador', Machines.HdTotal 'HD Total', Machines.RamTotal 'Memória RAM Total' , Machines.IP, Class.Class 'Sala' FROM Machines, Class WHERE Machines.idClass=Class.idClass and Machines.idCompany='{getSessionidCompany()}'"))
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






                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('1')", true);
            }
            else if (selecionado == "2")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('2')", true);
            }
            else if (selecionado == "3")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('3')", true);
            }





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
        #endregion

        #region Cadastrando uma nova Máquina

        protected void btnAddMachine_Click(object sender, EventArgs e)
        {
            if (txtidMachine.Text == "" || ddlSala.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Por favor preencha os campos necessários')", true);
            }
            else
            {
                string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
                SqlConnection conn1 = new SqlConnection(strConn);
                SqlCommand valid = new SqlCommand($"SELECT idMachines FROM MACHINES WHERE idMachines='{txtidMachine.Text}'", conn1);
                valid.CommandType = System.Data.CommandType.Text;
                SqlDataReader reader;
                try
                {
                    conn1.Open();
                    reader = valid.ExecuteReader();

                    if (reader.Read() == false)
                    {
                        string strConnect = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
                        using (SqlConnection connect = new SqlConnection(strConn))
                        {
                            connect.Open();

                            using (SqlCommand cmdAddMachine = new SqlCommand("INSERT INTO Machines(idMachines, idClass, idCompany) " +
                          "VALUES(@idMachines, @idClass, @idCompany)", connect))
                            {
                                cmdAddMachine.Parameters.AddWithValue("@idMachines", txtidMachine.Text);
                                cmdAddMachine.Parameters.AddWithValue("@idClass", ddlSala.Text);
                                int idCompany = getSessionidCompany();
                                cmdAddMachine.Parameters.AddWithValue("@idCompany", idCompany);


                                cmdAddMachine.ExecuteNonQuery();
                                connect.Close();
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Máquina cadastrada com sucesso!!')", true);
                            }
                        }
                        repopularDataTable();
                        getNumbMachines();
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Código de Máquina já utilizado!')", true);
                        conn1.Close();

                        repopularDataTable();
                    }



                }
                catch (Exception ex)
                {
                    this.lblMensagem.Text = "Deu erro! " + ex;
                }

            }
        }
        #endregion

        #region Método para obter o ID da Empresa
        public int getSessionidCompany()
        {
            int idCompany = 0;
            string usuario = (string)Session["UserName"];
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

            using (SqlConnection conn3 = new SqlConnection(strConn))
            {
                conn3.Open();

                using (SqlCommand cmdAddMachine = new SqlCommand($"SELECT Company.idCompany,  Users.idCompany FROM Company, Users WHERE UserAdmin='{usuario}' or UserName ='{usuario}'", conn3))
                {
                    using (SqlDataReader reader = cmdAddMachine.ExecuteReader())
                    {
                        while (reader.Read() == true)
                        {
                            idCompany = reader.GetInt32(0);
                        }

                    }
                }
            }

            return idCompany;
        }
        #endregion

        #region Método para repopular a DataTable
        public void repopularDataTable()
        {
            if (this.IsPostBack)
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
        #endregion

        #region Alimentando a ddlEditMachine
        public async void feedDdlEditMachine()
        {
            if (ddlSala.Text == "")
            {
                string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

                using (SqlConnection conn2 = new SqlConnection(strConn))
                {

                    conn2.Open();

                    // Cria um comando para excluir o registro cujo Id é o selecionado
                    using (SqlCommand cmdAddMachine = new SqlCommand($"SELECT idMachines FROM Machines WHERE idCompany = {getSessionidCompany()}", conn2))
                    {

                        using (SqlDataReader reader = cmdAddMachine.ExecuteReader())
                        {
                            while (reader.Read() == true)
                            {
                                int idMachines = reader.GetInt32(0);
                                ddlEditMachine.Items.Add(new ListItem(idMachines + ""));
                            }
                        }

                    }

                    conn2.Close();
                }
            }
        }
        #endregion

        #region Alimentando a ddlSala
        public async void feedDdlSala()
        {
            if (ddlSala.Text == "")
            {
                string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

                using (SqlConnection conn2 = new SqlConnection(strConn))
                {

                    conn2.Open();

                    // Cria um comando para excluir o registro cujo Id é o selecionado
                    using (SqlCommand cmdAddMachine = new SqlCommand($"SELECT idClass, Class FROM Class WHERE idCompany = {getSessionidCompany()}", conn2))
                    {

                        using (SqlDataReader reader = cmdAddMachine.ExecuteReader())
                        {
                            while (reader.Read() == true)
                            {
                                int idClass = reader.GetInt32(0);
                                string Sala = reader.GetString(1);
                                ddlSala.Items.Add(new ListItem(Sala, idClass + ""));
                            }
                        }

                    }

                    conn2.Close();
                }
            }
        }
        #endregion

        #region Alimentando a ddlSalaEdit
        public async void feedDdlSalaEdit()
        {
            if (ddlSalaEdit.Text == "")
            {
                string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

                using (SqlConnection conn2 = new SqlConnection(strConn))
                {

                    conn2.Open();

                    using (SqlCommand cmdAddMachine = new SqlCommand($"SELECT idClass, Class FROM Class WHERE idCompany = {getSessionidCompany()}", conn2))
                    {

                        using (SqlDataReader reader = cmdAddMachine.ExecuteReader())
                        {
                            while (reader.Read() == true)
                            {
                                int idClass = reader.GetInt32(0);
                                string Sala = reader.GetString(1);
                                ddlSalaEdit.Items.Add(new ListItem(Sala, idClass + ""));
                            }
                        }

                    }

                    conn2.Close();
                }
            }
        }
        #endregion

        #region Alimentando a ddlDellMachine
        public async void feedDdlDelMachine()
        {
            if (ddlSala.Text == "")
            {
                string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

                using (SqlConnection conn2 = new SqlConnection(strConn))
                {

                    conn2.Open();

                    // Cria um comando para excluir o registro cujo Id é o selecionado
                    using (SqlCommand cmdAddMachine = new SqlCommand($"SELECT idMachines FROM Machines WHERE idCompany = {getSessionidCompany()}", conn2))
                    {

                        using (SqlDataReader reader = cmdAddMachine.ExecuteReader())
                        {
                            while (reader.Read() == true)
                            {
                                int idMachines = reader.GetInt32(0);
                                ddlDelMachine.Items.Add(new ListItem(idMachines + ""));
                            }
                        }

                    }

                    conn2.Close();
                }
            }
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