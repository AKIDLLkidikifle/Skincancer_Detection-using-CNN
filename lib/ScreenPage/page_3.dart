import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

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
                    "assets/doc2.png",
                    height: 220,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get help Imediatily ',
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
