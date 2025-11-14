<?php
session_start();
session_destroy();
header('Location: /aplasta-topos_final/public/index.php');
exit;
