<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dash.aspx.cs" Inherits="Olimpia_Front_End.Dash" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Athena | Dashboard</title>
    <link rel="shortcut icon" href="img/athenablack.png" />

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!--Link CSS utilizado-->
    <link rel="stylesheet" href="css/pages.css">

    <!--Link do bootstrap-->
    <link rel="stylesheet" href="css/bootstrap.css">

    <!--Link do Jquery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!--Efeito JavaScript para trocar Boxes-->
    <script src="js/HideShowSections.js"></script>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="js/linechart.js"></script>
    <script src="js/piechart.js"></script>
    <script src="js/donutchart.js"></script>

    <!--**************************************************************************************************-->

</head>
<body>

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="home.aspx">
                    <img class="navbar-brand" src="img/athenalogogold3.png" /></a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="nav-link"><a href="index.html">Home</a></li>
                    <li class="nav-link"><a href="faq.aspx">F.A.Q</a></li>
                    <li class="nav-link"><a href="contate.aspx">Contate-nos</a></li>
                </ul>

                <form runat="server">
                    <div class="btn-group navbar-right">
                        <button type="button" class="dropdown btn-new btn dropdown-toggle" data-toggle="dropdown">
                            <% string usuario = (string)Session["UserName"];
                                Response.Write($"Bem-vindo(a): {usuario} "); %><span class="caret"></span></button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                            <li><a href="Salas.aspx">Suas Salas</a></li>
                            <li><a href="Maquinas.aspx">Suas Máquinas</a></li>
                            <li><a href="Usuarios.aspx">Seus Usuários</a></li>
                            <li>
                                <div style="text-align: center">
                                    <asp:Button runat="server" CssClass="dropdown-item" Text="Logout" ID="btnLogoutUsers" OnClick="btnLogoutUsers_Click" BackColor="Transparent" />
                                </div>
                            </li>
                        </ul>
                    </div>
                </form>
            </div>
        </div>
    </nav>



    <div class="container">

        <div class="row">

            <div class="line-section">

                <button class="btn-pages" onclick="showPrincipalInfo()">+</button>
                Informações Principais
            </div>
            <br />
            <br />


            <!--Sessão das informações Principais-->
            <div id="section-1">
                <div class="container">
                    <div id="table_div"></div>
                    <div id="box1">
                        <asp:PlaceHolder ID="PlaceHolder3" runat="server" />
                    </div>
                </div>
            </div>
            <!--FIM-->


            <div class="line-section">
                <button class="btn-pages" onclick="showCPUInfo()">+</button>
                Informações da CPU
               
            </div>
            <br />
            <br />
            <!--Sessão das informações da CPU-->

            <div id="section-2">
                <h2 style="text-align: center">Uso de CPU</h2>
                <div id="chart_div" class="linechart"></div>
            </div>

            <!--FIM-->
            <div class="line-section">
                <button class="btn-pages" onclick="showHDInfo()">+</button>
                Informações de HD e RAM
               
            </div>
            <br />
            <br />
            <!--Sessão das informações de HD E RAM-->

            <div id="section-3">
                <div id="piechart_RAM" style="width: 500px; float: right; height: 650px;"></div>
                <div id="donutchart" style="width: 500px; float:left; height: 650px;"></div>

            </div>
        </div>
</body>
</html>

