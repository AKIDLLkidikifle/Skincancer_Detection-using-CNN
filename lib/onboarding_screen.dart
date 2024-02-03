import 'package:flutter/material.dart';
import 'ScreenPage/page_1.dart';
import 'ScreenPage/page_2.dart';
import 'ScreenPage/page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  @override
  bool onLastPage = false;
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (value) {
            setState(() {
              onLastPage = (value == 2);
            });
          },
          children: [
            const Page1(),
            const Page2(),
            const Page3(),
          ],
        ),
        Container(
            alignment: const Alignment(0, 0.77),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(3);
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(fontSize: 18, letterSpacing: 1),
                  ),
                ),

                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: const WormEffect(
                      dotHeight: 16,
                      dotWidth: 16,
                      activeDotColor: Color.fromARGB(255, 26, 60, 250),
                      dotColor: Colors.grey),
                ),
                //next
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(microseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text(
                          "Done",
                          style: TextStyle(fontSize: 18, letterSpacing: 1),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(microseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(fontSize: 18, letterSpacing: 1),
                        ),
                      ),
              ],
            ))
      ],
    ));
  }
}
