PImage imOriginal;
PImage imEdit;
PFont tipografiaTitulo;
PFont tipografiaTexto;
int mitadPantalla;
int transTexto=0;

void setup(){
  size(1500,750);
  frameRate(3);
  imOriginal= loadImage ("portada_original.jpg"); 
  imEdit= loadImage ("portada_editada.jpg");
  tipografiaTitulo= loadFont("BookAntiqua-Italic-48.vlw");
  tipografiaTexto= loadFont("ArialNarrow-Italic-48.vlw");
  mitadPantalla= width/2;
  image(imOriginal,0,0,mitadPantalla,height);
  image(imEdit,mitadPantalla,0,mitadPantalla,height);
}
void draw(){

if(mouseX > mitadPantalla){
 fill(#000000,transTexto+100);
textFont(tipografiaTexto,30);
text("         Más\nde 70 puertas\n  y ventanas\ny muchas más\n  sorpresas ",mitadPantalla+85,510);
  }



}
void mouseClicked(){

fill(#000000);
textFont(tipografiaTitulo,50);
text("LA ",mitadPantalla+450,50);
textFont(tipografiaTitulo,80);
text("CASA ",mitadPantalla+460,110);
textFont(tipografiaTitulo,40);
text("de ",mitadPantalla+670,120);
textFont(tipografiaTitulo,80);
text("Tomasa ",mitadPantalla+400,175);
}
