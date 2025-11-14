<?php
require_once __DIR__ . '/../models/Database.php';
if(session_status()===PHP_SESSION_NONE) session_start();

$db = Database::getInstance();

// SMTP con tus credenciales
$mail_username = "madarazeduchiha@gmail.com";
$mail_password = "xrty ofyn jjib ebxz";

$action = $_GET['action'] ?? null;

if ($action === 'request_pin') {
    $nombre = $_POST['nombre'] ?? '';
    $correo = $_POST['correo'] ?? '';
    $aut = isset($_POST['autorizacion']) ? 1 : 0;

    if (!$nombre || !$correo || !$aut) {
        echo json_encode(['ok'=>false,'message'=>'Datos incompletos.']); 
        exit;
    }

    // Generar PIN de 6 dígitos
    $pin = str_pad(strval(random_int(0,999999)),6,'0',STR_PAD_LEFT);

    // Fecha actual y expiración (+5 min)
    $now = new DateTime('now', new DateTimeZone('America/Bogota'));
    $exp = clone $now;
    $exp->modify('+5 minutes');

    // Insertar solicitud en DB
    $sql = "INSERT INTO solicitudes_acceso (nombre, correo, autorizacion, fecha_solicitud, pin, fecha_expiracion, usado, reintentos)
            VALUES (:nombre,:correo,:aut,:fecha,:pin,:exp,0,0)";
    $stmt = $db->getPdo()->prepare($sql);
    $stmt->execute([
        ':nombre'=>$nombre,
        ':correo'=>$correo,
        ':aut'=>$aut,
        ':fecha'=>$now->format('Y-m-d H:i:s'),
        ':pin'=>$pin,
        ':exp'=>$exp->format('Y-m-d H:i:s')
    ]);

    // Enviar PIN por correo
    try {
        require_once __DIR__ . '/../vendor/phpmailer/src/Exception.php';
        require_once __DIR__ . '/../vendor/phpmailer/src/PHPMailer.php';
        require_once __DIR__ . '/../vendor/phpmailer/src/SMTP.php';
        $mail = new PHPMailer\PHPMailer\PHPMailer(true);

        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = $mail_username;
        $mail->Password = $mail_password;
        $mail->SMTPSecure = 'tls';
        $mail->Port = 587;

        $mail->setFrom($mail_username, 'AplastaTopos');
        $mail->addAddress($correo, $nombre);

        $mail->Subject = 'Tu PIN de acceso (5 minutos)';
        $mail->Body = "Tu PIN es: $pin\nExpira en 5 minutos.";

        $mail->send();

        echo json_encode(['ok'=>true,'message'=>'PIN enviado al correo.']); 
        exit;
    } catch (Exception $e) {
        echo json_encode(['ok'=>true,'message'=>'PIN generado (no se envió correo: '.$mail->ErrorInfo.'). PIN: '.$pin]); 
        exit;
    }
}

if ($action === 'verify_pin') {
    $pin = $_POST['pin'] ?? '';
    if (!$pin) { 
        echo json_encode(['ok'=>false,'message'=>'PIN requerido']); 
        exit; 
    }

    $sql = "SELECT * FROM solicitudes_acceso WHERE pin=:pin AND usado=0 ORDER BY id DESC LIMIT 1";
    $stmt = $db->getPdo()->prepare($sql);
    $stmt->execute([':pin'=>$pin]);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$row) { 
        echo json_encode(['ok'=>false,'message'=>'PIN inválido']); 
        exit; 
    }

    // Comparar fechas con la misma zona horaria
    $now = new DateTime('now', new DateTimeZone('America/Bogota'));
    $exp = new DateTime($row['fecha_expiracion'], new DateTimeZone('America/Bogota'));

    if ($now > $exp) { 
        echo json_encode(['ok'=>false,'message'=>'PIN expirado']); 
        exit; 
    }

    // Marcar PIN como usado
    $stmt = $db->getPdo()->prepare("UPDATE solicitudes_acceso SET usado=1 WHERE id=:id");
    $stmt->execute([':id'=>$row['id']]);

    // Crear o recuperar jugador
    $stmt = $db->getPdo()->prepare("SELECT * FROM jugadores WHERE correo=:c LIMIT 1");
    $stmt->execute([':c'=>$row['correo']]);
    $j = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$j) {
        $stmt = $db->getPdo()->prepare("INSERT INTO jugadores (nombre, correo, fecha_registro) VALUES (:n,:c,:f)");
        $stmt->execute([
            ':n'=>$row['nombre'],
            ':c'=>$row['correo'], 
            ':f'=>$now->format('Y-m-d H:i:s')
        ]);
        $jid = $db->getPdo()->lastInsertId();
    } else {
        $jid = $j['id'];
    }

    // Guardar sesión
    $_SESSION['jugador_id'] = $jid;
    $_SESSION['jugador_nombre'] = $row['nombre'];
    $_SESSION['jugador_email'] = $row['correo'];
    $_SESSION['autenticado'] = true;

    echo json_encode(['ok'=>true,'message'=>'PIN verificado. Bienvenido.']); 
    exit;
}

echo json_encode(['ok'=>false,'message'=>'Acción no definida']);
