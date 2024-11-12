/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author playg
 */
public class ObjetosEntregados {
    int ID;
    int ID_objeto_perdido;
    String Dueno;
    String Fecha_Entrega;

    public ObjetosEntregados() {
    }

    public ObjetosEntregados(int ID, int ID_objeto_perdido, String Dueno, String Fecha_Entrega) {
        this.ID = ID;
        this.ID_objeto_perdido = ID_objeto_perdido;
        this.Dueno = Dueno;
        this.Fecha_Entrega = Fecha_Entrega;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getID_objeto_perdido() {
        return ID_objeto_perdido;
    }

    public void setID_objeto_perdido(int ID_objeto_perdido) {
        this.ID_objeto_perdido = ID_objeto_perdido;
    }

    public String getDueno() {
        return Dueno;
    }

    public void setDueno(String Dueno) {
        this.Dueno = Dueno;
    }

    public String getFecha_Entrega() {
        return Fecha_Entrega;
    }

    public void setFecha_Entrega(String Fecha_Entrega) {
        this.Fecha_Entrega = Fecha_Entrega;
    }

    
}
