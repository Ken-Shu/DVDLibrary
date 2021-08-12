/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DVDItem;

/**
 *
 * @author ABC
 */
@WebServlet(name = "AddDVDSevelet", urlPatterns = {"/Add_DVD"})
public class AddDVDSevelet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         String title = request.getParameter("title");
         String year = request.getParameter("year");
         String genre = request.getParameter("otherGenre");
         if(genre == null || genre.trim().length()== 0){
             genre = request.getParameter(genre);
         }
         
         List<String> errorMsgs = new ArrayList<>();
         if(title == null || title.trim().length() == 0){
             errorMsgs.add("請輸入DVD片名");
         }
         if(year == null || year.trim().length() == 0){
             errorMsgs.add("請輸入DVD發行年分");
         }else if(!year.matches("\\d\\d\\d\\d")){
             errorMsgs.add("請輸入有效發行年分");
         }
         if(!errorMsgs.isEmpty()){
             RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
             request.setAttribute("errorMsgs", errorMsgs);
             rd.forward(request, response);
         }else {
             DVDItem dvd = new DVDItem(title, year, genre);
             ServletContext context = getServletContext();
             List<DVDItem> dvdList = (List<DVDItem>)context.getAttribute("DVDList");
             if(dvdList == null){
                 dvdList = new LinkedList<>();
                 context.setAttribute("DVDList", dvdList);
             }
             dvdList.add(dvd);
             
             RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
             request.setAttribute("dvdItem", dvd);
             rd.forward(request, response);
         }
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
