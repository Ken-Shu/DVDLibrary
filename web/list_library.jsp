<%@page session="true"%>
<%@page import="java.util.*" %>
<%@page import="model.DVDItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DVD清單</title>
    </head>
    <%
        List<DVDItem> dvdList = (List<DVDItem>) application.getAttribute("DVDList");
        if(!session.getAttributeNames().hasMoreElements()){
            session.setAttribute("showTitle", "true");
            session.setAttribute("showYear", "true");
            session.setAttribute("showGenre", "true");
        }
    %>
    <body>
        <h1>所有DVD:</h1>
        <h3>DVD資料庫有<%=dvdList.size()%>片DVD</h3>
        <table>
            <tr>
                <%if (session.getAttribute("showTitle") != null) {%>
                <th>片名</th>
                    <% } %>
                    <%if (session.getAttribute("showYear") != null) {%>
                <th>年分</th>
                    <% } %>
                    <%if (session.getAttribute("showGenre") != null) {%>
                <th>類型</th>
                    <% } %>
            </tr>
            <%for (DVDItem dvd : dvdList) {%>
            <tr>
                <%if (session.getAttribute("showTitle") != null) {%>
                <td><%=dvd.getTitle()%></td>
                <% } %>
                <%if (session.getAttribute("showYear") != null) {%>
                <td><%=dvd.getYear()%></td>
                <% } %>
                <%if (session.getAttribute("showGenre") != null) {%>
                <td><%=dvd.getGenre()%></td>
                <% } %>
            </tr>
            <% }%>
    </body>
</html>
