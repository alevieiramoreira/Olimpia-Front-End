﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Maquinas.aspx.cs" Inherits="Olimpia_Front_End.Maquinas" %>

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

    <!--Efeito JavaScript para trocar Boxes-->
    <script src="js/changeBox.js"></script>
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
                                <asp:Button runat="server" CssClass="dropdown-item" Text="Logout" ID="btnLogoutUsers" OnClick="btnLogoutUsers_Click" BackColor="Transparent" /></li>
                        </ul>
                    </div>
            </div>
        </div>
    </nav>
    <br />

    <div class="container">
        <h1>Gerenciamento de Máquinas</h1>
        <br />
        <button type="button" class="btn-pages" id="btnNewMach" onclick="userView()">Cadastrar Máquina</button>
        <button type="button" class="btn-pages" id="btnNew" onclick="newUser(), feed">Filtrar Máquinas</button>
        <button type="button" class="btn-pages" onclick="userEdit()" >Editar Máquina</button>
        <button type="button" class="btn-pages" onclick="userDelete()">Excluir</button>
        <br />
        <br />
        <div id="table_div"></div>
        <div id="box1">
            <asp:PlaceHolder ID="PlaceHolder3" runat="server" />
        </div>
    </div>

    <!--input filtrar máquinas-->
    <div id="box2" style="display: none;">
        <div class="form-group">
            <label>Filtrar máquinas por:</label>
            <asp:DropDownList ID="ddlFiltroMaquina" runat="server">
                <asp:ListItem Text="Sala" Value="1" />
                <asp:ListItem Text="Usuário" Value="2" />
                <asp:ListItem Text="Uso de Mem. RAM acima de 70%" Value="3" />
                <asp:ListItem Text="Uso de Mem. CPU acima de 70%" Value="4" />
                <asp:ListItem Text="Uso de Mem. HD acima de 70%" Value="5" />
            </asp:DropDownList>
        </div>

        <asp:Button Text="Visualizar" type="submit" CssClass="btn-pages" runat="server" ID="btnViewMachine" OnClick="btnViewMachine_Click" />
        <button type="button" class="btn-pages" id="btnCancel2" onclick="cancelUser()">Cancelar</button>
    </div>

    <!--input de editar Sala da máquina-->

    <div id="box3" style="display: none;">
        <div class="form-group">
            <label>Código da Máquina que deseja editar a Sala </label>
            <div class="form-group">
                <br />
                <asp:DropDownList ID="ddlEditMachine" runat="server">
                    <asp:ListItem Text="" />
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <label>Nova Sala:</label>
            <br />
            <asp:DropDownList ID="ddlSalaEdit" runat="server">
                <asp:ListItem Text="" />
            </asp:DropDownList>
        </div>

        <asp:Button Text="Editar" runat="server" CssClass="btn-pages" ID="btnEditMachine" OnClick="btnEditMachine_Click" />
        <button type="button" class="btn-pages" id="btnCancel3" onclick="cancelEdit()">Cancelar</button>
    </div>



    <!--input de excluir máquina-->

    <div id="box4" style="display: none">

        <div class="form-group">
            <label>Escolha a Máquina que deseja EXCLUIR:</label>
            <div class="form-group">
                <br />
                <asp:DropDownList ID="ddlDelMachine" runat="server">
                    <asp:ListItem Text="" />
                </asp:DropDownList>
            </div>
        </div>


        <asp:Button Text="Excluir" runat="server" CssClass="btn-pages" ID="btnDeleteMachine" OnClick="btnDeleteMachine_Click" />
        <button type="button" class="btn-pages" id="btnCancel4" onclick="cancelDelete()">Cancelar</button>
    </div>

    <!--input de cadastrar nova máquina-->

    <div id="box5" style="display: none">

        <div class="form-group">
            <label>Insira um <b>código <u>único</u></b> para a Máquina</label>
            <asp:TextBox class="form-control" ID="txtidMachine" placeholder="Apenas números" runat="server" />
        </div>
        <label>Escolha em qual sala a máquina ficará:</label>
        <div class="form-group">
            <br />
            <asp:DropDownList ID="ddlSala" runat="server">
                <asp:ListItem Text="" />
            </asp:DropDownList>
        </div>
        <div>
            <asp:Label ID="lblMensagem" runat="server" Text=""></asp:Label>
        </div>

        <asp:Button Text="Cadastrar" runat="server" CssClass="btn-pages" ID="btnAddMachine" OnClick="btnAddMachine_Click" />
        <button type="button" class="btn-pages" id="btnCancel5" onclick="cancelAddMachine()">Cancelar</button>
    </div>

    </form>      
</body>
</html>
