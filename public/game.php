<?php
session_start();
if(!isset($_SESSION['autenticado']) || !$_SESSION['autenticado']){
    header("Location: index.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Aplasta Topos - Ciclo de Vida del Software</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
<h1>Aplasta Topos - Ciclo de Vida del Software</h1>

<div id="game-container">
    <button id="start-round-btn">Iniciar Ronda</button>

    <div id="board" class="board">
        <?php for($i=0;$i<9;$i++): ?>
            <div class="hole">
                <img src="img/topo.png" class="topo" style="display:none;">
                <img src="img/hole.png" class="hole-img">
            </div>
        <?php endfor; ?>
    </div>

    <div id="question-container" class="question-container" style="display:none;">
        <p id="question-text"></p>
        <div id="options">
            <button class="option-btn" data-option="A"></button>
            <button class="option-btn" data-option="B"></button>
            <button class="option-btn" data-option="C"></button>
            <button class="option-btn" data-option="D"></button>
        </div>
        <p id="result" class="result"></p>
        <p id="progress"></p>
    </div>

    <div id="round-summary" class="round-summary" style="display:none;"></div>
</div>

<script src="js/game.js"></script>
</body>
</html>
