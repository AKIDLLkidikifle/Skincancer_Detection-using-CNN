import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 100, 40, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                  child: Image.asset(
                    "assets/intro.png",
                    height: 230,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get Information ',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.blueGrey[800],
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'get information about Skin cancer \n and protect your self from the \n  Danger skin cancer',
                  style: const TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
