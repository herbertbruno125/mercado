<%-- 
    Document   : index
    Created on : 13/07/2018, 17:34:34
    Author     : Herbert Bruno <Herbertbruno at gmail.com>
--%>

<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="index.jsp" method="post">
            <label>Descricao</label>

            <input type="text" name="descricao" /><br>

            <button type="submit">
                OK
            </button>

        </form>

        <%
        //enviado do github
        //enviado do netbeans
            try {
                out.print("<table border= '0'>");
                out.print("<tr>");
                out.print("<th>Codigo</th><th>Descrição</th><th>Preço</th><th>Editar</th><th>Excluir</th>");
                out.print("</tr>");
                ProdutoDAO produtodao = new ProdutoDAO();
                if (request.getParameter("descricao") == "" || request.getParameter("descricao") == null) {
                    ArrayList<Produto> lista = produtodao.listarTodos();
                    for (int i = 0; i < lista.size(); i++) {
                        out.print("<tr>");
                        out.print("<td>"+lista.get(i).getCodigo_produto()+"</td>");
                        out.print("<td>"+lista.get(i).getDescricao_produto()+"</td>");
                        out.print("<td>"+lista.get(i).getPreco_produto()+"</td>");
                        out.print("<td><a href='alterar.jsp?codigo="+lista.get(i).getCodigo_produto()+"&descricao="+lista.get(i).getDescricao_produto()+"&preco="+lista.get(i).getPreco_produto()+"'>CLIQUE</a></td>");
                        out.print("<td><a href='excluir.jsp?codigo="+lista.get(i).getCodigo_produto()+"&descricao="+lista.get(i).getDescricao_produto()+" '>CLIQUE</a></td>");
                        out.print("</tr>");
                    }
                } else {
                    ArrayList<Produto> lista = produtodao.listarTodosDescricao(request.getParameter("descricao"));
                    for (int i = 0; i < lista.size(); i++) {
                        out.print("<tr>");
                        out.print("<td>" + lista.get(i).getCodigo_produto() + "</td>");
                        out.print("<td>" + lista.get(i).getDescricao_produto() + "</td>");
                        out.print("<td>" + lista.get(i).getPreco_produto() + "</td>");
                        out.print("<td><a href='alterar.jsp?codigo="+lista.get(i).getCodigo_produto()+"&descricao="+lista.get(i).getDescricao_produto()+"&preco="+lista.get(i).getPreco_produto()+"'>CLIQUE</a></td>");
                        out.print("<td><a href='excluir.jsp?codigo="+lista.get(i).getCodigo_produto()+"&descricao="+lista.get(i).getDescricao_produto()+" '>CLIQUE</a></td>");
                        out.print("</tr>");
                    }
                }
                out.print("</table>");
            } catch (Exception e) {
                throw new RuntimeException("erro 10" + e);
            }


        %>
        <br>
        <br>
        <a href="inserir.jsp">NOVO</a>
    </body>
</html>
