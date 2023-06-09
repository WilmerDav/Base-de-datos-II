
<div align="center">
  <h1>⚙️ BASE DE DATOS II ⚙️</h1>
  <h3>Proyectos & Laboratorios</h3>
</div>

<p align="center">
  <img src="https://media.giphy.com/media/26tn33aiTi1jkl6H6/giphy.gif" width="480">
</p>

<div align="center">
  <h1>
    <span id="hito1">HITO 1</span> 🎯
  </h1>
</div>


**Apartados del Hito 1**

**<A href="https://github.com/WilmerDav/Base-de-datos-II/tree/main/hito1"> <br></br>➢Diagnostico </A>**

<div align="center">
  <h1>
    <span id="hito2">HITO 2</span> 🎯
  </h1>
</div>


**Apartados del Hito 2**

**<A href="https://github.com/WilmerDav/Base-de-datos-II/tree/main/hito2"> <br></br> ➢Laboratorios Hito 2 </A>**

**<A href="https://github.com/WilmerDav/Base-de-datos-II/tree/main/hito2_procesual"> <br></br> ➢Trabajo Rrocesual Hito 2 </A>**

**<A href="https://github.com/WilmerDav/Base-de-datos-II/blob/main/hito2_procesual/EvaluacionProcesual_Gupal_Aula.sql"> <br></br> ➢Examen en Aula Hito 2 </A>**

<div align="center">
  <h1>
    <span id="hito3">HITO 3</span> 🎯
  </h1>
</div>


**Apartados del Hito 3**


**<A href="https://github.com/WilmerDav/Base-de-datos-II/tree/main/HIto3/Laboratorios"> <br></br> ➢Laboratorios Hito 3 </A>**

**<A href="https://github.com/WilmerDav/Base-de-datos-II/tree/main/HIto3/Evalucion%20Procesual"> <br></br> ➢Trabajo Rrocesual Hito 3 </A>**

**<A href="https://github.com/WilmerDav/Base-de-datos-II/tree/main/HIto3/EvaluacionContinua"> <br></br> ➢Examen en Aula Hito 3 </A>**

<div align="center">
  <h1>
    <span id="hito4">HITO 4</span> 🎯
  </h1>
</div>


**Apartados del Hito 4**


**<A href="https://github.com/WilmerDav/Base-de-datos-II/tree/main/Hito4/Laboratorios"> <br></br> ➢Laboratorios Hito 4 </A>**

**<A href="https://github.com/WilmerDav/Base-de-datos-II/tree/main/Hito4/Defenza%20Hito%204"> <br></br> ➢Trabajo Rrocesual Hito 4 </A>**

**<A href="https://github.com/WilmerDav/Base-de-datos-II/tree/main/Hito4/Evaluacion%20en%20Aula"> <br></br> ➢Examen en Aula Hito 4 </A>**


<div align="center">
  <h1>
    <span id="hito5">HITO 5</span> 🎯
  </h1>
</div>


<p align="center">
  <img src="https://media.giphy.com/media/KzeZ3OXHoSDVZH9cmy/giphy.gif" width="480">
</p>




## GIT OWNER

**WILMER DAVID CORI APAZA**


<script>
  function changeColor() {
    let hito1 = document.getElementById("hito1");
    let hito2 = document.getElementById("hito2");
    let hito3 = document.getElementById("hito3");
    let hito4 = document.getElementById("hito4");
    let hito5 = document.getElementById("hito4");

    setInterval(function() {
      hito1.style.color = getRandomColor();
      hito2.style.color = getRandomColor();
      hito3.style.color = getRandomColor();
      hito4.style.color = getRandomColor();
      hito5.style.color = getRandomColor();
    }, 1000); // Cambia el color cada segundo (1000 ms)

    function getRandomColor() {
      let letters = "0123456789ABCDEF";
      let color = "#";
      for (let i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
      }
      return color;
    }
  }

  changeColor();
</script>


