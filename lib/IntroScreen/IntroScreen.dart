import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroState();
}

class _IntroState extends State<IntroScreen> {
  final controler = PageController();
  int lastPage = 0;
  @override
  void dispose() {
    controler.dispose();
    super.dispose();
  }

  TextStyle mystly = GoogleFonts.anta(
      textStyle: const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 234, 218, 218),
  ));
  TextStyle style2 = GoogleFonts.anta(
      textStyle: const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 234, 218, 218),
  ));

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 117, 227, 247),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        padding: const EdgeInsets.only(bottom: 100),
        child: PageView(
          controller: controler,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: h * 0.2,
                    width: w * 0.8,
                    child: const Center(
                        child: Text(
                      '📊📚',
                      style: TextStyle(fontSize: 40),
                    ))),
                Column(
                  children: [
                    Text(
                      'Welcome to new life💝\n',
                      style: mystly,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      'Increase your productivity & grow your profile. Be productive every day. Every day spend at least 2 hours on your goals✌️',
                      style: style2,
                    ),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: h * 0.2,
                    width: w * 0.8,
                    child: const Center(
                        child: Text(
                      '📱🧑‍💻',
                      style: TextStyle(fontSize: 40),
                    ))),
                Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      ' Post Achivement on public💝\n',
                      style: mystly,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      'Receive gifts from users 🎁.\nAnswer daily questions 📝 every day.\n Support others in achieving their goals',
                      style: style2,
                    ),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: h * 0.2,
                    width: w * 0.8,
                    child: const Center(
                        child: Text(
                      '🎁🧑‍🤝‍🧑',
                      style: TextStyle(fontSize: 40),
                    ))),
                Column(
                  children: [
                    Text(
                      'Challenge with friends 🧑‍🤝‍🧑\n',
                      style: mystly,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      'Support your friends with sharing popularity🔥\nView friends progress complete  the your own challenge ⏳',
                      style: style2,
                    ),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: h * 0.2,
                    width: w * 0.8,
                    child: const Center(
                        child: Text(
                      '⏳🧑‍💻',
                      style: TextStyle(fontSize: 40),
                    ))),
                Column(
                  children: [
                    Text(
                      'Productive Everyday💝\n',
                      style: mystly,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      'Start timer and  Work on your goal👍\n Achive your dreams with consitency🙌\n  Build good habit with in 30 days 🎉\nAll the best🏆',
                      style: style2,
                    ),
                  ],
                )
              ],
            ),
          ],
          onPageChanged: (value) {
            setState(() {
              lastPage = value;
            });
          },
        ),
      ),
      bottomSheet: lastPage == 3
          ? Builder(
              builder: (context) => SizedBox(
                width: w * 0.5,
                child: Padding(
                  padding: EdgeInsets.all(h * 0.01),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color.fromARGB(
                              255, 102, 241, 137)), // Change the color here
                    ),
                    onPressed: () async {
                      // Use the context from the Builder to show the Snackbar
                      // Navigator.pushReplacement(context, MaterialPageRoute(
                      //   builder: (context) {
                      //     return Profile();
                      //   },
                      // ));
                    },
                    child: Text(
                      'Start',
                      style:
                          TextStyle(color: Colors.black, fontSize: h * 0.025),
                    ),
                  ),
                ),
              ),
            )
          : Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        controler.jumpToPage(2);
                      },
                      child: ElevatedButton(
                          onPressed: () {}, child: Text('hello'))),
                  SmoothPageIndicator(
                    controller: controler,
                    count: 4,
                    effect: const SlideEffect(
                        spacing: 8.0,
                        radius: 9.0,
                        dotWidth: 20.0,
                        dotHeight: 16.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 2.5,
                        dotColor: Color.fromARGB(255, 131, 125, 125),
                        activeDotColor: Color.fromARGB(255, 19, 211, 77)),
                    onDotClicked: (index) {
                      controler.animateToPage(index,
                          duration: const Duration(microseconds: 500),
                          curve: Curves.easeInCubic);
                    },
                  ),
                  GestureDetector(
                      onTap: () {
                        controler.nextPage(
                            duration: const Duration(microseconds: 300),
                            curve: Curves.slowMiddle);
                        setState(() {});
                      },
                      child: Text(''))
                ],
              ),
            ),
    );
  }
}
