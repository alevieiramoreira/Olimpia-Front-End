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

namespace Dashboard
{
    public partial class GraficoCpu : System.Web.UI.Page
    {
        List<List<Object>> leituras = new List<List<Object>>();

        public String LeiturasJson;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            List<LeituraCpu> leituraCpus = new List<LeituraCpu>();

            using (SqlConnection conn = new SqlConnection("Server=tcp:athenaproject.database.windows.net,1433;Initial Catalog=teste;Persist Security Info=False;User ID=master;Password=Athena_coruja;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("SELECT DateTime, CpuUsage FROM CpuInf", conn))
                {
                    // Esse valor poderia vir de qualquer outro lugar, como uma TextBox...
                    cmd.Parameters.AddWithValue("@DateTime", );

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        //Obtém os registros, um por vez
                        while (reader.Read() == true)
                        {
                            
                            DateTime nascimento = reader.GetDateTime(3);
                            double peso = reader.GetDouble(4);

                        
                        }
                    }
                }
            }


            leituras.Add(new List<object> { "Tempo", "%Uso" });

            foreach (var leitura in leituraCpus)
            {
                leituras.Add(new List<object> { leitura.Momento.ToString("HH:mm:ss"), leitura.Valor });
              
            }

            var jsons = new JavaScriptSerializer();
            LeiturasJson = jsons.Serialize(leituras);

            Page.DataBind();
        }
    }
}
 