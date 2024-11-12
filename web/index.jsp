<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>DFCM - Login</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(120deg, #2980b9, #8e44ad);
                height: 100vh;
                overflow: hidden;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .login-container {
                background: white;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 15px 25px rgba(0,0,0,0.2);
                width: 400px;
            }

            .login-header {
                text-align: center;
                margin-bottom: 30px;
            }

            .login-header h1 {
                color: #2c3e50;
                font-size: 2em;
                margin-bottom: 10px;
            }

            .login-header p {
                color: #666;
                font-size: 16px;
            }

            .input-group {
                position: relative;
                margin-bottom: 30px;
            }

            .input-group input {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border: none;
                border-bottom: 2px solid #ddd;
                background: transparent;
                outline: none;
                transition: 0.3s;
            }

            .input-group label {
                position: absolute;
                top: 0;
                left: 0;
                padding: 10px;
                font-size: 16px;
                color: #666;
                pointer-events: none;
                transition: 0.3s;
            }

            .input-group input:focus ~ label,
            .input-group input:valid ~ label {
                top: -20px;
                left: 0;
                color: #2980b9;
                font-size: 12px;
            }

            .input-group input:focus {
                border-bottom: 2px solid #2980b9;
            }

            .btn-login {
                width: 100%;
                padding: 12px;
                background: #2980b9;
                color: white;
                border: none;
                border-radius: 25px;
                cursor: pointer;
                font-size: 16px;
                transition: 0.3s;
            }

            .btn-login:hover {
                background: #3498db;
            }

            .error-message {
                color: #e74c3c;
                text-align: center;
                margin-bottom: 15px;
                font-size: 14px;
                display: none;
            }

            @keyframes shake {
                0%, 100% {
                    transform: translateX(0);
                }
                25% {
                    transform: translateX(-10px);
                }
                75% {
                    transform: translateX(10px);
                }
            }

            .shake {
                animation: shake 0.3s;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <div class="login-header">
                <h1>DFCM</h1>
                <p>Sistema de Objetos Perdidos</p>
            </div>

            <form action="Validar" method="POST">
                <div class="input-group">
                    <input type="text" name="username" >
                    <label for="username">Usuario</label>
                </div>

                <div class="input-group">
                    <input type="password" name="password">
                    <label for="password">Contraseña</label>
                </div>
                <button type="submit" name="accion" value="Ingresar"  class="btn-login">Iniciar Sesión</button>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    </body>
</html>
