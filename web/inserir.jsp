<%-- 
    Document   : inserir
    Created on : 13/07/2018, 20:28:55
    Author     : Herbert Bruno <Herbertbruno at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="executa_inserir.jsp" method="Post">
            <!--<label>Codigo:</label><br>
            <input type="text" name="codigo"/><br>-->
            
            <label>Descricao:</label><br>
            <input type="text" name="descricao"/><br>
            
            <label>Preço:</label><br>
            <input type="text" name="preco"/><br>
            
            <button type="submit">
                OK
            </button>
            
            
        
        </form>
    </body>
</html>
