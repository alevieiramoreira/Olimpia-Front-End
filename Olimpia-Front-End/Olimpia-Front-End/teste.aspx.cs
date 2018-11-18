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
    public partial class teste : System.Web.UI.Page
    {
                                                protected void Page_Load(object sender, EventArgs e)
                                                {
                                                    if (!this.IsPostBack)
                                                    {
                                                        //Populating a DataTable from database.
                                                        DataTable dt = this.GetData();

                                                        //Building an HTML string.
                                                        StringBuilder html = new StringBuilder();

                                                        //Table start.
                                                        html.Append("<table border = '1'>");

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
    }
}