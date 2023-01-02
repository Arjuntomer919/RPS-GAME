import 'dart:math';

class Game {
  static int gameScore = 0;

// Creating a list of option so the roboot choose the randamly from it.

  static List<String> choices = ["Rock", "Paper", "Scisors"];
  static String? randomChoice() {
    Random random = Random();
    int robotChoiceIndex = random.nextInt(2);
    print("randomn ${choices[robotChoiceIndex]}");
    return choices[robotChoiceIndex];
  }
}

class GameChoice {
  String? type = "";
  //  creating a mapfor the game rules.
  static var gameRule = {
    "Rock": {
      "Rock": "IT'S DRAW",
      "Paper": "YOU LOSE",
      "Scisors": "YOU WIN",
    },
    "Paper": {
      "Rock": "YOU WIN",
      "Paper": "IT'S DRAW",
      "Scisors": "YOU LOSE",
    },
    "Scisors": {
      "Rock": "YOU LOSE",
      "Paper": "YOU WIN",
      "Scisors": "IT'S DRAW",
    },
  };
  GameChoice(this.type);
}
