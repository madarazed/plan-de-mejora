
// access.js - handles request PIN and verification UI
async function requestPin(form) {
    const data = new FormData(form);
    const res = await fetch('/aplasta-topos_final/controllers/AccessController.php?action=request_pin', {method:'POST', body: data});
    const j = await res.json();
    alert(j.message);
    if (j.ok) {
        window.location.href = '/aplasta-topos_final/public/verify_pin.php';
    }
    return false;
}
async function verifyPin(form){
    const data = new FormData(form);
    const res = await fetch('/aplasta-topos_final/controllers/AccessController.php?action=verify_pin', {method:'POST', body: data});
    const j = await res.json();
    alert(j.message);
    if (j.ok) window.location.href='/aplasta-topos_final/public/game.php';
    return false;
}
