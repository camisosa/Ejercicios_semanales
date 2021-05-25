PImage pared;
PFont font;
int gamestate = 1; //Estado del juego. 1 menu de inicio, 0 en juego
int score = 0, highScore = 0; // score= puntuacion highScore=puntuacion mas alta
int x = -200, y, vy = 0; // Posición 'y, 'x' y la velocidad horizontal 'vy'
// Paredes: wx contiene la distancia horizontal y wy la vertical
int wx[] = new int[2], wy[] = new int[2]; 
void setup() {
  size(600,700);
pared =loadImage("pared.png");
font= loadFont("DialogInput.bold-48.vlw");
}
void draw() {
   background(50);  
   textFont(font);
   textSize(35);
  if(gamestate == 0) {
    imageMode(CORNER);
    x -= 6;
    vy += 1;
    y += vy; // Esta será la aceleración de caída del cuadrado
    for(int i = 0 ; i < 2; i++) { // Este bucle renderiza las paredes
      imageMode(CENTER);
      image(pared, wx[i], wy[i] - (pared.height/2+100));
      image(pared, wx[i], wy[i] + (pared.height/2+100));
      if(wx[i] < 0) { 
        wy[i] = (int)random(200,height-200);
        wx[i] = width;
      }
      if(wx[i] == width/2){ // Si el jugador pasa los muros
        score++; // Sumamos un punto
        highScore = max(score, highScore); // Se comprueba si se ha batido record
      }
      if(y>height||y<0||(abs(width/2-wx[i])<25 && abs(y-wy[i])>100)){ 
      // Para abreviar: Si tocas el techo, el suelo, o una pared, mueres.
        gamestate=1; // Te envía al menu de inicio
      }
      wx[i] -= 6; // Desplazamos las paredes al ritmo del mapa!
    }
    
     rect( width/2, y,40,40);
    text(""+score, width/2-15, 100); // la puntuación
  } // Hasta aquí
  else { // Si no estamos en juego, se hará esto otro
  // Centramos las imágenes y mostramos la portada con la máxima puntuación
    imageMode(CENTER);
    fill(#050505);
    rect(100,80,400,100);
    fill(#FFFCFC);
    rect( 260,320,60,60);
    text("clik para empezar",120,140);
    textSize(30);
    text("Máxima puntuación: "+highScore, 50, width-50);
  }
}
void mousePressed() { // Se llama cuando hacemos click
  vy = -17; // Hacemos "saltar" a el cuadrado
  if(gamestate==1) { // Si el juego está en el menú
  // Inicializamos las paredes, y ponemos marcadores y modo de juego a 0
    wx[0] = 600;
    wy[0] = y = height/2;
    wx[1] = 900;
    wy[1] = 500;
    x = gamestate = score = 0;
  }
}
