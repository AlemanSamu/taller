<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="../../WEB-INF/lib/conexion.jspf" %> <!-- Incluir la conexión -->

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Profesores</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Estilos personalizados -->
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Poppins:wght@400;600&display=swap" rel="stylesheet">

</head>
<body>


    <!-- Contenido Principal -->
    <main class="container mt-4">


        <!-- Mensaje de Éxito o Error -->
        <c:if test="${not empty param.cedula and not empty param.nombre and not empty param.area and not empty param.id_categoria}">
            <sql:update dataSource="${profesores}" var="resultado">
                INSERT INTO profesor (cedula, nombre, area, telefono, id_categoria)
                VALUES (?, ?, ?, ?, ?);
                <sql:param value="${param.cedula}" />
                <sql:param value="${param.nombre}" />
                <sql:param value="${param.area}" />
                <sql:param value="${param.telefono}" />
                <sql:param value="${param.id_categoria}" />
            </sql:update>

            <c:choose>
                <c:when test="${resultado >= 1}">
                    <div class="alert alert-success" role="alert">
                        El profesor ha sido registrado exitosamente.
                    </div>
                    <script>
                        setTimeout(function() {
                            window.location.href = 'index.jsp';
                        }, 2000);
                    </script>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-danger" role="alert">
                        Ocurrió un error al registrar el profesor. Por favor, intenta nuevamente.
                    </div>
                </c:otherwise>
            </c:choose>
        </c:if>

        <!-- Tabla de Profesores -->
        <sql:query var="result" dataSource="${profesores}">
            SELECT p.id, p.cedula, p.nombre, p.area, p.telefono, COALESCE(c.descripcion, 'Sin Categoría') AS categoria 
            FROM profesor p 
            LEFT JOIN categoria c ON p.id_categoria = c.id;
        </sql:query>

       <div class="table-responsive">
       <!-- Título de la tabla -->
    <!-- Título de la tabla -->
<h3 class="text-center mt-4 mb-3" style="font-family: 'Playfair Display', serif; font-weight: 600; color: #6da830;">
    📋 Listado de Profesores
</h3>


    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Cédula</th>
                <th>Nombre</th>
                <th>Área</th>
                <th>Teléfono</th>
                <th>Categoría</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td>${row.id}</td>
                    <td>${row.cedula}</td>
                    <td>${row.nombre}</td>
                    <td>${row.area}</td>
                    <td>${row.telefono}</td>
                    <td>${row.categoria}</td>
                    <td>
                        <a href="modificar.jsp?id=${row.id}" class="btn btn-sm btn-primary">Editar</a>
                        <a href="eliminar.jsp?id=${row.id}" class="btn btn-sm btn-danger">Eliminar</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<c:if test="${param.mensaje == 'actualizado'}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        Profesor actualizado correctamente.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>


        <!-- Botón para Agregar Nuevo Profesor -->
        <div class="d-flex justify-content-center mt-4">
            <a href="insertar.jsp" class="btn btn-success btn-lg">Agregar Nuevo Profesor</a>
        </div>

    <div class="alert alert-info text-center mt-4" role="alert">
    📢 <strong>Consulta la documentacion.</strong><br>
    <a href="https://drive.google.com/file/d/1wZ3CKTR4LlNYO4HzE_njEX0vZ00YwKZz/view?usp=drive_link" 
       class="btn btn-primary mt-2" target="_blank">
        Ver Archivo
    </a>
</div>



    </main>


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>