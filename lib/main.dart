
<!DOCTYPE html>
<html lang="ar">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SHADOW HACKER</title>
<style>
*{box-sizing:border-box}
body{
 margin:0;background:#020604;color:#00ff77;
 font-family:monospace;padding:12px;
 overflow-x:hidden;
}
header{
 text-align:center;padding:16px;
 border:1px solid #00ff77;border-radius:12px;
 box-shadow:0 0 20px #00ff7733;
}
h1{letter-spacing:5px;text-shadow:0 0 15px #00ff77}
.small{font-size:10px;color:#7affad}
.grid{
 display:grid;grid-template-columns:1fr 1fr;
 gap:10px;margin-top:12px;
}
.panel{
 background:#041008;border:1px solid #14532d;
 padding:10px;border-radius:10px;min-width:0;
 box-shadow:0 0 12px #00ff7710;
}
h3{font-size:12px;margin:0 0 10px}
.camera{
 height:115px;background:
 repeating-linear-gradient(0deg,transparent 0 7px,#00ff7715 8px),
 linear-gradient(135deg,#071d10,#010302);
 position:relative;overflow:hidden;
 border:1px solid #176333;
}
.camera:before{
 content:"";position:absolute;width:100%;height:3px;
 background:#00ff77;box-shadow:0 0 12px #00ff77;
 animation:scan 3s linear infinite;
}
.camera:after{
 content:"CAM 01 • SIMULATION";
 position:absolute;bottom:5px;left:5px;font-size:9px;
}
@keyframes scan{
 from{top:0}to{top:100%}
}
.globe{
 width:105px;height:105px;margin:auto;
 border:2px solid #00ff77;border-radius:50%;
 position:relative;overflow:hidden;
 background:repeating-linear-gradient(
  90deg,transparent 0 13px,#00ff7755 14px 15px
 );
 box-shadow:0 0 18px #00ff7755,inset 0 0 18px #00ff7733;
 animation:spin 5s linear infinite;
}
.globe:before{
 content:"";position:absolute;inset:0;
 border:2px solid #00ff77;border-radius:50%;
 transform:scaleX(.35);
}
.globe:after{
 content:"";position:absolute;left:-10%;right:-10%;
 top:35%;height:30%;border:1px solid #00ff77;
 border-radius:50%;
}
@keyframes spin{to{transform:rotateY(360deg)}}
.radar{
 width:105px;height:105px;margin:auto;border-radius:50%;
 border:1px solid #00ff77;position:relative;
 background:repeating-radial-gradient(
  circle,transparent 0 15px,#00ff7730 16px 17px
 );
 overflow:hidden;
}
.radar:before{
 content:"";position:absolute;inset:0;
 background:conic-gradient(from 0deg,transparent 70%,#00ff7766);
 animation:radar 2s linear infinite;
}
.radar:after{
 content:"";position:absolute;width:5px;height:5px;
 background:#00ff77;border-radius:50%;top:30%;left:65%;
 box-shadow:0 0 8px #00ff77;
}
@keyframes radar{to{transform:rotate(360deg)}}
.matrix{
 height:75px;overflow:hidden;overflow-wrap:anywhere;
 font-size:10px;color:#00ff77;opacity:.8;
}
.metrics{font-size:11px;line-height:2}
.bar{height:5px;background:#12351d}
.fill{height:100%;background:#00ff77;width:35%;transition:width .3s}
button{
 width:100%;padding:12px;margin-top:8px;
 background:#00ff77;color:#001b09;
 border:0;border-radius:5px;font-weight:bold;
 font-family:inherit;
}
#log{height:110px;overflow:auto;font-size:10px;line-height:1.8;color:#9affba}
footer{text-align:center;margin:18px 0;font-size:10px;color:#36794c}
</style>
</head>
<body>
<header>
 <div>◈ SHADOW SECURITY ◈</div>
 <h1>SHADOW</h1>
 <div>ADVANCED TERMINAL v2.0</div>
 <p class="small" id="status">● SYSTEM ONLINE</p>
</header>

<div class="grid">
 <section class="panel">
  <h3>▣ SURVEILLANCE CAM</h3>
  <div class="camera"></div>
  <p class="small">CAM: SIMULATED</p>
 </section>

 <section class="panel">
  <h3>🌐 GLOBAL NETWORK</h3>
  <div class="globe"></div>
  <p class="small" style="text-align:center">EARTH SIMULATION</p>
 </section>

 <section class="panel">
  <h3>◉ RADAR SCANNER</h3>
  <div class="radar"></div>
  <p class="small" style="text-align:center">LOCAL VISUAL SCAN</p>
 </section>

 <section class="panel">
  <h3>▤ DIGITAL MATRIX</h3>
  <div class="matrix" id="matrix"></div>
  <p class="small">ENCRYPTION: VISUAL</p>
 </section>
</div>

<section class="panel" style="margin-top:12px">
 <h3>▸ SYSTEM MONITOR</h3>
 <div class="metrics">
  CPU LOAD: <span id="cpu">35</span>%
  <div class="bar"><div class="fill" id="cpuBar"></div></div>
  MEMORY: <span id="mem">48</span>%
  <div class="bar"><div class="fill" id="memBar"></div></div>
  CONNECTION: <span style="color:#00ff77">ACTIVE</span>
 </div>
</section>

<section class="panel" style="margin-top:12px">
 <h3>▸ COMMAND TERMINAL</h3>
 <div id="log">SHADOW TERMINAL INITIALIZED<br>
 Ready for commands...<br>
 Visual simulation enabled.</div>
 <button onclick="scan()">START SYSTEM SCAN</button>
 <button onclick="codes()">GENERATE SECRET CODES</button>
 <button onclick="alarm()">TOGGLE ALERT</button>
 <button onclick="clearLog()">CLEAR TERMINAL</button>
</section>

<footer>SHADOW SYSTEMS © 2026 • VISUAL SIMULATION</footer>

<script>
const $=id=>document.getElementById(id);
const chars="010101010101ABCDEF0123456789";
let alertOn=false;

function addLog(s){
 $("log").innerHTML+="<br>&gt; "+s;
 $("log").scrollTop=$("log").scrollHeight;
}
function randomCode(n){
 let s="";
 for(let i=0;i<n;i++)
  s+=chars[Math.floor(Math.random()*chars.length)];
 return s;
}
function matrix(){
 $("matrix").textContent=randomCode(160);
}
setInterval(matrix,180);

setInterval(()=>{
 let cpu=15+Math.floor(Math.random()*70);
 let mem=25+Math.floor(Math.random()*65);
 $("cpu").textContent=cpu;
 $("mem").textContent=mem;
 $("cpuBar").style.width=cpu+"%";
 $("memBar").style.width=mem+"%";
},1300);

function scan(){
 let p=0;
 $("status").textContent="● SCAN SIMULATION RUNNING";
 addLog("Starting visual system scan...");
 const t=setInterval(()=>{
  p+=20;
  addLog("Simulation progress: "+p+"%");
  if(p>=100){
   clearInterval(t);
   addLog("Simulation complete. No real devices scanned.");
   $("status").textContent="● SYSTEM ONLINE";
  }
 },350);
}
function codes(){
 addLog("Generated code: "+randomCode(36));
}
function alarm(){
 alertOn=!alertOn;
 $("status").textContent=alertOn?
  "● ALERT MODE ACTIVE":"● SYSTEM ONLINE";
 document.body.style.boxShadow=alertOn?
  "inset 0 0 30px #ff003355":"none";
 addLog(alertOn?"Visual alert enabled.":"Visual alert disabled.");
}
function clearLog(){
 $("log").innerHTML="Terminal cleared.";
}
</script>
</body>
</html>
