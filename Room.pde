class Room {
  /**
   Uninteractable environment of an individual room/map. These don't need to
   be maintained, and already basically constants. Serve only purpose 
   to draw properly and maintain where we are.
   */
  String fileName;
  int roomId;
  int ROOM_WIDTH;
  int ROOM_HEIGHT;
  //connected rooms, always 8 possible spaces
  /*    0   1
   7 |------|2
   |      |
   6 |------|3
   5    4
   */
  String[] connectedRooms = new String[8];
  int[][] layout;

  public Room(String roomName) {
    fileName = roomName;
    loadLayout();
  }

  public Room(String roomName, String room0, String room1, String room2, String room3, String room4, String room5, String room6, String room7) {
    fileName = roomName;
    connectedRooms[0] = room0;
    connectedRooms[1] = room1;
    connectedRooms[2] = room2;
    connectedRooms[3] = room3;
    connectedRooms[4] = room4;
    connectedRooms[5] = room5;
    connectedRooms[6] = room6;
    connectedRooms[7] = room7;
    loadLayout();
  }

  public void loadLayout() {
    // load our room definition
    println(fileName);
    Table data = loadTable(fileName, "csv");
    this.ROOM_HEIGHT = data.getRowCount();
    this.ROOM_WIDTH = data.getColumnCount();
    layout = new int[ROOM_HEIGHT][ROOM_WIDTH];
    // parse data into our 2D array
    for (int i = 0; i < ROOM_HEIGHT; i++) {
      for (int j = 0; j < ROOM_WIDTH; j++) {
        println(String.format("%d , %d", i, j));
        layout[i][j] = data.getInt(i, j);
      }
    }
  }

  public void setConnectedRoom(String roomName, int roomNum) {
    if (roomNum >= 0 && roomNum < connectedRooms.length) {
      connectedRooms[roomNum] = roomName;
    }
  }
}