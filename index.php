<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplasta Topos - Inicio</title>
    <style>
        /* Fuente y reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            background: radial-gradient(circle at top left, #ff7e5f, #feb47b, #6a11cb);
            overflow: hidden;
        }

        /* Fondo animado tipo partículas */
        body::before {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            background: repeating-radial-gradient(circle, rgba(255,255,255,0.05) 0 2px, transparent 2px 20px);
            animation: moveBackground 20s linear infinite;
            z-index: 0;
        }
        @keyframes moveBackground {
            0% { transform: translate(0,0); }
            100% { transform: translate(-50%, -50%); }
        }

        /* Contenedor central */
        .container {
            position: relative;
            z-index: 1;
            text-align: center;
            background: rgba(0, 0, 0, 0.6);
            padding: 60px 100px;
            border-radius: 25px;
            box-shadow: 0 0 50px rgba(0,0,0,0.5);
            backdrop-filter: blur(10px);
        }

        h1 {
            color: #fff;
            font-size: 4rem;
            margin-bottom: 50px;
            text-shadow: 0 0 20px #fff, 0 0 40px #ff7e5f, 0 0 60px #feb47b;
        }

        /* Botón neon */
        .play-btn {
            text-decoration: none;
            display: inline-block;
            padding: 20px 60px;
            font-size: 1.8rem;
            color: #fff;
            border: 2px solid #fff;
            border-radius: 50px;
            background: transparent;
            box-shadow: 0 0 10px #fff, 0 0 20px #ff7e5f, 0 0 40px #feb47b;
            transition: 0.3s;
            position: relative;
        }
        .play-btn:hover {
            color: #ff7e5f;
            box-shadow: 0 0 20px #fff, 0 0 40px #ff7e5f, 0 0 60px #feb47b, 0 0 80px #6a11cb;
            transform: scale(1.1);
        }

        /* Animación de pulso */
        .play-btn::before {
            content: '';
            position: absolute;
            top: -10%;
            left: -10%;
            width: 120%;
            height: 120%;
            background: rgba(255,255,255,0.1);
            border-radius: 50px;
            filter: blur(20px);
            opacity: 0;
            transition: 0.5s;
        }
        .play-btn:hover::before {
            opacity: 1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Aplasta Topos</h1>
        <a href="public/index.php" class="play-btn">Jugar</a>
    </div>
</body>
</html>
