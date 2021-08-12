<%-- 
    Document   : error
    Created on : 2021/7/25, 下午 03:07:25
    Author     : ABC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add DVD Error</title>
    </head>
    <body>
        <h3>新增失敗</h3>
        <font color ="red">請修正下列錯誤 :
        <ul>
            <%
                List<String> errors = (List<String>) request.getAttribute("errorMsgs");
                for (String error : errors) {
            %>
            <li><%=error%></li>
                <% } %>
        </ul>
        <a href="AddDVDForm">重新輸入</a>
    </body>
</html>
