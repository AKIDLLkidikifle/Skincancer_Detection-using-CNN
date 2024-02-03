import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

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
                Image.asset(
                  "assets/doc1.png",
                  height: 200,
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Idetect '.tr(),
                      style: TextStyle(
                          fontSize: 30,
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
                  'AI based skin camcer detector',
                  style: const TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Color.fromARGB(255, 26, 60, 250),
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    SizedBox(
                      width: 33,
                    ),
                    Text(
                      "Uploadimage".tr(),
                      style: TextStyle(letterSpacing: 1),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Color.fromARGB(255, 26, 60, 250),
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "get result  instantlly",
                      style: TextStyle(
                        letterSpacing: 1,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
