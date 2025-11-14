let roundData = [];
let currentStage = 0;
let currentQuestion = 0;
let correctAnswersStage = 0;
let correctAnswersTotal = 0;
let topoInterval = null;
let stageKeys = [];

const startBtn = document.getElementById('start-round-btn');
const board = document.getElementById('board');
const questionContainer = document.getElementById('question-container');
const questionText = document.getElementById('question-text');
const options = document.querySelectorAll('.option-btn');
const result = document.getElementById('result');
const progress = document.getElementById('progress');
const summary = document.getElementById('round-summary');

window.onload = () => {
    // Reiniciar la partida si se recarga
    sessionStorage.removeItem('roundData');
};

startBtn.addEventListener('click', startRound);

function startRound() {
    fetch('../controllers/GameController.php?action=start_round')
    .then(resp => resp.json())
    .then(data => {
        if(data.ok){
            roundData = data.round;
            stageKeys = Object.keys(roundData);
            currentStage = 0;
            currentQuestion = 0;
            correctAnswersStage = 0;
            correctAnswersTotal = 0;
            startBtn.style.display='none';
            summary.style.display='none';
            board.style.display='grid';
            questionContainer.style.display='none';
            startTopoAnimation();
        } else alert("Error cargando preguntas");
    });
}

function startTopoAnimation() {
    const holes = document.querySelectorAll('.hole');
    holes.forEach(h => h.querySelector('.topo').style.display='none');

    if(topoInterval) clearInterval(topoInterval);

    topoInterval = setInterval(()=>{
        const idx = Math.floor(Math.random() * holes.length);
        holes.forEach((h,i)=>{
            const topo = h.querySelector('.topo');
            if(i === idx){
                topo.style.display = 'block';
                topo.style.cursor = 'pointer';
                topo.onclick = () => {
                    clearInterval(topoInterval);
                    holes.forEach(hh=>hh.querySelector('.topo').style.display='none');
                    showQuestion();
                };
            } else {
                topo.style.display = 'none';
                topo.onclick = null;
            }
        });
    }, 800);
}

function showQuestion() {
    questionContainer.style.display='block';
    const stage = stageKeys[currentStage];
    const q = roundData[stage][currentQuestion];

    questionText.innerText = `Etapa: ${q.etapa}\n${q.pregunta}`;
    options.forEach(btn=>{
        const opt = btn.dataset.option;
        btn.innerText = q['opcion_'+opt.toLowerCase()];
        btn.onclick = ()=> submitAnswer(q.id, opt, stage);
    });
    progress.innerText = `Pregunta ${currentQuestion+1} de 8`;
}

function submitAnswer(questionId, selected, stage){
    fetch('../controllers/GameController.php?action=submit_answer',{
        method:'POST',
        headers:{'Content-Type':'application/x-www-form-urlencoded'},
        body:`question_id=${questionId}&selected=${selected}&stage=${stage}`
    })
    .then(resp => resp.json())
    .then(data=>{
        if(data.ok){
            if(data.correct){
                result.innerText='✅ Correcto!';
                correctAnswersStage++;
                correctAnswersTotal++;
            } else {
                result.innerText=`❌ Incorrecto. La etapa se reinicia.`;
            }
            currentQuestion++;
            setTimeout(()=>{
                result.innerText='';
                questionContainer.style.display='none';
                if(data.correct){
                    if(currentQuestion<8){
                        startTopoAnimation();
                    } else finishStage(true); // Pasó etapa
                } else {
                    finishStage(false); // Reinicia etapa
                }
            }, 1000);
        } else alert(data.message);
    });
}

function finishStage(passed){
    const stageName = stageKeys[currentStage];
    if(passed){
        currentStage++;
        currentQuestion=0;
        correctAnswersStage=0;
    } else {
        // Reiniciar misma etapa
        currentQuestion=0;
        correctAnswersStage=0;
    }

    if(currentStage<stageKeys.length){
        startTopoAnimation();
    } else {
        if(topoInterval) clearInterval(topoInterval);
        board.style.display='none';
        questionContainer.style.display='none';
        summary.style.display='block';
        summary.innerText = `Ronda completada. Respuestas correctas: ${correctAnswersTotal} de ${stageKeys.length*8}`;
        startBtn.style.display='block';
    }
}
