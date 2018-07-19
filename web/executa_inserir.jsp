<%-- 
    Document   : executa_inserir
    Created on : 11/07/2018, 23:00:42
    Author     : Herbert Bruno <Herbertbruno at gmail.com>
--%>
<%@page import ="model.Produto" %>
<%@page import ="dao.ProdutoDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Produto produto = new Produto();
                ProdutoDAO produtodao = new ProdutoDAO();
                
                if (request.getParameter("descricao").equals("") || 
                        request.getParameter("preco").equals("")) {
                       response.sendRedirect("index.jsp");
                    }else{
                    produto.setDescricao_produto(request.getParameter("descricao"));
                    produto.setPreco_produto(Double.parseDouble(request.getParameter("preco")));
                    produtodao.inserir(produto);
                    response.sendRedirect("index.jsp");
                }
            } catch (Exception e) {
                throw new RuntimeException("Erro 7:" + e);
            }
        %>
    </body>
</html>
