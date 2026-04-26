<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Cadastro de Editora</title>
</head>
<body>
    <div align="center">
        <h1>
            <c:if test="${editora != null}">
                Editar Editora
            </c:if>
            <c:if test="${editora == null}">
                Adicionar Nova Editora
            </c:if>
        </h1>
    </div>
    <div align="center">
        <c:if test="${editora != null}">
            <form action="/Livraria/editoras/atualizacao" method="post">
            <input type="hidden" name="id" value="<c:out value='${editora.id}' />" />
        </c:if>
        <c:if test="${editora == null}">
            <form action="/Livraria/editoras/insercao" method="post">
        </c:if>
            <table border="1" cellpadding="5">
                <tr>
                    <th>CNPJ: </th>
                    <td>
                        <input type="text" name="CNPJ" size="18" value="<c:out value='${editora.CNPJ}' />" required />
                    </td>
                </tr>
                <tr>
                    <th>Nome: </th>
                    <td>
                        <input type="text" name="nome" size="45" value="<c:out value='${editora.nome}' />" required />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Salvar" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>