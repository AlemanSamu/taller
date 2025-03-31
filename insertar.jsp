<%@ include file="../../WEB-INF/lib/conexion.jspf" %> <!-- Incluir la conexión -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Profesor</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <!-- Estilos personalizados -->
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            max-width: 600px;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header h1 {
            font-family: 'Playfair Display', serif;
            font-weight: 600;
            color: #4CAF50;
        }
        .header h2 {
            font-size: 22px;
            color: #333;
        }
        .form-label {
            font-weight: 600;
        }
        .btn-success {
            background-color: #4CAF50;
            border: none;
            padding: 10px;
            font-size: 18px;
            transition: 0.3s;
        }
        .btn-success:hover {
            background-color: #45a049;
        }
        .regresar {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: #4CAF50;
            font-weight: 600;
            transition: 0.3s;
        }
        .regresar:hover {
            color: #388E3C;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Encabezado -->
        <div class="header">
            <h1>Sistema Universitario</h1>
            <h2>Agregar Profesor</h2>
        </div>

        <!-- Mostrar mensaje de error si existe -->
        <c:if test="${param.error == 'true'}">
            <div class="alert alert-danger" role="alert">
                Por favor, complete todos los campos obligatorios.
            </div>
        </c:if>

        <form action="index.jsp" method="post">
            <div class="mb-3">
                <label for="cedula" class="form-label">Cédula:</label>
                <input type="text" id="cedula" name="cedula" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" id="nombre" name="nombre" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="area" class="form-label">Área:</label>
                <input type="text" id="area" name="area" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="telefono" class="form-label">Teléfono:</label>
                <input type="text" id="telefono" name="telefono" class="form-control">
            </div>
            <div class="mb-3">
                <label for="id_categoria" class="form-label">Categoría:</label>
                <select id="id_categoria" name="id_categoria" class="form-select" required>
                    <sql:query dataSource="${profesores}" var="categorias">
                        SELECT id, descripcion FROM categoria;
                    </sql:query>
                    <c:forEach var="cat" items="${categorias.rows}">
                        <option value="${cat.id}">${cat.descripcion}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-success w-100">Guardar</button>
        </form>

        <!-- Botón de regreso al listado -->
        <div class="text-center">
            <a href="index.jsp" class="regresar">Regresar al Listado</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
