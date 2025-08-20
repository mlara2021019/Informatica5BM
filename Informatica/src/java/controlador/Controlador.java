package controlador;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.*;

public class Controlador extends HttpServlet {

    // Instancias de las entidades y DAOs
    Cliente cliente = new Cliente();
    ClienteDAO clienteDAO = new ClienteDAO();
    Periferico periferico = new Periferico();
    PerifericoDAO perifericoDAO = new PerifericoDAO();
    
    int codCliente;
    int codPeriferico;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        // Verificar si el parámetro 'menu' es igual a "Principal"
        if (menu.equals("Index")) {
            // Hacer el forward al JSP 'MenuInicio.jsp'
            request.getRequestDispatcher("Index.jsp").forward(request, response);
        } else if (menu.equals("ClientesAdmin")) {

            switch (accion) {
                case "Listar":
                    List listaClientes = clienteDAO.listar();
                    request.setAttribute("clientes", listaClientes);
                    break;
                case "Agregar":
                    String nombreCliente = request.getParameter("txtNombreCliente");
                    String telefonoCliente = request.getParameter("txtTelefonoCliente");
                    String correoCliente = request.getParameter("txtCorreoCliente");
                    String direccion = request.getParameter("txtDireccion");
                    int codigoPerifericoCliente = Integer.parseInt(request.getParameter("txtCodigoPeriferico"));
                    cliente.setNombreCliente(nombreCliente);
                    cliente.setTelefonoCliente(telefonoCliente);
                    cliente.setCorreoCliente(correoCliente);
                    cliente.setDireccion(direccion);
                    cliente.setCodigoPeriferico(codigoPerifericoCliente);
                    clienteDAO.agregar(cliente);
                    request.getRequestDispatcher("Controlador?menu=ClientesAdmin&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codCliente = Integer.parseInt(request.getParameter("codigoCliente"));
                    Cliente c = clienteDAO.listarCodigoCliente(codCliente);
                    request.setAttribute("cliente", c);
                    request.getRequestDispatcher("ClientesAdmin.jsp").forward(request, response);
                    break;
                case "Actualizar":
                    int idCliente = Integer.parseInt(request.getParameter("txtCodigoCliente"));
                    String nomCliente = request.getParameter("txtNombreCliente");
                    String telCliente = request.getParameter("txtTelefonoCliente");
                    String emailCliente = request.getParameter("txtCorreoCliente");
                    String ubicacion = request.getParameter("txtDireccion");
                    int codigoPeriferico = Integer.parseInt(request.getParameter("txtCodigoPeriferico"));
                    cliente.setCodigoCliente(idCliente);
                    cliente.setNombreCliente(nomCliente);
                    cliente.setTelefonoCliente(telCliente);
                    cliente.setCorreoCliente(emailCliente);
                    cliente.setDireccion(ubicacion);
                    cliente.setCodigoPeriferico(codigoPeriferico);
                    clienteDAO.actualizar(cliente);
                    request.getRequestDispatcher("Controlador?menu=ClientesAdmin&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codCliente = Integer.parseInt(request.getParameter("codigoCliente"));
                    clienteDAO.eliminar(codCliente);
                    request.getRequestDispatcher("Controlador?menu=ClientesAdmin&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("ClientesAdmin.jsp").forward(request, response);

        } else if (menu.equals("PerifericosAdmin")) {

            switch (accion) {
                case "Listar":
                    List listaPerifericos = perifericoDAO.listar();
                    request.setAttribute("perifericos", listaPerifericos);
                    break;
                case "Agregar":
                    String nombrePeriferico = request.getParameter("txtNombrePeriferico");
                    String marcaPeriferico = request.getParameter("txtMarcaPeriferico");
                    double precioPeriferico = Double.parseDouble(request.getParameter("txtPrecioPeriferico"));
                    periferico.setNombre(nombrePeriferico);
                    periferico.setMarca(marcaPeriferico);
                    periferico.setPrecio(precioPeriferico);
                    perifericoDAO.agregar(periferico);
                    request.getRequestDispatcher("Controlador?menu=PerifericosAdmin&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codPeriferico = Integer.parseInt(request.getParameter("codigoPeriferico"));
                    Periferico p = perifericoDAO.listarCodigoPeriferico(codPeriferico);
                    request.setAttribute("periferico", p);
                    request.getRequestDispatcher("PerifericosAdmin.jsp").forward(request, response);
                    break;
                case "Actualizar":
                    int idPeriferico = Integer.parseInt(request.getParameter("txtCodigoPeriferico"));
                    String nomPeriferico = request.getParameter("txtNombrePeriferico");
                    String marca = request.getParameter("txtMarcaPeriferico");
                    double precio = Double.parseDouble(request.getParameter("txtPrecioPeriferico"));
                    periferico.setCodigoPeriferico(idPeriferico);
                    periferico.setNombre(nomPeriferico);
                    periferico.setMarca(marca);
                    periferico.setPrecio(precio);
                    perifericoDAO.actualizar(periferico);
                    request.getRequestDispatcher("Controlador?menu=PerifericosAdmin&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codPeriferico = Integer.parseInt(request.getParameter("codigoPeriferico"));
                    perifericoDAO.eliminar(codPeriferico);
                    request.getRequestDispatcher("Controlador?menu=PerifericosAdmin&accion=Listar").forward(request, response);
                    break;
                    
            }
            request.getRequestDispatcher("PerifericosAdmin.jsp").forward(request, response);
        }
    }

    // Métodos HttpServlet
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador de clientes y perifericos";
    }
}
