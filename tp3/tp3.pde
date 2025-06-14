//iara camilletti, comision 1.
//https://youtu.be/bNvWsYBcwQE

PImage figura;
int cant;

boolean coloresInvertidos = false;
float anguloRotacion = 0;

void setup(){
  size(800,400);
  background(0);
  figura = loadImage("figura.jpg");
  cant = 6;
}

void draw(){
  image(figura, 0, 0, 400, 400);
  grillaCoquette();
}

void mousePressed() {
  coloresInvertidos = !coloresInvertidos;
}

void keyPressed(){
  if (key == 'r' || key == 'R') {
    resetearEstadoOriginal();
  } else {
    rotarTriangulos();
  }
}

void rotarTriangulos() {
  anguloRotacion += radians(random(0, 360));
  cant = (int)random(3, 10);
}

void resetearEstadoOriginal() {
  coloresInvertidos = false;
  anguloRotacion = 0;
  cant=6;
}

void grillaCoquette(){
  stroke(255);
  strokeWeight(1);
  noFill();
  
  float ladoCuadrado = (float)(width / 2) / cant; 
  
  for (int col = 0; col < cant; col++){
    float x = width/2 + col * ladoCuadrado;
    float anchoCol = ladoCuadrado;
    if (col == cant - 1) {
      anchoCol = (width / 2) - (col * ladoCuadrado);
    }
    
    for(int ver = 0; ver < cant; ver++){
      float y = ver * ladoCuadrado; 
      float altoFila = ladoCuadrado;
      if (ver == cant - 1) { 
        altoFila = height - (ver * ladoCuadrado);
      }
      
      rect((int)x, (int)y, (int)anchoCol, (int)altoFila);
      trianguloCoquette((int)x, (int)y, (int)anchoCol, (int)altoFila, coloresInvertidos);
       pushMatrix();
      translate(x + anchoCol / 2, y + altoFila / 2);
      rotate(anguloRotacion);
      miniTrianguloCoquette((int)anchoCol, (int)altoFila, coloresInvertidos); 
      popMatrix();
    }
  }
}

void trianguloCoquette(int x, int y, int ladoW, int ladoH, boolean invertir){
  noStroke();
  
  if (invertir) {
    fill(255);
    triangle(x, y, x + ladoW, y, x, y + ladoH);   

    fill(0);
    triangle(x + ladoW, y, x + ladoW, y + ladoH, x, y + ladoH);
  } else {
    fill(0);
    triangle(x, y, x + ladoW, y, x, y + ladoH);   

    fill(255);
    triangle(x + ladoW, y, x + ladoW, y + ladoH, x, y + ladoH);
  }
}
  
void miniTrianguloCoquette(int anchoMini, int altoMini, boolean invertir) {
  noStroke();
  
  int miniLado = (int)(min(anchoMini, altoMini) / 3.0); 
  int miniAncho = miniLado;
  int miniAlto = miniLado;
  int xMini = -miniAncho / 2;
  int yMini = -miniAlto / 2;

  if (invertir) {
    fill(0);              
    triangle(xMini, yMini, xMini+ miniAncho, yMini, xMini, yMini+ miniAlto);              
    
    fill(255);
    triangle(xMini+ miniAncho, yMini, xMini+ miniAncho, yMini+ miniAlto, xMini, yMini+ miniAlto);              
  } else {
    fill(255);
    triangle(xMini, yMini, xMini+ miniAncho, yMini, xMini, yMini+ miniAlto);              
    
    fill(0);
    triangle(xMini+ miniAncho, yMini, xMini+ miniAncho, yMini+ miniAlto, xMini, yMini+ miniAlto);              
  }
}
