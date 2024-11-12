<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sistema de Objetos Perdidos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .menu {
            display: flex;
            justify-content: space-around;
            margin-bottom: 30px;
            background-color: #007bff;
            padding: 10px;
            border-radius: 5px;
        }
        .menu a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
        }
        .menu a:hover {
            background-color: #0056b3;
            border-radius: 5px;
        }
        .section {
            margin-bottom: 30px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        .stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }
        .stat-card {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            text-align: center;
        }
        #imagePreview {
            max-width: 300px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Sistema de Objetos Perdidos</h1>
        </div>

        <div class="menu">
            <a href="#registro">Registrar Objeto</a>
            <a href="#busqueda">Buscar Objeto</a>
            <a href="#estadisticas">Estadísticas</a>
            <a href="#reportes">Reportes</a>
        </div>

        <!-- Sección de Registro -->
        <div id="registro" class="section">
            <h2>Registrar Objeto Encontrado</h2>
            <form action="registrarObjeto" method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Descripción del Objeto:</label>
                    <textarea name="descripcion" required></textarea>
                </div>
                <div class="form-group">
                    <label>Fecha de Encuentro:</label>
                    <input type="date" name="fechaEncuentro" required>
                </div>
                <div class="form-group">
                    <label>Lugar de Encuentro:</label>
                    <input type="text" name="lugarEncuentro" required>
                </div>
                <div class="form-group">
                    <label>Encontrado por:</label>
                    <input type="text" name="encontradoPor" required>
                </div>
                <div class="form-group">
                    <label>Foto del Objeto:</label>
                    <input type="file" name="foto" accept="image/*" onchange="previewImage(this)">
                    <img id="imagePreview">
                </div>
                <button type="submit">Registrar Objeto</button>
            </form>
        </div>

        <!-- Sección de Estadísticas -->
        <div id="estadisticas" class="section">
            <h2>Estadísticas</h2>
            <div class="stats">
                <div class="stat-card">
                    <h3>Esta Semana</h3>
                    <p>Objetos Encontrados: <span id="objetosSemana">0</span></p>
                    <p>Objetos Entregados: <span id="entregadosSemana">0</span></p>
                </div>
                <div class="stat-card">
                    <h3>Este Mes</h3>
                    <p>Objetos Encontrados: <span id="objetosMes">0</span></p>
                    <p>Objetos Entregados: <span id="entregadosMes">0</span></p>
                </div>
                <div class="stat-card">
                    <h3>Este Año</h3>
                    <p>Objetos Encontrados: <span id="objetosAno">0</span></p>
                    <p>Objetos Entregados: <span id="entregadosAno">0</span></p>
                </div>
            </div>
        </div>

        <!-- Sección de Reclamación -->
        <div id="reclamacion" class="section">
            <h2>Registrar Reclamación</h2>
            <form action="registrarReclamacion" method="POST">
                <div class="form-group">
                    <label>ID del Objeto:</label>
                    <input type="text" name="idObjeto" required>
                </div>
                <div class="form-group">
                    <label>Nombre del Reclamante:</label>
                    <input type="text" name="nombreReclamante" required>
                </div>
                <div class="form-group">
                    <label>Documento de Identidad:</label>
                    <input type="text" name="documentoIdentidad" required>
                </div>
                <div class="form-group">
                    <label>Firma Digital:</label>
                    <canvas id="firma" width="400" height="200" style="border:1px solid #000;"></canvas>
                    <input type="hidden" name="firmaData" id="firmaData">
                </div>
                <button type="submit">Registrar Reclamación</button>
            </form>
        </div>
    </div>

    <script>
        // Previsualización de imagen
        function previewImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('imagePreview').src = e.target.result;
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        // Inicialización del canvas para firma
        var canvas = document.getElementById('firma');
        var ctx = canvas.getContext('2d');
        var drawing = false;

        canvas.addEventListener('mousedown', startDrawing);
        canvas.addEventListener('mousemove', draw);
        canvas.addEventListener('mouseup', stopDrawing);

        function startDrawing(e) {
            drawing = true;
            draw(e);
        }

        function draw(e) {
            if (!drawing) return;
            var rect = canvas.getBoundingClientRect();
            var x = e.clientX - rect.left;
            var y = e.clientY - rect.top;
            
            ctx.lineWidth = 2;
            ctx.lineCap = 'round';
            ctx.lineTo(x, y);
            ctx.stroke();
            ctx.beginPath();
            ctx.moveTo(x, y);
        }

        function stopDrawing() {
            drawing = false;
            ctx.beginPath();
            document.getElementById('firmaData').value = canvas.toDataURL();
        }
    </script>
</body>
</html>