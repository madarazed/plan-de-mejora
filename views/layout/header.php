<?php
if(session_status()===PHP_SESSION_NONE) session_start();
?><!doctype html>
<html><head><meta charset="utf-8"><title>Aplasta Topos - Quiz SDLC</title>
<link rel="stylesheet" href="/aplasta-topos_final/public/css/styles.css">
</head><body><div class="container"><div class="header"><h1>AplastaTopos - Quiz SDLC</h1>
<div><?php if(isset($_SESSION['autenticado'])) echo 'Bienvenido '.htmlspecialchars($_SESSION['jugador_nombre']); ?></div></div><hr>
