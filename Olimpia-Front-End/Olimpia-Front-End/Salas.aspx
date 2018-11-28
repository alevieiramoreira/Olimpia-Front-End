﻿<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="Salas.aspx.cs" Inherits="Olimpia_Front_End.Salas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Athena | Suas Salas</title>
    <link rel="shortcut icon" href="img/athenablack.png" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--Link CSS utilizado-->
    <link rel="stylesheet" href="css/pages.css">
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
        </div>
 </div>
        
    </nav>
    <br>

    <div class="container">
        <h1>Gerenciamento de Salas</h1>
        <br />
        <button type="button" class="btn-pages" id="btnNew" onclick="newUser()">Cadastrar Nova Sala</button>
        <button type="button" class="btn-pages" onclick="userEdit()">Editar</button>
        <button type="button" class="btn-pages" onclick="userDelete()">Excluir</button>

        <br />
        <br />

        <div id="table_div"></div>
        <div id="box1">
            <asp:PlaceHolder ID="PlaceHolder2" runat="server" />

        </div>



    </div>

    <!--input de cadastrar salas-->
    <div id="box2" style="display: none;">
        <div class="form-group">
            <label>Nome da Sala:</label>
            <asp:TextBox class="form-control" placeholder="Ex: Digital 1" ID="txtClassName" runat="server" />
        </div>
        <div class="form-group">
            <label>Responsável pela Sala:</label>
            <br />
            <asp:DropDownList ID="ddlUserSala" runat="server">
                <asp:ListItem Text="" />
            </asp:DropDownList>
        </div>


        <asp:Button Text="Cadastrar" type="submit" CssClass="btn-pages" runat="server" ID="btnInsertClass" OnClick="btnInsertClass_Click" />
        <button type="button" class="btn-pages" id="btnCancel" onclick="cancelUser()">Cancelar</button>

    </div>

    <!--input de editar sala-->

    <div id="box3" style="display: none;">
        <div class="form-group">
            <label>Escolha a sala que deseja editar:</label>
            <br />
            <asp:DropDownList class="form-control" ID="ddlSalaEdit" runat="server">
                <asp:ListItem Text="" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Novo nome para a Sala:</label>
            <asp:TextBox class="form-control" placeholder="Nome" ID="txtClassNameEdit" runat="server" />
        </div>

        <div class="form-group">
            <label>Responsável</label>
            <br />
            <asp:DropDownList ID="ddlUserSalaEdit" runat="server">
                <asp:ListItem Text="" />
            </asp:DropDownList>
        </div>
        <asp:Button Text="Editar" runat="server" CssClass="btn-pages" ID="btnEditClass" OnClick="btnEditClass_Click" />
        <button type="button" class="btn-pages" id="btnCancel1" onclick="cancelEdit()">Cancelar</button>
    </div>

    <!--input de excluir usuário-->

    <div id="box4" style="display: none">
        <div class="form-group">
            <label>Selecione a Sala que deseja EXCLUIR:</label>
            <br />
            <asp:DropDownList ID="ddlSalaDel" runat="server">
                <asp:ListItem Text="" />
            </asp:DropDownList>
        </div>
        <asp:Button Text="Excluir" runat="server" CssClass="btn-pages" ID="btnDeleteClass" OnClick="btnDeleteClass_Click" />
        <button type="button" class="btn-pages" id="btnCancel1" onclick="cancelDelete()">Cancelar</button>
    </div>


    </form>      
</body>
</html>