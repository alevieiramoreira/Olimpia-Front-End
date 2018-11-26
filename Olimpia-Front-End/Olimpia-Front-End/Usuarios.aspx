<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Olimpia_Front_End.Usuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Athena | Usuários</title>
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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="tableUsers.js"></script>
    <script src="js/changebox.js"></script>

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
        <h1>Gerenciamento de Usuários</h1>
        <br />
        <button type="button" class="btn-pages" id="btnNew" onclick="newUser()" >Cadastrar Novo Usuário</button>
        <button type="button" class="btn-pages" onclick="userEdit()">Editar</button>
        <button type="button" class="btn-pages" onclick="userDelete()">Excluir</button>
        <button type="button" class="btn-pages" onclick="userView()">Filtrar</button>
        <br />
        <br />
        <div id="table_div"></div>
        <div id="box1">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server" />

        </div>



    </div>

    <!--input de cadastrar usuário-->
    <div id="box2" style="display: none;">
        <div class="form-group">
            <label>Nome do Usuário</label>
            <asp:TextBox class="form-control" placeholder="Nome" ID="txtUserName" runat="server" />
        </div>
        <div class="form-group">
            <label>Email do Usuário</label>
            <asp:TextBox type="email" class="form-control" placeholder="email@exemplo.com" ID="txtUserEmail" runat="server" />
        </div>
        <div class="form-group">
            <label>CPF</label>
            <asp:TextBox class="form-control" placeholder="Ex: 999.999.999-99" ID="numUserCPF" runat="server" />
        </div>
        <div class="form-group">
            <label>Senha</label>
            <asp:TextBox type="password" class="form-control" placeholder="Senha" ID="txtUserPwd" runat="server" />
        </div>

        <asp:Button Text="Cadastrar" type="submit" CssClass="btn-pages" runat="server" ID="btnCadastrarUser" OnClick="btnCadastrarUser_Click" />
        <button type="button" class="btn-pages" id="btnCancel" onclick="cancelUser()">Cancelar</button>

    </div>

    <!--input de editar usuário-->

    <div id="box3" style="display: none;">
        <div class="form-group">
            <label>Selecione o usuário que deseja editar:</label>
            <br />
            <asp:DropDownList ID="ddlUserEdit" runat="server">
                <asp:ListItem Text="" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Nome do Usuário:</label>
            <asp:TextBox class="form-control" placeholder="Nome" ID="txtUserNameEdit" runat="server" />
        </div>
        <div class="form-group">
            <label>E-mail do Usuário:</label>
            <asp:TextBox type="email" class="form-control" placeholder="email@exemplo.com" ID="txtUserEmailEdit" runat="server" />
        </div>
        <div class="form-group">
            <label>Senha:</label>
            <asp:TextBox type="password" class="form-control" placeholder="Nova Senha" ID="txtPasswordEdit" runat="server" />
        </div>


        <asp:Button Text="Editar" runat="server" CssClass="btn-pages" ID="btnEditarUser" OnClick="btnEditarUser_Click" />
        <button type="button" class="btn-pages" id="btnCancel1" onclick="cancelEdit()">Cancelar</button>
    </div>

    <!--input de excluir usuário-->

    <div id="box4" style="display: none">
        <div class="form-group">
            <label>Selecione o usuário que deseja EXCLUIR:</label>
            <br />
            <asp:DropDownList ID="ddlUserDel" runat="server">
                <asp:ListItem Text="" />
            </asp:DropDownList>
        </div>

        <asp:Button Text="Deletar" runat="server" CssClass="btn-pages" ID="btnDeleteuser" OnClick="btnDeleteUser_Click" />
        <button type="button" class="btn-pages" id="btnCancel1" onclick="cancelDelete()">Cancelar</button>
    </div>

    <div id="box5" style="display: none">

        <div class="form-group">
            <label>Digite a ID do usuário para ver suas salas</label>
            <asp:TextBox class="form-control" ID="numUserView" placeholder="Apenas números" runat="server" />
        </div>


        <asp:Button Text="Filtrar" runat="server" CssClass="btn-pages" ID="btnUserView" OnClick="btnUserView_Click" />
        <button type="button" class="btn-pages" id="btnCancel1" onclick="cancelDelete()">Cancelar</button>
    </div>

    <div id="box6">


        <asp:PlaceHolder ID="PlaceHolder4" runat="server" />
    </div>

    </form>      
  


</body>
</html>
