package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    // Listar todos los clientes
    public List<Cliente> listar() {
        String sql = "SELECT * FROM Cliente";
        List<Cliente> listaClientes = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cl = new Cliente();
                cl.setCodigoCliente(rs.getInt("codigoCliente"));
                cl.setNombreCliente(rs.getString("nombreCliente"));
                cl.setTelefonoCliente(rs.getString("telefonoCliente"));
                cl.setCorreoCliente(rs.getString("correoCliente"));
                cl.setDireccion(rs.getString("direccion"));
                cl.setCodigoPeriferico(rs.getInt("codigoPeriferico"));
                listaClientes.add(cl);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaClientes;
    }

    // Agregar un nuevo cliente
    public int agregar(Cliente cl) {
        String sql = "INSERT INTO Cliente(nombreCliente, telefonoCliente, correoCliente, direccion, codigoPeriferico) VALUES (?, ?, ?, ?, ?)";
        resp = 0;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cl.getNombreCliente());
            ps.setString(2, cl.getTelefonoCliente());
            ps.setString(3, cl.getCorreoCliente());
            ps.setString(4, cl.getDireccion());
            ps.setInt(5, cl.getCodigoPeriferico());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // Listar un cliente por su código
    public Cliente listarCodigoCliente(int id) {
        Cliente clie = null;
        String sql = "SELECT * FROM Cliente WHERE codigoCliente = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                clie = new Cliente();
                clie.setCodigoCliente(rs.getInt("codigoCliente"));
                clie.setNombreCliente(rs.getString("nombreCliente"));
                clie.setTelefonoCliente(rs.getString("telefonoCliente"));
                clie.setCorreoCliente(rs.getString("correoCliente"));
                clie.setDireccion(rs.getString("direccion"));
                clie.setCodigoPeriferico(rs.getInt("codigoPeriferico"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return clie;
    }

    // Actualizar un cliente existente
    public int actualizar(Cliente cl) {
        String sql = "UPDATE Cliente SET nombreCliente = ?, telefonoCliente = ?, correoCliente = ?, direccion = ?, codigoPeriferico = ? WHERE codigoCliente = ?";
        resp = 0;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cl.getNombreCliente());
            ps.setString(2, cl.getTelefonoCliente());
            ps.setString(3, cl.getCorreoCliente());
            ps.setString(4, cl.getDireccion());
            ps.setInt(5, cl.getCodigoPeriferico());
            ps.setInt(6, cl.getCodigoCliente());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // Eliminar un cliente por su código
    public int eliminar(int id) {
        String sql = "DELETE FROM Cliente WHERE codigoCliente = ?";
        resp = 0;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
}
