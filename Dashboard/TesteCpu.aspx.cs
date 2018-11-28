using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;
using System.Configuration;

namespace Dashboard
{
    public partial class TesteCpu : System.Web.UI.Page
    {
        [WebMethod]
        public static string getUltimaLeituraCpu() {
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
            using (SqlConnection con = new SqlConnection(strConn)) {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 DateTime, CpuUsage FROM CpuInf2 ORDER BY IDCPU DESC", con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    return rd[0].ToString() + "@" + rd[1].ToString();
                }

            }

            return "";
        }
    }
}