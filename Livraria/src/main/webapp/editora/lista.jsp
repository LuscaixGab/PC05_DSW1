<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Gerenciamento de Editoras</title>
</head>
<body>
    <div align="center">
        <h1>Gerenciamento de Editoras</h1>
        <h2>
            <a href="/Livraria/editoras/cadastro">Adicionar Nova Editora</a>
            &nbsp;&nbsp;&nbsp;
            <a href="/Livraria/">Menu Principal</a>
        </h2>
    </div>
    <div align="center">
        <table border="1" cellpadding="5">
            <caption>Lista de Editoras</caption>
            <tr>
                <th>ID</th>
                <th>CNPJ</th>
                <th>Nome</th>
                <th>Ações</th>
            </tr>
            <c:forEach var="editora" items="${listaEditoras}">
                <tr>
                    <td><c:out value="${editora.id}" /></td>
                    <td><c:out value="${editora.CNPJ}" /></td>
                    <td><c:out value="${editora.nome}" /></td>
                    <td>
                        <a href="/Livraria/editoras/edicao?id=<c:out value='${editora.id}' />">Editar</a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="/Livraria/editoras/remocao?id=<c:out value='${editora.id}' />" onclick="return confirm('Tem certeza que deseja remover esta editora?');">Remover</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>