class Room{
  /**
  Uninteractable environment of an individual room/map. These don't need to
  be maintained, and already basically constants. Serve only purpose 
  to draw properly and maintain where we are.
  */
  String fileName;
  int roomId;
  final int ROOM_WIDTH;
  final int ROOM_HEIGHT;
  //connected rooms, always 8 possible spaces
  /*    0   1
    7 |------|2
      |      |
    6 |------|3
       5    4
  */
  String[] connectedRooms = new String[8];
  int[][] layout;
  
  public Room(String roomName, int roomWidth, int roomHeight){
    this.ROOM_WIDTH = roomWidth;
    this.ROOM_HEIGHT = roomHeight;
    fileName = roomName;
    loadLayout();
  }
  
  public Room(String roomName, int roomWidth, int roomHeight, String room0, String room1, String room2, String room3, String room4, String room5, String room6, String room7){
    fileName = roomName;
    this.ROOM_WIDTH = roomWidth;
    this.ROOM_HEIGHT = roomHeight;
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
  
  public void loadLayout(){
    // load our room definition
    Table data = loadTable(fileName, "csv");
    
    // parse data into our 2D array
    for (int i = 0; i < ROOM_HEIGHT; i++) {
        for (int j = 0; j < ROOM_WIDTH; j++) {
           layout[i][j] = data.getInt(i,j); 
        }
    }
  }
  
  public void setConnectedRoom(String roomName, int roomNum) {
    if (roomNum >= 0 && roomNum < connectedRooms.length) {
      connectedRooms[roomNum] = roomName;
    }
  }
  
}