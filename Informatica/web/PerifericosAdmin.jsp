<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="Styles/CRUD.css" />
         <link rel="icon" href="Images/Logo.png" type="image/png">
        <title>Administración de Periféricos</title>
    </head>
    <!-- Botón de Inicio -->
    <div style="margin-bottom: 20px;">
        <a href="Index.jsp" class="btn btn-primary btn-block">Inicio</a>
    </div>

    <body>
        <main class="crud-main">
            <section class="top-container">
                <div class="formulario">
                    <h2>Agregar / Modificar Periférico</h2>
                    <form action="Controlador?menu=PerifericosAdmin" method="POST">
                        <label for="codigoPeriferico">Código del Periférico</label>
                        <input type="number" value="${periferico.getCodigoPeriferico()}" name="txtCodigoPeriferico" placeholder="Ej: 101" required/>

                        <label for="nombrePeriferico">Nombre</label>
                        <input type="text" value="${periferico.getNombre()}" name="txtNombrePeriferico" placeholder="Ej: Teclado" required/>
                        
                        <label for="marcaPeriferico">Marca</label>
                        <input type="text" value="${periferico.getMarca()}" name="txtMarcaPeriferico" placeholder="Ej: Logitech" required/>
                        
                        <label for="precioPeriferico">Precio</label>
                        <input type="number" step="0.01" value="${periferico.getPrecio()}" name="txtPrecioPeriferico" placeholder="Ej: 250.00" required/>
                        
                        <button name="accion" value="Agregar" class="btn btn-primary btn-block btn-agregar">Agregar</button>
                        <button name="accion" value="Actualizar" class="btn btn-primary btn-block btn-Actualizar">Actualizar</button>
                    </form>
                </div>

                <!-- Tabla -->
                <div class="tabla-registros">
                    <h2>Periféricos Registrados</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>Nombre</th>
                                <th>Marca</th>
                                <th>Precio</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="per" items="${perifericos}">
                                <tr>
                                    <td>${per.getCodigoPeriferico()}</td>
                                    <td>${per.getNombre()}</td>
                                    <td>${per.getMarca()}</td>
                                    <td>${per.getPrecio()}</td>
                                    <td id="table-button">
                                        <a class="btn btn-primary btn-Actualizar" href="Controlador?menu=PerifericosAdmin&accion=Editar&codigoPeriferico=${per.getCodigoPeriferico()}">Editar</a>
                                        <a class="btn btn-primary btn-drop" href="Controlador?menu=PerifericosAdmin&accion=Eliminar&codigoPeriferico=${per.getCodigoPeriferico()}">Eliminar</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>
        </main>
        <footer id="footer" style="padding: 20px; text-align:center;">
            <p>&copy; 2025 perifericos - Todos los derechos reservados.</p>
        </footer>
    </body>
</html>
