package ru.nikolaev.partlist.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.log4j.Priority;
import ru.nikolaev.partlist.dao.PartDao;
import ru.nikolaev.partlist.mapper.PartMapper;
import ru.nikolaev.partlist.model.Part;
import ru.nikolaev.partlist.model.SearchFilter;
import ru.nikolaev.partlist.tool.DateHelper;

/**
 *
 * @author alexander
 */
@WebServlet(name = "PartList")
public class PartList extends HttpServlet {

    final static Logger LOGGER = Logger.getLogger(PartList.class);

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

        // фильтр
        SearchFilter filter = composeSearchFilter(request);
        request.setAttribute("searchFilter", filter);

        // сортировка
        // общие параметры
        request.setAttribute("commonQueryString", filter.getQueryString());
        // есть сортировка в запросе?
        String sortField = request.getParameter("sort");
        if (sortField == null || !this.isValidSortField(sortField)) {
            sortField = "part_number";
        }
        request.setAttribute("currentSort", sortField);
        // а порядок сортировки?
        boolean descSort = request.getParameter("desc") != null && request.getParameter("desc").equals("1");
        request.setAttribute("descSort", descSort);

        // список деталей по фильтру и сортировке
        PartDao partDao = new PartDao();
        List<Part> parts = new ArrayList<>();
        try {
            parts = PartMapper.map(partDao.find(filter, sortField, descSort));
        } catch (SQLException ex) {
            LOGGER.log(Priority.ERROR, "Database request error", ex);
        }
        request.setAttribute("parts", parts);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/index.jsp");
        requestDispatcher.forward(request, response);
    }

    /**
     * Сформировать объект фильтра
     *
     * @param request
     * @return
     */
    private SearchFilter composeSearchFilter(HttpServletRequest request) {

        // количество
        Integer filterQuantity = null;
        try {
            filterQuantity = request.getParameter("quantity") != null ? Integer.parseInt(request.getParameter("quantity")) : null;
        } catch (NumberFormatException e) {
        }

        // даты отправки и получения
        String shippedAfter = DateHelper.fiterHtmlFormDate(request.getParameter("shipped_after"));
        String shippedBefore = DateHelper.fiterHtmlFormDate(request.getParameter("shipped_before"));
        String receivedAfter = DateHelper.fiterHtmlFormDate(request.getParameter("received_after"));
        String receivedBefore = DateHelper.fiterHtmlFormDate(request.getParameter("received_before"));

        SearchFilter filter = new SearchFilter(
                Optional.ofNullable(request.getParameter("part_name")),
                Optional.ofNullable(request.getParameter("part_number")),
                Optional.ofNullable(request.getParameter("vendor")),
                Optional.ofNullable(filterQuantity),
                Optional.ofNullable(shippedAfter),
                Optional.ofNullable(shippedBefore),
                Optional.ofNullable(receivedAfter),
                Optional.ofNullable(receivedBefore)
        );

        return filter;
    }

    /**
     * Простая проверка, подходит ли поле из параметра для использования в
     * сортировке
     *
     * @param fieldName
     * @return <b>true</b> если имя поле подходящее, <b>false</b> если нет
     */
    private boolean isValidSortField(String fieldName) {
        return List.of(
                "part_number",
                "part_name",
                "vendor",
                "quantity",
                "shipped",
                "received"
        ).parallelStream().anyMatch(fieldName::equals);
    }

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
        return "Part List Servlet";
    }

}
