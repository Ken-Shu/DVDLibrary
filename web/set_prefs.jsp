
<%@page session='true'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>設定顯示偏好</title>
    </head>
    <body>
        <h3>設定顯示偏好</h3>
        <form action='<%=response.encodeURL("Set_Prefs")%>' method ='POST'>
            顯示欄位:
            <input type='checkbox' name='show' value='showTitle' 
                   <%if(session.getAttribute("showTitle") != null){out.print("checked");}%>>片名
            
            <input type='checkbox' name='show' value='showYear' 
                   <%if(session.getAttribute("showYear") != null){out.print("checked");}%>>年分
            
            <input type='checkbox' name='show' value='showGenre' 
                   <%if(session.getAttribute("showGenre") != null){out.print("checked");}%>>類型
            <br><br>
            <input type='submit' value='設定'>
            
        </form>
        
    </body>
</html>
