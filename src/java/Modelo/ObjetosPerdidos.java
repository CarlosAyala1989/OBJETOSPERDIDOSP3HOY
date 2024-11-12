/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;
import java.sql.Date;
/**
 *
 * @author playg
 */
public class ObjetosPerdidos {
    int ID;
    String Descripcion;
    String Persona_Encontrado;
    Date Fecha_Recepcion;

    public ObjetosPerdidos() {
    }

    public ObjetosPerdidos(int ID, String Descripcion, String Persona_Encontrado, Date Fecha_Recepcion) {
        this.ID = ID;
        this.Descripcion = Descripcion;
        this.Persona_Encontrado = Persona_Encontrado;
        this.Fecha_Recepcion = Fecha_Recepcion;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getPersona_Encontrado() {
        return Persona_Encontrado;
    }

    public void setPersona_Encontrado(String Persona_Encontrado) {
        this.Persona_Encontrado = Persona_Encontrado;
    }

    public Date getFecha_Recepcion() {
        return Fecha_Recepcion;
    }

    public void setFecha_Recepcion(Date Fecha_Recepcion) {
        this.Fecha_Recepcion = Fecha_Recepcion;
    }
    
    
}
