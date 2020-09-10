/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;

/**
 *
 * @author Administrador
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class conexao {

    private Connection conecta;
    private PreparedStatement ps;
    private ResultSet rs;

    public conexao() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnfe) {
            System.out.println("Classe não encontrada..");
        }
        try {
            conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quim1", "root", "19twostars");
        } catch (SQLException sqle) {
            System.out.println("Deu pau... conexao");
        }
    }

    public boolean validaUsuario(String nome, String senha) {

        boolean autentico = false;

        try {
            ps = conecta.prepareStatement("select * from usuario where nome='" + nome + "' and senha='" + senha + "'");
            rs = ps.executeQuery();

            if (rs.next()) {
                autentico = true;
                ps.close();
                rs.close();
            }

        } catch (SQLException sqle) {
            System.out.println("Deu pau... validaAluno");
        }

        return autentico;
    }

    public void cadAluno(String rmaluno, String nomealuno, String endaluno, String fotoaluno) {
        try {
            PreparedStatement pst = conecta.prepareStatement("INSERT INTO testealuno(rmaluno,nomealuno,endaluno,fotoaluno) VALUES (" + rmaluno + ",'" + nomealuno + "','" + endaluno + "','" + fotoaluno + "')");
            pst.executeUpdate();
            pst.close();
        } catch (SQLException sqle) {
            System.out.println("Deu pau... conexao.cadAluno");
        }
    }
}
