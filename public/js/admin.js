
// admin.js - small helper for admin interactions
async function saveQuestion(form) {
    const data = new FormData(form);
    const res = await fetch('/aplasta-topos_final/controllers/AdminController.php?action=save_question',{method:'POST', body:data});
    const j = await res.json();
    alert(j.message);
    if (j.ok) window.location.href='/aplasta-topos_final/public/admin_dashboard.php';
    return false;
}
