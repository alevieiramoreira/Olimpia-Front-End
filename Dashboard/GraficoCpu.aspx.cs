using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dashboard.Models;
using System.Web.Script.Serialization;
using System.Threading;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
using System.Net.Mail;

namespace Dashboard
{
    public partial class GraficoCpu : System.Web.UI.Page
    {
        List<List<Object>> leituras = new List<List<Object>>();

        public String LeiturasJson;


        protected void Page_Load(object sender, EventArgs e)
        {
            List<LeituraCpu> leituraCpus = new List<LeituraCpu>();

         
            #region
            //try
            //{
            //    string sql = "SELECT DateTime, CpuUsage FROM CpuInf ";
            //    string sConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
            //    SqlConnection conn = new SqlConnection(sConn);
            //    conn.Open();
            //    SqlCommand cmd = new SqlCommand(sql, conn);
            //    SqlDataReader cmdReader = cmd.ExecuteReader();

            //    int nRegistros = 0;
            //    while (cmdReader.Read())
            //    {
            //        ++nRegistros;
            //    }

            //    List<LeituraCpu> leituras = new List<LeituraCpu>();

            //    if (nRegistros > 0)
            //    {
            //        cmdReader.Close();
            //        cmdReader = cmd.ExecuteReader();

            //        while (cmdReader.Read())
            //        {
            //            LeituraCpu leitura = new LeituraCpu();
            //            leitura.Momento = cmdReader.GetDateTime(0);
            //            leitura.Valor = cmdReader.GetDouble(1);
            //            leituras.Add(leitura);
            //        }
            //    }
            //}

            //catch (Exception ex)
            //{
            //    throw new Exception(ex.Message);
            //}
            #endregion
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();


                //O cmd precisa saber ter a referencia a conexão para executar o comando.
                using (SqlCommand cmd = new SqlCommand("SELECT DateTime, CpuUsage FROM CpuInf2", conn))
                {
                    
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read() == true)
                        {
                            DateTime tempo=reader.GetDateTime(0);
                            double valores = reader.GetDouble(1);
                            LeituraCpu leitura = new LeituraCpu(tempo, valores);
                            leitura.Momento = tempo;
                            leitura.Valor = valores;
                            leituraCpus.Add(leitura);
                        }
                    }
                }

                leituras.Add(new List<object> { "Tempo", "%Uso" });

                foreach (var leitura in leituraCpus)
                {
                    leituras.Add(new List<object> { leitura.Momento.ToString(), leitura.Valor });

                }

                var jsons = new JavaScriptSerializer();
                LeiturasJson = jsons.Serialize(leituras);

                Page.DataBind();
            }
        }
    }
}

