using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Dashboard
{
    public partial class GraficoRam : System.Web.UI.Page
    {
      
        [WebMethod]
        public static string getUltimaLeituraRam()
        {
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
            using (SqlConnection con = new SqlConnection(strConn))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 RamUsage, RamAvailable FROM RamMemoryInf ORDER BY IdRamMemory DESC", con);
                SqlDataReader rd1 = cmd.ExecuteReader();
                if (rd1.Read())
                {
                    return rd1[0].ToString() + "@" + rd1[1].ToString();
                }

            }

            return "";
        }
    }
    
}