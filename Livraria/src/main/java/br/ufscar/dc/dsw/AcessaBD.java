package br.ufscar.dc.dsw;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AcessaBD {

    public static void main(String[] args) {
        try {
            // Setup para uso do banco de dados MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/Livraria?useTimezone=true&serverTimezone=UTC";
            
            // Acessa MySQL usando o usuário e senha
            Connection con = DriverManager.getConnection(url, "root", "root");

            // Cria o "veículo" que leva comando SQL até o banco
            Statement stmt = con.createStatement();
            
            // Guarda a tabela que o banco devolve como resposta
            ResultSet rs = stmt.executeQuery("select * from Livro");

            // Lê linha por linha da tabela
            while (rs.next()) {
                System.out.print(rs.getString("Titulo"));
                System.out.print(", " + rs.getString("Autor"));
                System.out.print(", " + rs.getInt("Ano"));
                System.out.println(" (R$ " + rs.getFloat("Preco") + ")");
            }

            // Fecha a conexão depois de usar
            stmt.close();
            con.close();

        } catch (ClassNotFoundException e) {
            System.out.println("A classe do driver de conexão não foi encontrada!");
        } catch (SQLException e) {
            System.out.println("O comando SQL não pode ser executado!");
            e.printStackTrace(); // Imprime o erro real caso a senha ou a porta estejam erradas
        }
    }
}