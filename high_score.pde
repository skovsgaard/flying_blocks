import java.util.Map;

class HighScore {
  // Store the scores in a HashMap
  HashMap<String, Integer> scoreTable = new HashMap<String, Integer>();

  // Use a save method to avoid directly put'ing data into the HashMap.
  void save(String name, int score) {
    scoreTable.put(name, score);
  }

  // Method to return the entire scoreTable, again to avoid accessing it directly
  HashMap<String, Integer> getScoreTable() {
    return scoreTable;
  }
}
