//iara camilletti.
//comisión 1.

int mivariable;
int mivariable2;
int mivariable3;
int mivariable4;
int mivariable5;
int mivariable6 = 700;
int pantalla;
int mitiempo;

PImage miImagen1;
PImage miImagen2;
PImage miImagen3;
PImage miImagen4;
PImage miImagen5;
PImage miImagen6;
PFont miTexto;
PFont miTexto2;

float posX, posY;

int contador;
String texto1, texto2, texto3, texto4, texto5, textoBoton = "reiniciar!!";

PFont moonlightmystique;

int estado;

int px, py, ancho, alto;
boolean arranca = false;
boolean reinicio;
int segundos = 0;

int reiniciarAncho = 100;
int reiniciarAlto = 30;

void setup() {
  size(640, 480);

  background(255);

  mivariable = 0;
  mivariable2 = 0;
  mivariable3 = 0;
  mivariable4 = 0;
  pantalla = 0;

  mitiempo = 0;

  miImagen1 = loadImage("moonlightmystique1.jpeg");
  miImagen2 = loadImage("moonlightmystique2.jpeg");
  miImagen3 = loadImage("moonlightmystique3.jpeg");
  miImagen4 = loadImage("moonlightmystique4.jpeg");
  miImagen5 = loadImage("moonlightmystique5.jpeg");
  miImagen6 = loadImage("moonlightmystique6.jpeg");
  miTexto = loadFont("font1.vlw");
  miTexto2 = loadFont("font2.vlw");

  ancho = 200;
  alto = 50;
  px = 20 ;
  py = 420;

  texto1 = "De enemigos a amantes ¿podrán superar todo juntos?";
  texto2 = "Un accidente no tan accidental.";
  texto3 = "¿Acaso Bai Shuo es una humana especial?";
  texto4 = "De manipulación mutua al romance.";
  texto5 = "¿Lo lograrán?";

  moonlightmystique = loadFont("font2.vlw");
  textFont(moonlightmystique);
  textAlign(LEFT);

  estado = 0;
  contador = 0;
  posX = 10;
  posY = 300;
}

void draw() {

  if (!arranca) {
    fill(255);
    rect(px, py, ancho, alto);
    fill(0);
    image(miImagen6, 0, 0, 640, 480);
    textSize(28);
    text("Empezar!!", px + 20, py + 35);
  } else {
    mitiempo = mitiempo + 4;

    if (mitiempo > 0 && mitiempo < 400) {
      pantalla = 0;
    } else if (mitiempo > 400 && mitiempo < 800) {
      pantalla = 1;
    } else if (mitiempo > 800 && mitiempo < 1100) {
      pantalla = 2;
    } else if (mitiempo > 1100 && mitiempo < 1700) {
      pantalla = 3;
    } else if (mitiempo > 1700 && mitiempo < 2300) {
      pantalla = 4;
    } else if (mitiempo > 2300 && mitiempo < 3200) {
      pantalla = 5;
    }

    mivariable = mivariable + 1;

    stroke(0);
    strokeWeight(1);
    fill(255);

    if (pantalla == 0) {
      background(0);
      image(miImagen1, 0, 0, 640, 480);
      textFont(miTexto2);
      textSize(20);
      text("Moonlight mystique\n Es un drama chino de 40 episodios, de género histórico y fantasía,\n con protagonistas a Bai Shuo y Fan Yue.", 100, mivariable, 400, 100);
      fill(255, 150);
      rect(posX - 10, 335, 570, 40); 
      int c1 = color(21, 35, 111, 255);
      int c2 = color(203, 209, 237, 255);
      int interColor = lerpColor(c1, c2, map(posX, 20, width, 0, 1));
      fill(interColor);
      text(texto1, posX, 355, 600, 200);
      posX += 1;
      if (posX >= width) {
        estado = 7;
        contador = 7;
        posX = 20;
        posY = 250;
      }
    } else if (pantalla == 1) {
      background(255, 0, 0);
      image(miImagen2, 0, 0, 640, 480);
      fill(255, 100);
      rect(0, mivariable, 550, 80);
      textFont(miTexto2);
      textSize(20);
      fill(125, 66, 126);
      text("Bai Shuo es una humana que sueña con volverse inmortal,\n Fan yue es el rey de demonios del palacio Haoyue,\n ambos se conocerán por accidente.", 20, mivariable, 600, 400);
      fill(255, 150);
      rect(posX - 10, 335, 570, 40);
      int c1 = color(94, 39, 129, 255);
      int c2 = color(146, 38, 152, 255);
      int interColor = lerpColor(c1, c2, map(posX, 20, width, 0, 1));
      fill(interColor);
      textFont(moonlightmystique);
      textSize(20);
      text(texto2, posX, 355, 600, 200);
      posX += 1;
      if (posX >= width) {
        estado = 7;
        contador = 7;
        posX = 20;
        posY = 250;
      }
    } else if (pantalla == 2) {
      background(0, 255, 0);
      image(miImagen3, 0, 0, 640, 480);
      textFont(miTexto2);
      textSize(25);
      text("Fan yue tiene la piedra Wunian un objeto antiguo de una diosa fallecida,\n el cual robo a un clan de inmortales,\n inesperadamente Bai Shuo logra activar la piedra siendo humana.", 20, 50, 600, 400);
      int c1 = color(255, 255, 255, 255);
      int c2 = color(255, 0, 0, 0);
      int interColor = lerpColor(c1, c2, map(posX, 20, width, 0, 1));
      fill(interColor);
      textFont(moonlightmystique);
      textSize(20);
      text(texto3, posX, 355, 600, 200);
      posX += 1;
      if (posX >= width) {
        estado = 7;
        contador = 7;
        posX = 20;
        posY = 250;
      }
    } else if (pantalla == 3) {
      background(0, 255, 0);
      image(miImagen4, 0, 0, 640, 480);
      fill(255, 150);
      rect(10, 30, 570, 150);
      textFont(miTexto2);
      textSize(25);
      fill(214, 45, 85);
      mivariable3 = mivariable3 - 1;
      text("La piedra entra al cuerpo de Bai Shuo,\n Fan Yue decidirá engañarla haciéndose pasar como inmortal,\n para tenerla cerca de él.", 20, 50, 600, 400);
      fill(255, 150);
      rect(posX - 10, 335, 570, 40);
      int c1 = color(113, 10, 10, 255);
      int c2 = color(113, 10, 10, 150);
      int interColor = lerpColor(c1, c2, map(posX, 20, width, 0, 1));
      fill(interColor);
      textFont(moonlightmystique);
      textSize(20);
      text(texto4, posX, 355, 600, 200);
      posX += 1;
      if (posX >= width) {
        estado = 7;
        contador = 7;
        posX = 20;
        posY = 250;
      }
    } else if (pantalla == 4) {

      textFont(miTexto2);
      textSize(25);
      fill(255, 0, 0);
      mivariable4 = mivariable5 - 1;
      image(miImagen5, 0, 0, 640, 480);
      fill(214, 91, 67);
      text("Bai Shuo termina aceptando trabajar junto a él y viajar por el continente,\n para reunir los 5 pensamientos: matanza, codicia, odio, bondad y amor,\n que se necesitan para activar el poder de la piedra.", 20, 80, 300, 500);
      int c1 = color(255, 204, 193, 255);
      int c2 = color(255, 255, 255, 150);
      int interColor = lerpColor(c1, c2, map(posX, 20, width, 0, 1));
      fill(interColor);
      textFont(moonlightmystique);
      textSize(20);
      text(texto5, posX, 355, 600, 200);
      posX += 1;
      if (posX >= width) {
        estado = 7;
        contador = 7;
        posX = 20;
        posY = 250;
      }
    } else if (pantalla == 5) {
      background(0, 255, 0);
      textFont(miTexto);
      textSize(30);
      image(miImagen6, 0, 0, 640, 480);
      fill(255);
      mivariable6 = mivariable5 - 1;
      text("gracias por leer!!", width / 2, height / 2);
      textFont(miTexto2);
      text("by iara camilletti!!", 111, 190);


      fill(255);
      rect(px, py, reiniciarAncho, reiniciarAlto);
      fill(0);
      textSize(20);
      textAlign(CENTER, CENTER);
      text("Reiniciar", px + reiniciarAncho / 2, py + reiniciarAlto / 2);
      textAlign(LEFT);
    noStroke();
  }
}

}

void mousePressed() {
  if (!arranca && mouseX > px && mouseX < px + ancho && mouseY > py && mouseY < py + alto) {
    arranca = true;
    mitiempo = 1;
    segundos = 0;
  } else if (pantalla == 5 && mouseX > px && mouseX < px + reiniciarAncho + px && mouseY > py && mouseY < py + reiniciarAlto) {
    mitiempo = 0;
    mivariable = 0;
    mivariable2 = 0;
    mivariable3 = 0;
    mivariable4 = 0;
    mivariable5 = 700;
    arranca = false;
    posX = 10;
  }

  if (mouseX > px && mouseX < px + ancho && mouseY > py && mouseY < py + alto) {
    segundos = 0;
    reinicio = true;
  }

  println(mouseX, "+", mouseY);
  println(frameCount);

}
