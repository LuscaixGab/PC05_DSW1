<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<%-- Define o padrão brasileiro para formatação de números e datas --%>
<fmt:setLocale value="pt_BR" />

<html>
<head>
    <title>Livraria Virtual</title>
</head>
<body>
    <div align="center">
        <h1>Gerenciamento de Livros</h1>
        <h2>
            <a href="/${requestScope.contextPath}">Menu Principal</a> &nbsp;&nbsp;&nbsp; 
            <a href="/${requestScope.contextPath}/livros/cadastro">Adicione Novo Livro</a>
        </h2>
    </div>

    <div align="center">
        <table border="1">
            <caption>Lista de Livros</caption>
            <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Editora</th>
                <th>Autor</th>
                <th>Ano</th>
                <th>Preço</th>
                <th>Ações</th>
            </tr>
            <c:forEach var="livro" items="${requestScope.listaLivros}">
                <tr>
                    <td>${livro.id}</td>
                    <td>${livro.titulo}</td>
                    <td>${livro.editora.nome}</td>
                    <td>${livro.autor}</td>
                    <td>${livro.ano}</td>
                    <td>
                        <%-- Formata o preço automaticamente para R$ 00,00 --%>
                        <fmt:formatNumber value="${livro.preco}" type="currency" currencySymbol="R$" />
                    </td>
                    <td>
                        <a href="/${requestScope.contextPath}/livros/edicao?id=${livro.id}">Edição</a>
                        &nbsp;&nbsp;&nbsp;&nbsp; 
                        <a href="/${requestScope.contextPath}/livros/remocao?id=${livro.id}"
                           onclick="return confirm('Tem certeza de que deseja excluir este item?');">
                           Remoção 
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>