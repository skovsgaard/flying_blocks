import java.util.Map;

class HighScore {
  HashMap<String, Integer> scoreTable = new HashMap<String, Integer>();

  void save(String name, int score) {
    scoreTable.put(name, score);
  }
  
  HashMap<String, Integer> getScoreTable() {
    return scoreTable;
  }
}