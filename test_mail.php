<?php
require_once __DIR__ . '/vendor/phpmailer/src/Exception.php';
require_once __DIR__ . '/vendor/phpmailer/src/PHPMailer.php';
require_once __DIR__ . '/vendor/phpmailer/src/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$mail = new PHPMailer(true);

try {
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = "madarazeduchiha@gmail.com";
    $mail->Password = "xrty ofyn jjib ebxz";
    $mail->SMTPSecure = 'tls';
    $mail->Port = 587;

    $mail->setFrom("madarazeduchiha@gmail.com", "Test Mail");
    $mail->addAddress("madarazeduchiha@gmail.com", "Yo mismo");

    $mail->Subject = "Prueba de correo desde AplastaTopos";
    $mail->Body = "Este es un correo de prueba para verificar que PHPMailer funciona.";

    $mail->send();

    echo "✔ CORREO ENVIADO CORRECTAMENTE";
} catch (Exception $e) {
    echo "❌ ERROR AL ENVIAR: {$mail->ErrorInfo}";
}
