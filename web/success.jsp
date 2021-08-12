
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add DVD Success</title>
    </head>
    <body>
        <h3>新增DVD成功</h3>
        新增DVD : <br><br>
        片名 : ${dvdItem.title}<br><br>
        發行年分 : ${dvdItem.year}<br><br>
        類型 : ${dvdItem.genre}<br><br>
        <a href="index.jsp">回首頁</a>
    </body>
</html>
