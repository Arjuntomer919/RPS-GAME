import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:r_p_s_game/screens/gamescreen2.dart';
import 'package:r_p_s_game/utils/game.dart';
import 'package:r_p_s_game/widget/game_button.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final player = AudioPlayer();

// let set the width for the button so it can be adaptable to each screen size.

  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;

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
                SizedBox(
                  height: 40,
                ),

                // Now lets set the game pad to allow player to change options.

                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Center(
                    child: Stack(
                      children: [
                        //  Lets create a custum widget for the button.

                        Positioned(
                          top: btnWidth,
                          right: MediaQuery.of(context).size.width / 2 -
                              btnWidth -
                              40,
                          child: Hero(
                            tag: "Rock",
                            child: gameButton(
                              () {
                                // playAudio();
                                //  player.play(AssetSource('images/1.wav'));
                                print("Too Choosed Rock!");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GameScreen1(
                                      GameChoice("Rock"),
                                    ),
                                  ),
                                );
                              },
                              "images/rock_btn.png",
                              btnWidth,
                            ),
                          ),
                        ),
                        Positioned(
                          //  setting the positions.

                          top: 0,
                          left: MediaQuery.of(context).size.width / 2 -
                              btnWidth / 2 -
                              20,
                          child: Hero(
                            tag: "Paper",
                            child: gameButton(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameScreen1(
                                    GameChoice("Paper"),
                                  ),
                                ),
                              );
                            }, "images/paper_btn.png", btnWidth),
                          ),
                        ),
                        Positioned(
                          top: btnWidth,
                          left: MediaQuery.of(context).size.width / 2 -
                              btnWidth -
                              40,
                          child: Hero(
                            tag: "Scisors",
                            child: gameButton(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameScreen1(
                                    GameChoice("Scisors"),
                                  ),
                                ),
                              );
                            }, "images/scisor_btn.png", btnWidth),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: RawMaterialButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(16),
                    shape: StadiumBorder(
                        side: BorderSide(color: Colors.white, width: 5)),
                    child: Text(
                      "Choose any one.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  playAudio() async {
    print("play audio");
    await AudioPlayer().play(AssetSource('2.mp3'), volume: 1);
  }
}
