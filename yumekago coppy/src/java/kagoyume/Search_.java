/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;



import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import TBD.ProductDataBeans;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import TBD.ProductSearch;


public class Search_ extends HttpServlet {

    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //indexからの検索ワードを受け取る処理
            request.setCharacterEncoding("UTF-8");
            
            String key=request.getParameter("product");
            
            if(key.equals("")){
                String errormessage=("検索ワードが未入力です。");
                request.setAttribute("error",errormessage);
                request.getRequestDispatcher("/error.jsp").forward(request,response);
            }
            
            
            HttpSession hs = request.getSession();
            
            ProductSearch PS = new ProductSearch();
            
            ArrayList<ProductDataBeans> PDB_List =(ArrayList<ProductDataBeans>)PS.ProductSearch(key);
            if(PDB_List.size()==0){
                String errormessage=("検索結果がありませんでした");
                request.setAttribute("error",errormessage);
                request.getRequestDispatcher("/error.jsp").forward(request,response);
            }
            
            hs.setAttribute("PDB_List", PDB_List);
            
            request.getRequestDispatcher("/search.jsp").forward(request,response);
            
        }catch(Exception e){
            request.setAttribute("error",e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request,response);
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
