public class GameWorld {
  /**
   The GameWorld is the representation of all non interactable items in the 
   game. This might be the environments/boundaries/game maps. 
   
   */
  Room currentRoom;
  ArrayList<Room> rooms;
  PImage[] tileImages;
  final int TILE_SIZE = 50;
  public GameWorld() {
    rooms = new ArrayList<Room>();
    tileImages = new PImage[49];
    loadTiles();
    loadWorld();
  }

  // load our tile images into memory
  void loadTiles() {
    for (int i = 0; i < tileImages.length; i++) {
      tileImages[i] = loadImage(i + ".png");
    }
  }

  //preprocess to load all of world?
  void loadWorld() {
    // load in our 'world.txt' file which contains the overall
    // layout of the world, including how "rooms" connect to one another
    Table worldData = loadTable("world.txt", "header, csv");  

    // inspect each row in the table
    for (TableRow row : worldData.rows () )
    {
      // pull out the info about each field
      String filename = row.getString("Room");
      String tl       = row.getString("TL");
      String tr    = row.getString("TR");
      String rt     = row.getString("RT");
      String rb     = row.getString("RB");
      String br       = row.getString("BR");
      String bl    = row.getString("BL");
      String lb     = row.getString("LB");
      String lt     = row.getString("LT");
      
      Room rm = new Room(filename,tl, tr,rt,rb,br,bl,lb,lt);
      rooms.add(rm);
    }
  }
  void setCurrentRoom() {
  }

  Room getCurrentRoom() {
    if (currentRoom == null) {
       currentRoom = rooms.get(0); 
    }
    return currentRoom;
  }
}