<%@ include file="../../WEB-INF/lib/conexion.jspf" %> <!-- Incluir la conexión -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Profesor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body { background-color: #f4f4f4; font-family: 'Poppins', sans-serif; }
        .container { max-width: 600px; background: #fff; padding: 30px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); margin-top: 50px; }
        .header { text-align: center; margin-bottom: 20px; }
        .header h1 { font-family: 'Playfair Display', serif; font-weight: 600; color: #4CAF50; }
        .btn-primary { background-color: #4CAF50; border: none; padding: 10px; font-size: 18px; width: 100%; }
        .btn-primary:hover { background-color: #45a049; }
        .regresar { display: block; margin-top: 15px; text-align: center; text-decoration: none; color: #4CAF50; font-weight: 600; }
        .regresar:hover { color: #388E3C; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Sistema Universitario</h1>
            <h2>Editar Profesor</h2>
        </div>

        <%-- ACTUALIZAR DATOS Y REDIRECCIONAR --%>
        <c:if test="${not empty param.actualizar and not empty param.id}">
            <sql:update dataSource="${profesores}">
                UPDATE profesor
                SET cedula = ?, 
                    nombre = ?, 
                    area = ?, 
                    telefono = ?, 
                    id_categoria = ?
                WHERE id = ?;
                <sql:param value="${param.cedula}" />
                <sql:param value="${param.nombre}" />
                <sql:param value="${param.area}" />
                <sql:param value="${param.telefono}" />
                <sql:param value="${param.id_categoria}" />
                <sql:param value="${param.id}" />
            </sql:update>

            <%-- Redirigir a index.jsp después de actualizar --%>
            
    <%-- Redirigir con mensaje de éxito --%>
    <c:redirect url="index.jsp?mensaje=actualizado"/>
        </c:if>

        <%-- OBTENER DATOS DEL PROFESOR --%>
        <sql:query dataSource="${profesores}" var="profesor">
            SELECT * FROM profesor WHERE id = ?;
            <sql:param value="${param.id}" />
        </sql:query>

        <c:if test="${empty profesor.rows}">
            <div class="alert alert-danger">Profesor no encontrado.</div>
        </c:if>

        <c:forEach var="row" items="${profesor.rows}">
            <form action="" method="post">
                <input type="hidden" name="id" value="${row.id}">

                <div class="mb-3">
                    <label class="form-label">Cédula:</label>
                    <input type="text" name="cedula" value="${row.cedula}" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Nombre:</label>
                    <input type="text" name="nombre" value="${row.nombre}" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Área:</label>
                    <input type="text" name="area" value="${row.area}" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Teléfono:</label>
                    <input type="text" name="telefono" value="${row.telefono}" class="form-control">
                </div>

                <div class="mb-3">
                    <label class="form-label">Categoría:</label>
                    <select name="id_categoria" class="form-select" required>
                        <sql:query dataSource="${profesores}" var="categorias">
                            SELECT id, descripcion FROM categoria;
                        </sql:query>
                        <c:forEach var="cat" items="${categorias.rows}">
                            <option value="${cat.id}" <c:if test="${cat.id == row.id_categoria}">selected</c:if>>
                                ${cat.descripcion}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <button type="submit" name="actualizar" value="true" class="btn btn-primary">Actualizar</button>
            </form>
        </c:forEach>

        <a href="index.jsp" class="regresar">Regresar al Listado</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
