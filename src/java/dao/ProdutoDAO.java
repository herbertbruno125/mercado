/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import model.Produto;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Herbert Bruno <Herbertbruno at gmail.com>
 */
public class ProdutoDAO {

    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    private ArrayList<Produto> lista  = new ArrayList<>();
    

    public ProdutoDAO() {
        conn = new ConnectionFactory().getConexao();
    }

    public void inserir(Produto produto) {
        String sql = "INSERT INTO PRODUTO (descricao_produto, preco_produto) VALUES (?,?) ";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, produto.getDescricao_produto());
            stmt.setDouble(2, produto.getPreco_produto());
            stmt.execute();
            stmt.close();

        } catch (Exception e) {
            throw new RuntimeException("Erro 1: " + e);
        }
    }

    public void alterar(Produto produto) {
        String sql = "UPDATE produto SET descricao_produto = ?, preco_produto = ? WHERE codigo_produto =?";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, produto.getDescricao_produto());
            stmt.setDouble(2, produto.getPreco_produto());
            stmt.setInt(3, produto.getCodigo_produto());
            stmt.execute();
            stmt.close();

        } catch (Exception e) {
            throw new RuntimeException("Erro 1: " + e);
        }
    }

    public void excluir(int valor) {
        String sql = "DELETE FROM produto WHERE codigo_produto =" + valor;
        try {
            st = conn.createStatement();
            st.execute(sql);
            st.close();

        } catch (Exception e) {
            throw new RuntimeException("Erro 4: " + e);
        }
    }
    
    public ArrayList<Produto> listarTodos(){
        String sql = "SELECT * FROM PRODUTO";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {                
                Produto produto = new Produto();
                produto.setCodigo_produto(rs.getInt("codigo_produto"));
                produto.setDescricao_produto(rs.getString("descricao_produto"));
                produto.setPreco_produto(rs.getDouble("preco_produto"));
                lista.add(produto);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Erro 1: " + e);
        }
        
        
        return lista;
    }
    public ArrayList<Produto> listarTodosDescricao(String valor){
        String sql = "SELECT * FROM PRODUTO WHERE descricao_produto LIKE '%"+valor+"%'";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {                
                Produto produto = new Produto();
                produto.setCodigo_produto(rs.getInt("codigo_produto"));
                produto.setDescricao_produto(rs.getString("descricao_produto"));
                produto.setPreco_produto(rs.getDouble("preco_produto"));
                lista.add(produto);
            }
            
        } catch (SQLException e) {
            throw new RuntimeException("Erro 1: " + e);
        }
        
        
        return lista;
    }

}









