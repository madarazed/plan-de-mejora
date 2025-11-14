<?php
require_once __DIR__ . '/../models/Database.php';
if(session_status()===PHP_SESSION_NONE) session_start();
$db = Database::getInstance();
$action = $_GET['action'] ?? null;
header('Content-Type: application/json; charset=utf-8');

if ($action==='login') {
    $usuario = $_POST['usuario'] ?? '';
    $pass = $_POST['password'] ?? '';
    $stmt = $db->getPdo()->prepare("SELECT * FROM admin WHERE usuario=:u LIMIT 1");
    $stmt->execute([':u'=>$usuario]);
    $a = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($a && password_verify($pass, $a['password_hash'])) {
        $_SESSION['admin_authenticated'] = true;
        echo json_encode(['ok'=>true,'message'=>'Admin autenticado']); exit;
    } else {
        echo json_encode(['ok'=>false,'message'=>'Credenciales inválidas']); exit;
    }
}

if ($action==='save_question') {
    if (!isset($_SESSION['admin_authenticated']) || !$_SESSION['admin_authenticated']) {
        echo json_encode(['ok'=>false,'message'=>'No autorizado']); exit;
    }
    $p = $_POST['pregunta'] ?? '';
    $a = $_POST['opcion_a'] ?? '';
    $b = $_POST['opcion_b'] ?? '';
    $c = $_POST['opcion_c'] ?? '';
    $d = $_POST['opcion_d'] ?? '';
    $rc = $_POST['respuesta_correcta'] ?? '';
    $et = $_POST['etapa'] ?? '';
    $stmt = $db->getPdo()->prepare("INSERT INTO preguntas (pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, etapa) VALUES
        (:p,:a,:b,:c,:d,:rc,:et)");
    $stmt->execute([':p'=>$p,':a'=>$a,':b'=>$b,':c'=>$c,':d'=>$d,':rc'=>$rc,':et'=>$et]);
    echo json_encode(['ok'=>true,'message'=>'Pregunta guardada']); exit;
}

if ($action==='export_csv') {
    if (!isset($_SESSION['admin_authenticated']) || !$_SESSION['admin_authenticated']) {
        echo json_encode(['ok'=>false,'message'=>'No autorizado']); exit;
    }
    $stmt = $db->getPdo()->query("SELECT * FROM preguntas");
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $csv = "id,pregunta,etapa,respuesta_correcta\n";
    foreach($rows as $r) {
        $csv .= $r['id'] . ',"' . str_replace('"','""',$r['pregunta']) . '",' . $r['etapa'] . ',' . $r['respuesta_correcta'] . "\n";
    }
    header('Content-Type: text/csv');
    header('Content-Disposition: attachment; filename="preguntas.csv"');
    echo $csv;
    exit;
}

echo json_encode(['ok'=>false,'message'=>'Acción no definida']);
