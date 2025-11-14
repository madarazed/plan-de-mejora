<?php
session_start();
require_once __DIR__ . '/../models/Database.php';

if(!isset($_SESSION['autenticado']) || !$_SESSION['autenticado']){
    echo json_encode(['ok'=>false,'message'=>'No autenticado']);
    exit;
}

$db = Database::getInstance()->getPdo();

// Acción según parámetro
$action = $_GET['action'] ?? '';

if($action === 'start_round'){
    $stages = ['REQUERIMIENTOS','ANÁLISIS','DISEÑO','DESARROLLO','PRUEBAS','IMPLEMENTACIÓN','MANTENIMIENTO'];
    $round = [];

    foreach($stages as $stage){
        $stmt = $db->prepare("SELECT * FROM preguntas WHERE etapa=:etapa ORDER BY RAND() LIMIT 8");
        $stmt->execute([':etapa'=>$stage]);
        $round[$stage] = $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    echo json_encode(['ok'=>true,'round'=>$round]);
    exit;
}

if($action === 'submit_answer'){
    $stage = $_POST['stage'] ?? '';
    $questionId = $_POST['question_id'] ?? '';
    $selected = $_POST['selected'] ?? '';

    if(!$stage || !$questionId || !$selected){
        echo json_encode(['ok'=>false,'message'=>'Datos incompletos']);
        exit;
    }

    // Obtener la pregunta
    $stmt = $db->prepare("SELECT respuesta_correcta FROM preguntas WHERE id=:id LIMIT 1");
    $stmt->execute([':id'=>$questionId]);
    $preg = $stmt->fetch(PDO::FETCH_ASSOC);
    if(!$preg){
        echo json_encode(['ok'=>false,'message'=>'Pregunta no encontrada']);
        exit;
    }

    $correct = $preg['respuesta_correcta'] === $selected;
    echo json_encode(['ok'=>true,'correct'=>$correct]);
    exit;
}

echo json_encode(['ok'=>false,'message'=>'Acción no válida']);
