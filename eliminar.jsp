<%@ include file="../../WEB-INF/lib/conexion.jspf" %> <!-- Incluir la conexión -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<sql:update dataSource="${profesores}" var="resultado">
    DELETE FROM profesor WHERE id = ?;
    <sql:param value="${param.id}" />
</sql:update>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminación Exitosa</title>
    <meta http-equiv="refresh" content="2;url=index.jsp">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <!-- Estilos personalizados -->
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Poppins', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
        }
        .mensaje {
            font-family: 'Playfair Display', serif;
            font-size: 24px;
            font-weight: 600;
            color: #28a745;
        }
        .spinner-border {
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mensaje">¡Eliminado exitosamente!</h2>
        <p>Serás redirigido en unos segundos...</p>
        <div class="spinner-border text-success" role="status">
            <span class="visually-hidden">Cargando...</span>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
