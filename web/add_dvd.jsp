<%-- 
    Document   : add_dvd
    Created on : 2021/7/25, 下午 01:46:04
    Author     : ABC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add DVD Form</title>
    </head>
    <body>
        <h3>新增DVD</h3>
        <form action ="Add_DVD" method ="">
            片名:<input type ="text" name ="title"/><br><br>
            年分:<input type ="text" name ="year"/><br><br>
            類型:<select name="genre">
                <%
                    String[] genres = (String[]) request.getAttribute("genreList");
                    for (String genre : genres) {
                %>
                <option value ="<%=genre%>"><%=genre%> </option>
                <%
                    }
                %>
            </select>
            或其他種類: <input type ="text" name="otherGenre"><br><br>
            <input type ="submit" value="儲存"/>
        </form>
    </body>
</html>
