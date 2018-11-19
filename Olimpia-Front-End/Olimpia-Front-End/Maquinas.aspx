<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Maquinas.aspx.cs" Inherits="Olimpia_Front_End.Maquinas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Olimpia - Suas Máquinas</title>
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
                <a class="navbar-brand" href="home.aspx">Olímpia</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="nav-link"><a href="index.html">Home</a></li>
                    <li class="nav-link"><a href="faq.aspx">F.A.Q</a></li>
                    <li class="nav-link"><a href="contate.aspx">Contate-nos</a></li>
                    



                        </ul>
        <form runat="server">
                    <div class="btn-group navbar-right">

                        <button type="button" class="dropdown btn-new btn dropdown-toggle" data-toggle="dropdown"> <% string usuario = (string)Session["UserName"];
               Response.Write("Bem Vindo: " + usuario); %><span class="caret"></span></button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                            <li><a href="Salas.aspx">Suas Salas</a></li>
                            <li><a href="Maquinas.aspx">Suas Máquinas</a></li>
                            <li><a href="Usuarios.aspx">Seus Usuários</a></li>
                            <li><asp:Button runat="server" cssClass="dropdown-item" Text="Logout" ID="btnLogoutUsers" onclick="btnLogoutUsers_Click" BackColor="Transparent"/></li>
                       </ul>
                  </div>
            </div>
        </div>
    </div>
 </div>
        
    </nav>
    <br>

    <div class="container">
        <h1>Gerenciamento de Máquinas</h1>
        <button type="button" class="btn-new-user" id="btnNew" onclick="newUser()" style="background-color: black; color: white; border: solid 1px; border-radius: 1rem; padding: 0.6rem; ">Visualizar Máquina...</button>
        <button type="button" class="btn-switch" onclick="userEdit()" style="background-color: black; color: white; border: solid 1px; border-radius: 1rem; padding: 0.6rem; ">Inserir Classe</button>
        <button type="button" class="btn-switch" onclick="userDelete()" style="background-color: black; color: white; border: solid 1px; border-radius: 1rem; padding: 0.6rem; ">Excluir</button>


            <div id="table_div"></div>
            <div id="box1">
                           <asp:PlaceHolder  ID = "PlaceHolder3" runat="server" /> 
              
            </div>
          

         
    </div>
               
    <!--input de cadastrar salas pras máquinas-->
    <div id="box2" style="display: none;">
        <div class="form-group">
            <label>Digite a ID da máquina que deseja visualizar</label>
            <asp:TextBox class="form-control" placeholder="Ex: Digital 1" ID="numClassMachine" runat="server" />
        </div>
       
      

        <asp:Button Text="Visualizar..." type="submit" CssClass="btn btn-primary" runat="server" ID="btnViewMachine" OnClick="btnViewMachine_Click" />
        <button type="button" class="btn btn-primary" id="btnCancel" onclick="cancelUser()">Cancelar</button>

    </div>

    <!--input de editar Classe da máquina-->

    <div id="box3" style="display: none;">
        <div class="form-group">
            <label>Digite a ID da Máquina que deseja editar a Sala </label>
            <asp:TextBox class="form-control" placeholder="Nome" runat="server" ID="numMachineEdit" />
        </div>


           <div class="form-group">
            <label>ID da Sala</label>
            <asp:TextBox class="form-control" placeholder="Apenas números" ID="txtNewClassEdit" runat="server" />
        </div>
       
       

        <asp:Button Text="Editar" runat="server" CssClass="btn btn-primary" ID="btnEditMachine" OnClick="btnEditMachine_Click" />
        <button type="button" class="btn btn-primary" id="btnCancel1" onclick="cancelEdit()">Cancelar</button>
    </div>
    
    

     <!--input de excluir máquina-->

    <div id="box4" style="display: none">

        <div class="form-group">
            <label>Digite a ID da Máquina que deseja Deletar</label>
            <asp:TextBox class="form-control" ID="numDelMachine" placeholder="Apenas números" runat="server" />
        </div>
        

             <asp:Button Text="Deletar" runat="server" CssClass="btn btn-primary" ID="btnDeleteMachine" OnClick="btnDeleteMachine_Click" />
                    <button type="button" class="btn btn-primary" id="btnCancel1" onclick="cancelDelete()">Cancelar</button>
    </div>

    </form>      
</body>
</html>
