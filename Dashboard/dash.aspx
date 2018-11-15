<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dash.aspx.cs" Inherits="Dashboard.dash" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <!DOCTYPE html>
<html lang="en">
<head>
  <title>Olimpia - Text aqui</title>
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
  <script src="switch.js"></script>
  
  
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script src="linechart.js"></script>


<!--**************************************************************************************************-->
<script src="piechart.js"></script>

</head> 
    <body>
        
      <nav class="navbar-no-margin navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span> 
            </button>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
              <li class="nav-link"><a href="index.html">Home</a></li>
              <li class="nav-link"><a href="#">Page 1</a></li>
              <li class="nav-link"><a href="#">Page 2</a></li> 
              <li class="nav-link"><a href="#">Page 3</a></li> 
              
              
              
              <div class="btn-group">
                
                <button type="button" class="dropdown btn-new btn dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></button>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Sub Menu1</a></li>
                  <li><a href="#">Sub Menu2</a></li>
                  <li><a href="#">Sub Menu3</a></li>
                  <li class="divider"></li>
                  <li><a href="#">Sub Menu4</a></li>
                  <li><a href="#">Sub Menu5</a></li>
                </ul>
              </div>
            </div>
          </div>
        </ul>
        
      </div>
    </div>
  </nav>
      

  <!-- The sidebar -->
  <div class="sidebar">
    <a href="#home">Home</a>
    <a href="#news">News</a>
    <a href="#contact">Contact</a>
    <a href="#about">About</a>
  </div>
       
  

  <!-- Page content -->
        

  <div class="content">
    <h1>Modelo da máquina</h1>
      <div id="chart_div" class="linechart"></div>
    
    <div id="piechart" style="width: 300px; height: 300px;"></div>

    
  </div>
     
      

  </body>
      </html> 
      
</body>
</html>
