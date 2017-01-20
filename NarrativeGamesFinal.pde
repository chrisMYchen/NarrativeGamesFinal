Game g;
void setup() {
   size(1280,720);
   Room test = new Room("room0.csv");
   g = new Game();
}
void draw(){
  g.drawEnvironment();
}