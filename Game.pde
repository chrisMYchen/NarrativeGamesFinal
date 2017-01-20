class Game{
 /** 
 The Game is an abstract container for all Game interactions
 to reside in. It maintains the current game state and also
 the GameWorld.
 */ 
  GameWorld world;
  //Player p;
  //tracking progress in some manner what's completed? last chapter?
  //don't allow going backwards in the story to make maintaining state easier.
  //GameState state;
  //Entity collection for all interactable items, use components approach?
  
  //need to maintain entities for each room uniquely? 
  //reset entities in a room? or maintain?
  //ArrayList<Entity> entities;
  
  Game() {
    world = new GameWorld();
  }
  //draw will always draw around player's position
  void drawEnvironment(){
    Room currentRoom = world.getCurrentRoom();
    for (int r = 0; r < currentRoom.layout.length; r ++) {
     for (int c = 0; c < currentRoom.layout[r].length; c++) {
      image(world.tileImages[currentRoom.layout[r][c]], c*world.TILE_SIZE, r*world.TILE_SIZE, world.TILE_SIZE, world.TILE_SIZE); 
     }
    }
  }
}