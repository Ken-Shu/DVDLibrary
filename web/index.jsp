

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <title>DVD資料庫</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>DVD資料庫</h1>
        <ul>
            <li>
                <a href='<%=response.encodeURL("list_library.jsp")%>'>顯示所有DVD</a>
            </li>
            <li>
                <a href='AddDVDForm'>新增DVD</a>
            </li>
            <li>
                <a href='set_prefs.jsp'>設定顯示偏好</a>
            </li>
        </ul>
    </body>
</html>
