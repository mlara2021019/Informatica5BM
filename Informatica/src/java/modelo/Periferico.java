package modelo;

public class Periferico {

    private int codigoPeriferico;
    private String nombre;
    private String marca;
    private double precio;

    
    public Periferico() {
    }

    // Constructor con parámetros
    public Periferico(int codigoPeriferico, String nombre, String marca, double precio) {
        this.codigoPeriferico = codigoPeriferico;
        this.nombre = nombre;
        this.marca = marca;
        this.precio = precio;
    }

    // metodos getter y setter
    public int getCodigoPeriferico() {
        return codigoPeriferico;
    }

    public void setCodigoPeriferico(int codigoPeriferico) {
        this.codigoPeriferico = codigoPeriferico;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    // Método toString
    @Override
    public String toString() {
        return "Periferico{" +
                "codigoPeriferico=" + codigoPeriferico +
                ", nombre='" + nombre + '\'' +
                ", marca='" + marca + '\'' +
                ", precio=" + precio +
                '}';
    }
}
