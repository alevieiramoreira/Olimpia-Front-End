﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ByHD.aspx.cs" Inherits="Olimpia_Front_End.ByHD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Athena | Suas Máquinas</title>
    <link rel="shortcut icon" href="img/athenablack.png" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!--Link CSS utilizado-->
    <link rel="stylesheet" href="css/pages.css" />
    <!--Link do bootstrap-->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!--Link do Jquery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>


    <!-- Início NAV -->
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
                                <asp:Button runat="server" CssClass="dropdown-item" Text="Logout" ID="btnLogoutUsers" OnClick="btnLogoutUsers_Click" BackColor="Transparent" /></li>
                        </ul>
                    </div>
            </div>
        </div>
    </nav>
    <br />
    <!-- Final NAV -->



    <div class="container">
        <h1>Filtro por RAM</h1>
        <br />
        <br />
        <label>Escolha uma máquina para mostrar mais informações:</label><br />
        <asp:TextBox class="txt-pages" ID="txtGetidMachines" placeholder="Apenas números" runat="server" />
        <asp:Button runat="server" type="button" Text="Mostrar Informações" CssClass="btn-pages" ID="btnIdMachines" OnClick="btnIdMachines_Click"></asp:Button>
        <br />
        <br />
        <div id="table_div"></div>
        <div id="box1">
            <asp:PlaceHolder ID="PlaceHolder3" runat="server" />
        </div>
    </div>

    </form>
</body>
</html>