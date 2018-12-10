﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Olimpia_Front_End.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Olimpia | Home</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!--Link CSS utilizado-->
    <link rel="stylesheet" href="css/pages.css" />
    <link rel="stylesheet" href="css/design.css" />
    <link rel="stylesheet" href="css/creative.css" />
    <!--Link do bootstrap-->
    <link rel="stylesheet" href="css/bootstrap.css" />
    <!--Link do Jquery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>--%>


    <!--Efeito JavaScript para trocar Boxes-->
    <script src="js/switch.js"></script>

    <!--JS Bootstrap-->
    <script src="responsive/bootstrap/bootstrap.min.js"></script>

    <link rel="shortcut icon" href="img/logoblack.png" />

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
                <a href="home.aspx">
                    <img class="navbar-brand" src="img/olimpogold.png" /></a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li class="nav-link"><a href="home.aspx">Home</a></li>
                    <li class="nav-link"><a href="faq.aspx">F.A.Q</a></li>
                    <li class="nav-link"><a href="contate.aspx">Contate-nos</a></li>
                    <li class="nav-link"><a href="login.aspx" target="_blank">Login</a></li>
                    <li class="nav-link"><a href="cadastro.aspx" style="color: #cb8933" target="_blank">Cadastre-se</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <header class="header0 text-center text-white d-flex">

        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="img/arquitetura.png" alt="Los Angeles">
                </div>

                <div class="item">
                    <img src="img/montanha.jpg" alt="Chicago">
                </div>

                <div class="item">
                    <img src="img/background.png" alt="New York">
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>


    </header>


    <section style="background-color: #171719;">
        <div class="container">

            <div class="card" style="width: 100%;">
                <div class="card-body bg-transparent" style="padding: 3rem;">
                    <h2 class="card-title text-uppercase title-box">Card title</h2>
                    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                    <p class="card-text text-muted">
                        Some quick example text to build on the card title and make up the bulk of the card's content.
                            Some quick example text to build on the card title and make up the bulk of the car
                            Some quick example text to build on the card title and make up the bulk of the car
                            Some quick example text to build on the card title and make up the bulk of the car
                            Some quick example text to build on the card title and make up the bulk of the car
                            Some quick example text to build on the card title and make up the bulk of the car
                            Some quick example text to build on the card title and make up the bulk of the car

                    </p>
                </div>

            </div>

        </div>







        <p class="divider-sections"></p>






        <div class="container">
            <div class="col-lg-3">
                <div class="card" style="width: 20rem;">
                    <div class="card-body bg-white" style="padding: 3rem;">
                        <h3 class="card-title">Card title</h3>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3">
                <div class="card" style="width: 20rem;">

                    <div class="card-body bg-white" style="padding: 3rem;">
                        <h3 class="card-title">Card title</h3>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>

                </div>
            </div>

            <div class="col-lg-3">
                <div class="card" style="width: 20rem;">

                    <div class="card-body bg-white" style="padding: 3rem;">
                        <h3 class="card-title">Card title</h3>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>

                </div>
            </div>

            <div class="col-lg-3">
                <div class="card" style="width: 20rem;">

                    <div class="card-body bg-white" style="padding: 3rem;">
                        <h3 class="card-title">Card title</h3>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>

                </div>
            </div>
        </div>

    </section>

    <footer>
        <div class="container">
        </div>
    </footer>
</body>
</html>
