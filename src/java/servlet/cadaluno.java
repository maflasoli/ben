/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BD.conexao;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.ResultSet;
import javax.servlet.annotation.WebServlet;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author Administrador
 */
@WebServlet(name = "cadaluno", urlPatterns = {"/cadaluno"})
public class cadaluno extends HttpServlet {

    conexao con = new conexao();
    ResultSet lista = null;

    //Connection con;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String rm = request.getParameter("txtRmAluno");
            String nome = request.getParameter("txtNomeAluno");
            String endereco = request.getParameter("txtEndAluno");

            String foto = request.getParameter("foto");//Será convertido em arquivo

            String arquivo = foto.split(",")[1];

            byte[] btDataFile;

            String caminhoImagem = request.getServletContext().getRealPath("fotos") + File.separator;
            //String caminhoImagem = "../fotos";
//
//            btDataFile = DatatypeConverter.parseBase64Binary(arquivo);
//            File of = new File(caminhoImagem + rm + ".png");
//            try (FileOutputStream osf = new FileOutputStream(of)) {
//                osf.write(btDataFile);
//                osf.flush();
//                osf.close();// SE NÃO COLOCAR O CLOSE, ELE DEIXA O ARQUIVO ABERTO...
//            }
            con.cadAluno(rm, nome, endereco, rm);

            response.sendRedirect("CadAluno.jsp");

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet cadAluno</title>");
            
            out.println("</head>");
            out.println("<body>");

            out.println(caminhoImagem);

            out.println("</body>");
            out.println("</html>");

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
