<?php
if (PHP_SAPI === 'cli') {
    $pass = $argv[1] ?? null;
    if (!$pass) { echo "Usage: php generate_admin_hash.php yourpassword\n"; exit; }
    echo password_hash($pass, PASSWORD_DEFAULT) . PHP_EOL;
} else {
    echo "Use from CLI: php generate_admin_hash.php yourpassword";
}
