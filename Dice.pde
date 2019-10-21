int[] gridX = {18, 30, 42};
int[] gridY = gridX;

void setup()
{ 
  size(720, 910);
  noLoop();
  background(255, 255, 255);
}
void draw()
{
  int sum = 0;
  for (int y = 0; y < 700; y += 60){
    for (int x = 0; x < 700; x += 60){
      Die ola = new Die(x, y);
      ola.roll();
      ola.show();
      for(int r = 0; r < 1; r++){
       sum += ola.numero; 
      }
    }   
  }
  textSize(40);
  text("Total " + sum, 250, 850);
   
}
void mousePressed()
{
  redraw();
}
class Die //models one single dice cube
{
  //variable declarations here
  int myX, myY, numero;
  int [][] circle = {
    {0, 0, 0}, 
    {0, 0, 0}, 
    {0, 0, 0}
  };
  Die(int x, int y) //constructor
  {
    //variable initializations here
    myX = x;
    myY = y;
  }

  void roll()
  {
    numero = (int)(Math.random()* 6) + 1;
    if (numero == 1) {
      uno();
    } else if (numero == 2) {
      dos();
    } else if (numero == 3) {
      tres();
    } else if (numero == 4) {
      cuatro();
    } else if (numero == 5) {
      cinco();
    } else {
      seis();
    }
  }
  void show()
  {
    int a = (int)(Math.random()* 255) + 90;
    int b = (int)(Math.random()* 255) + 90;
    int c = (int)(Math.random()* 255) + 90;
    fill (a, b, c);
    rect(myX, myY, 60, 60); 
    for (int m = 0; m < 3; m++) {
      for (int n = 0; n < 3; n++) {
        if (circle[m][n] != 0) {
          int dotY = gridY[m];
          int dotX = gridX[n];
          int e = (int)(Math.random()* 255) + 90;
          int r = (int)(Math.random()* 255) + 90;
          int t = (int)(Math.random()* 255) + 90;
          fill(e, r, t);
          ellipse(dotX + myX, dotY + myY, 8, 8);
        }
      }
    }
  }
  void uno() {
    circle[1][1] = 1;
  }
  void dos() {
    circle[0][0] = 1;
    circle[2][2] = 1;
  }
  void tres() {
    uno();
    dos();
  }
  void cuatro() {
    circle[2][0] = 1;
    circle[0][2] = 1;
    dos();
  }
  void cinco() {
    cuatro();
    uno();
  }
  void seis() {
    cuatro();
    circle[0][1] = 1;
    circle[2][1] = 1;
  }
}
