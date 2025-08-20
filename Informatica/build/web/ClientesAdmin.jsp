<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="Styles/CRUD.css" />
         <link rel="icon" href="Images/Logo.png" type="image/png">
        <title>Administración de Clientes</title>
    </head>
   
    <body>
            <!-- Botón de Inicio -->
    <div style="margin-bottom: 20px;">
        <a href="Index.jsp" class="btn btn-primary btn-block">Inicio</a>
    </div>

        <main class="crud-main">
            <section class="top-container">
                <div class="formulario">
                    <h2>Agregar / Modificar Cliente</h2>
                    <form action="Controlador?menu=ClientesAdmin" method="POST">
                        <label for="codigoCliente">Código del Cliente</label>
                        <input type="number" value="${cliente.getCodigoCliente()}" name="txtCodigoCliente" placeholder="Ej: 101" required/>

                        <label for="nombreCliente">Nombre</label>
                        <input type="text" value="${cliente.getNombreCliente()}" name="txtNombreCliente" placeholder="Ej: Juan Pérez" required/>

                        <label for="telefonoCliente">Teléfono</label>
                        <input type="text" value="${cliente.getTelefonoCliente()}" name="txtTelefonoCliente" placeholder="59677843" maxlength="8" required/>

                        <label for="correoCliente">Correo</label>
                        <input type="email" value="${cliente.getCorreoCliente()}" name="txtCorreoCliente" placeholder="cliente@correo.com" required/>

                        <label for="direccion">Dirección</label>
                        <input type="text" value="${cliente.getDireccion()}" name="txtDireccion" placeholder="Ej: Zona 1" required/>

                        <label for="codigoPeriferico">Código Periférico</label>
                        <input type="number" value="${cliente.getCodigoPeriferico()}" name="txtCodigoPeriferico" placeholder="Ej: 101" required/>

                        <button name="accion" value="Agregar" class="btn btn-primary btn-block btn-agregar">Agregar</button>
                        <button name="accion" value="Actualizar" class="btn btn-primary btn-block btn-Actualizar">Actualizar</button>
                    </form>
                </div>

                <!-- Tabla -->
                <div class="tabla-registros">
                    <h2>Clientes Registrados</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>Nombre</th>
                                <th>Teléfono</th>
                                <th>Correo</th>
                                <th>Dirección</th>
                                <th>Código Periférico</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cli" items="${clientes}">
                                <tr>
                                    <td>${cli.getCodigoCliente()}</td>
                                    <td>${cli.getNombreCliente()}</td>
                                    <td>${cli.getTelefonoCliente()}</td>
                                    <td>${cli.getCorreoCliente()}</td>
                                    <td>${cli.getDireccion()}</td>
                                    <td>${cli.getCodigoPeriferico()}</td>
                                    <td id="table-button">
                                        <a class="btn btn-primary btn-Actualizar" href="Controlador?menu=ClientesAdmin&accion=Editar&codigoCliente=${cli.getCodigoCliente()}">Editar</a>
                                        <a class="btn btn-primary btn-drop" href="Controlador?menu=ClientesAdmin&accion=Eliminar&codigoCliente=${cli.getCodigoCliente()}">Eliminar</a>
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
