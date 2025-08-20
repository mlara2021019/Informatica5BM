package modelo;

public class Cliente {

    private int codigoCliente;
    private int codigoPeriferico;  // Relación con la tabla Periferico
    private String nombreCliente;
    private String telefonoCliente;
    private String correoCliente;
    private String direccion;

    public Cliente() {
    }

    // Constructor con parámetros
    public Cliente(int codigoCliente, int codigoPeriferico, String nombreCliente, String telefonoCliente,
                   String correoCliente, String direccion) {
        this.codigoCliente = codigoCliente;
        this.codigoPeriferico = codigoPeriferico;
        this.nombreCliente = nombreCliente;
        this.telefonoCliente = telefonoCliente;
        this.correoCliente = correoCliente;
        this.direccion = direccion;
    }

    // metodos getter y setter
    public int getCodigoCliente() {
        return codigoCliente;
    }

    public void setCodigoCliente(int codigoCliente) {
        this.codigoCliente = codigoCliente;
    }

    public int getCodigoPeriferico() {
        return codigoPeriferico;
    }

    public void setCodigoPeriferico(int codigoPeriferico) {
        this.codigoPeriferico = codigoPeriferico;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getTelefonoCliente() {
        return telefonoCliente;
    }

    public void setTelefonoCliente(String telefonoCliente) {
        this.telefonoCliente = telefonoCliente;
    }

    public String getCorreoCliente() {
        return correoCliente;
    }

    public void setCorreoCliente(String correoCliente) {
        this.correoCliente = correoCliente;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    // Método toString
    @Override
    public String toString() {
        return "Cliente{" +
                "codigoCliente=" + codigoCliente +
                ", codigoPeriferico=" + codigoPeriferico +
                ", nombreCliente='" + nombreCliente + '\'' +
                ", telefonoCliente='" + telefonoCliente + '\'' +
                ", correoCliente='" + correoCliente + '\'' +
                ", direccion='" + direccion + '\'' +
                '}';
    }
}
