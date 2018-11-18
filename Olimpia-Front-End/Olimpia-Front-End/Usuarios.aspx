<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Olimpia_Front_End.Usuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Olimpia - Seus Usuários</title>
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
                <a class="navbar-brand" href="home.aspx">Olímpia</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="nav-link"><a href="index.html">Home</a></li>
                    <li class="nav-link"><a href="faq.aspx">F.A.Q</a></li>
                    <li class="nav-link"><a href="contate.aspx">Contate-nos</a></li>
                    



                    <div class="btn-group">

                        <button type="button" class="dropdown btn-new btn dropdown-toggle" data-toggle="dropdown">Opções<span class="caret"></span></button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Suas Salas</a></li>
                            <li><a href="#">Suas Máquinas</a></li>
                            <li><a href="#">Infos Adicionais</a></li>
                          
                        </ul>
                    </div>
            </div>
        </div>
        </ul>
        
      </div>
    </div>
    </nav>
    <br>

    <div class="container">
        <h1>Gerenciamento de Usuários</h1>
        <button type="button" class="btn-new-user" id="btnNew" onclick="newUser()" style="background-color: black; color: white; border: solid 1px; border-radius: 1rem; padding: 0.6rem; ">Cadastrar Novo Usuário...</button>
        <button type="button" class="btn-switch" onclick="userEdit()" style="background-color: black; color: white; border: solid 1px; border-radius: 1rem; padding: 0.6rem; ">Editar</button>
        <button type="button" class="btn-switch" onclick="userDelete()" style="background-color: black; color: white; border: solid 1px; border-radius: 1rem; padding: 0.6rem; ">Excluir</button>
        <form runat="server">

            <div id="table_div"></div>
            <div id="box1">
                           <asp:PlaceHolder  ID = "PlaceHolder1" runat="server" /> 
              
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

        <asp:Button Text="Cadastrar" type="submit" CssClass="btn btn-primary" runat="server" ID="btnCadastrarUser" OnClick="btnCadastrarUser_Click" />
        <button type="button" class="btn btn-primary" id="btnCancel" onclick="cancelUser()">Cancelar</button>

    </div>

    <!--input de editar usuário-->

    <div id="box3" style="display: none;">
        <div class="form-group">
            <label>Digite a ID do usuário que deseja editar</label>
            <asp:TextBox class="form-control" placeholder="Nome" runat="server" ID="numUserEdit" />
        </div>

        <div class="form-group">
            <label>Nome do Usuário</label>
            <asp:TextBox class="form-control" placeholder="Nome" ID="txtUserNameEdit" runat="server" />
        </div>
        <div class="form-group">
            <label>Email do Usuário</label>
            <asp:TextBox type="email" class="form-control" placeholder="email@exemplo.com" ID="txtUserEmailEdit" runat="server" />
        </div>
       

        <asp:Button Text="Editar" runat="server" CssClass="btn btn-primary" ID="btnEditarUser" OnClick="btnEditarUser_Click" />
        <button type="button" class="btn btn-primary" id="btnCancel1" onclick="cancelEdit()">Cancelar</button>
    </div>
    
    

     <!--input de excluir usuário-->

    <div id="box4" style="display: none">

        <div class="form-group">
            <label>Digite a ID do usuário que deseja Deletar</label>
            <asp:TextBox class="form-control" ID="numDelUser" placeholder="Apenas números" runat="server" />
        </div>
        

             <asp:Button Text="Deletar" runat="server" CssClass="btn btn-primary" ID="btnDeleteuser" OnClick="btnDeleteUser_Click" />
                    <button type="button" class="btn btn-primary" id="btnCancel1" onclick="cancelDelete()">Cancelar</button>
    </div>
    

    </form>      
  


</body>
</html>
