<%-- 
    Document   : executa_inserir
    Created on : 11/07/2018, 23:00:42
    Author     : Herbert Bruno <Herbertbruno at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="model.Produto" %>
<%@page import ="dao.ProdutoDAO" %>
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
                    produto.setCodigo_produto(Integer.parseInt(request.getParameter("codigo")));
                    produtodao.alterar(produto);
                    response.sendRedirect("index.jsp");
                }
            } catch (Exception e) {
                throw new RuntimeException("Erro 8:" + e);
            }
        %>
    </body>
</html>
