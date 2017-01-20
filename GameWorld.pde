public class GameWorld {
  /**
   The GameWorld is the representation of all non interactable items in the 
   game. This might be the environments/boundaries/game maps. 
   
   */
  Room currentRoom;
  PImage[] tileImages;
  final int TILE_WIDTH = 50;
  public GameWorld() {
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
      String up       = row.getString("Up");
      String right    = row.getString("Right");
      String down     = row.getString("Down");
      String left     = row.getString("Left");

      // construct a new room
      Room temp = new Room(filename, up, right, down, left);

      // add room to our ArrayList
      theRooms.add(temp);
    }

    void setCurrentRoom() {
    }

    Room getCurrentRoom() {
    }
  }