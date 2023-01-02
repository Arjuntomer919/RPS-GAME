import 'package:flutter/material.dart';
import 'package:r_p_s_game/utils/routes.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff060a47),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset("images/10.webp",
                fit: BoxFit.cover, width: double.infinity),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              height: 40,
              
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent),
                onPressed: () {
                  
                  Navigator.pushNamed(context,  Routes.gamepageRoutes);
                },
                child: Text(
                  "Play",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
