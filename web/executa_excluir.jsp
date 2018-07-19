<%-- 
    Document   : executa_excluir
    Created on : 11/07/2018, 23:01:56
    Author     : Herbert Bruno <Herbertbruno at gmail.com>
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ProdutoDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                String id_cliente = request.getParameter("codigo");
                
                ProdutoDAO produtodao = new ProdutoDAO();
                produtodao.excluir(Integer.parseInt(id_cliente));
                response.sendRedirect("index.jsp");
            } catch (Exception e) {
                throw new RuntimeException("Erro 9:" + e);
            }
        %>
    </body>
</html>
