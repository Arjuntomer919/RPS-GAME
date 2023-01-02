import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:r_p_s_game/screens/gamepage.dart';

import '../utils/game.dart';
import '../widget/game_button.dart';

// ignore: must_be_immutable
class GameScreen1 extends StatefulWidget {
  GameScreen1(this.gameChoice, {Key? key}) : super(key: key);
  GameChoice gameChoice;

  @override
  State<GameScreen1> createState() => _GameScreen1State();
}

class _GameScreen1State extends State<GameScreen1> {
  var assetSource = "draw.mp3";
  bool isGameOn = true;
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;
    String? robotChoice = Game.randomChoice();
    // print("game choice ${Choice.gameRule[widget.gameChoice.type]![robotChoice]}");
    // print("robot choice ${robotChoice}");

    String robotChoicePath = "";
    switch (robotChoice) {
      case "Rock":
        robotChoicePath = "images/rock_btn.png";
        break;
      case "Paper":
        robotChoicePath = "images/paper_btn.png";
        break;
      case "Scisors":
        robotChoicePath = "images/scisor_btn.png";
        break;
      default:
    }
// setting the path to the player choice.
    String? player_Choice;
    switch (widget.gameChoice.type) {
      case "Rock":
        player_Choice = "images/rock_btn.png";
        break;
      case "Paper":
        player_Choice = "images/paper_btn.png";
        break;
      case "Scisors":
        player_Choice = "images/scisor_btn.png";
        break;
      default:
    }

//  Incrementing the score if you win.
    if (GameChoice.gameRule[widget.gameChoice.type]![robotChoice] ==
        "YOU WIN") {
      print("if you win game");

      assetSource = "win.mp3";

      setState(() {
        Game.gameScore++;
      });

      playAudio();
    } else if (GameChoice.gameRule[widget.gameChoice.type]![robotChoice] ==
        "YOU LOSE") {
      print("if you loose game");
      assetSource = "loss.mp3";

      setState(() {
        Game.gameScore--;
      });
      playAudio();
    } else {
      print("if you draw game");

      playAudio();
    }

    return Scaffold(
      backgroundColor: Color(0xff060a47),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Score",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 29.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${Game.gameScore}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 29.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Now lets set the game pad to allow player to choose options.

                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                        tag: "${widget.gameChoice.type}",
                        child: gameButton(null, player_Choice!, btnWidth),
                      ),
                      Text(
                        "VS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      gameButton(null, robotChoicePath, btnWidth),
                    ],
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${GameChoice.gameRule[widget.gameChoice.type]![robotChoice]}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
SizedBox(height: 50,),
                Container(
                  width: double.infinity,
                  child: RawMaterialButton(
                    onPressed: () {
                      // playAudio();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => GamePage(),
                      //     ));

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => GamePage()),
                          ModalRoute.withName('/'));
                    },
                    padding: EdgeInsets.all(16),
                    shape: StadiumBorder(
                        side: BorderSide(color: Colors.white, width: 5)),
                      
                    child: Text(
                      "Play Again",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   width: double.infinity,
                //   child: RawMaterialButton(
                //     onPressed: () {},
                //     padding: EdgeInsets.all(16),
                //     shape: StadiumBorder(
                //         side: BorderSide(color: Colors.white, width: 5)),
                //     child: Text(
                //       "Rules",
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  playAudio() async {
    print("play audio");

    await AudioPlayer().play(AssetSource(assetSource), volume: 1);
  }

  @override
  void dispose() {
    print("dispose");
    pauseAudio();

    // TODO: implement dispose
    super.dispose();
  }

  pauseAudio() async {
    await AudioPlayer().stop();
  }
}
