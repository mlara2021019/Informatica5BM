<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="Styles/INDEX.css" />
        <link rel="icon" href="Images/Logo.png" type="image/png">
        <title>Panel de Administración</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Encabezado -->
        <header class="headerOpciones">
            <div class="bannerHorario">
                <span><i class='bx bx-time-five'></i> Lunes a Viernes: 8:00 – 17:30 – Sábado: 8:00 – 12:00</span>
                <div class="social">
                    <a href="#"><i class='bx bxl-instagram'></i></a>
                    <a href="#"><i class='bx bxl-facebook'></i></a>
                    <a href="#"><i class='bx bxl-whatsapp'></i></a>
                </div>
            </div>
            <div class="bannerInfo">
                <div class="logo">
                    <img src="Images/Logo.png" alt="logo" class="logo-img">
                    <h1>PERIFERICOS</h1>
                </div>
                <div class="infoGroup">
                    <div class="infoItem">
                        <h4>LLÁMANOS</h4>
                        <span>+502 5967-7843</span>
                    </div>
                    <div class="infoItem">
                        <h4>E-MAIL</h4>
                        <span>Perifericos@gmail.com</span>
                    </div>
                    <div class="infoItem">
                        <h4>VISÍTANOS</h4>
                        <span>Zona 11</span>
                    </div>
                </div>
            </div>
        </header>

        <!-- Cuerpo Principal -->
        <main class="main-container">
            <section class="main-content">
                <h2>Bienvenido al Panel de Administración</h2>
                <p>Desde aquí puedes gestionar los clientes y los periféricos de la tienda.</p>

                <!-- Opciones de Administración con Cards -->
                <div class="row justify-content-center g-4">
                    <!-- Card Clientes -->
                    <div class="col-md-4">
                        <div class="card h-100 text-center">
                            <img src="Images/clientes.png" class="card-img-top" alt="Clientes">
                            <div class="card-body">
                                <h5 class="card-title">Administrar Clientes</h5>
                                <p class="card-text">Accede a la sección para gestionar los clientes registrados.</p>
                                <a href="Controlador?menu=ClientesAdmin&accion=Listar" class="btn btn-primary">Ir a Clientes</a>
                            </div>
                        </div>
                    </div>

                    <!-- Card Periféricos -->
                    <div class="col-md-4">
                        <div class="card h-100 text-center">
                            <img src="Images/perifericos.png" class="card-img-top" alt="Periféricos">
                            <div class="card-body">
                                <h5 class="card-title">Administrar Periféricos</h5>
                                <p class="card-text">Accede a la sección para gestionar los periféricos disponibles.</p>
                                <a href="Controlador?menu=PerifericosAdmin&accion=Listar" class="btn btn-success">Ir a Periféricos</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Carrusel Bootstrap -->
            <div id="carouselExampleIndicators" class="carousel slide mt-5" data-bs-ride="carousel">
                <!-- Indicadores -->
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>

                <!-- Slides -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="Images/Tecldo.jpg" class="d-block w-100" alt="Producto 1">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Productos de Calidad</h5>
                            <p>De todo en Periféricos</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="Images/mousep.jpg" class="d-block w-100" alt="Producto 2">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Productos de Calidad</h5>
                            <p>De todo en Periféricos</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="Images/hdmi.jpg" class="d-block w-100" alt="Producto 3">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Productos de Calidad</h5>
                            <p>De todo en Periféricos</p>
                        </div>
                    </div>
                </div>

                <!-- Controles -->
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Anterior</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Siguiente</span>
                </button>
            </div>
        </main>

        <!-- Pie de página -->
        <footer id="footer" style="padding: 20px; text-align:center;">
            <p>&copy; 2025 Perifericos - Todos los derechos reservados.</p>
        </footer>

        <!-- Bootstrap JS Bundle (incluye Popper) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
