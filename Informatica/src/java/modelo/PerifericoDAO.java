package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PerifericoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    Periferico periferico = new Periferico();

    // Método para listar todos los periféricos
    public List<Periferico> listar() {
        String sql = "CALL sp_ListarPeriferico();";
        List<Periferico> listaPerifericos = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Periferico p = new Periferico();
                p.setCodigoPeriferico(rs.getInt("codigoPeriferico"));
                p.setNombre(rs.getString("Nombre"));
                p.setMarca(rs.getString("Marca"));
                p.setPrecio(rs.getDouble("Precio"));
                listaPerifericos.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaPerifericos;
    }

    // Método para agregar un nuevo periférico
    public int agregar(Periferico p) {
        String sql = "CALL sp_AgregarPeriferico(?, ?, ?);";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getMarca());
            ps.setDouble(3, p.getPrecio());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // Método para buscar un periférico por su código
    public Periferico listarCodigoPeriferico(int id) {
        Periferico p = null;
        String sql = "CALL sp_BuscarPeriferico(?);";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                p = new Periferico();
                p.setCodigoPeriferico(rs.getInt("codigoPeriferico"));
                p.setNombre(rs.getString("Nombre"));
                p.setMarca(rs.getString("Marca"));
                p.setPrecio(rs.getDouble("Precio"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    // Método para editar un periférico
    public int actualizar(Periferico p) {
        String sql = "CALL sp_EditarPeriferico(?, ?, ?, ?);";
        resp = 0;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, p.getCodigoPeriferico());
            ps.setString(2, p.getNombre());
            ps.setString(3, p.getMarca());
            ps.setDouble(4, p.getPrecio());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // Método para eliminar un periférico
public int eliminar(int id) {
    String sql = "CALL sp_EliminarPeriferico(?);";
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
