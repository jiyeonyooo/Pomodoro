import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 10;
  bool running = false;
  int totalPomo = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 1) {
      setState(() {
        totalPomo += 1;
        running = false;
        totalSeconds = 10;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      running = true;
    });
  }

  void onPausePreseed() {
    timer.cancel();
    setState(() {
      running = false;
    });
  }

  void onReset() {
    setState(() {
      running = false;
      totalSeconds = 1500;
    });
    timer.cancel();
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    String time = duration.toString().split(".").first.substring(2, 7);
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                alignment: Alignment.center,
                child: EasyRichText(
                  "25분 집중! 5분 휴식!",
                  defaultStyle: const TextStyle(
                    color: Color.fromARGB(255, 19, 65, 31),
                    fontSize: 32,
                    fontFamily: "KoreanMachineBold",
                  ),
                  patternList: [
                    EasyRichTextPattern(
                      targetString: "25",
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    EasyRichTextPattern(
                      targetString: "5",
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    "assets/img/tomato.png",
                    width: 350,
                  ),
                  Positioned(
                    top: 180,
                    child: Text(
                      format(totalSeconds),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                        fontFamily: "KoreanMachineBold",
                        fontSize: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: running
                        ? const Icon(Icons.pause_circle_outline)
                        : const Icon(Icons.play_circle_outline),
                    iconSize: 70,
                    onPressed: running ? onPausePreseed : onStartPressed,
                    color: Theme.of(context).cardColor,
                  ),
                  IconButton(
                    icon: const Icon(Icons.stop_circle_outlined),
                    iconSize: 70,
                    onPressed: onReset,
                    color: Colors.black45,
                  ),
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: EasyRichText(
                          "현재 $totalPomo 뽀모를 달성하셨습니다! 🙌",
                          defaultStyle: TextStyle(
                            fontFamily: "KoreanMachineLight",
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.background,
                          ),
                          patternList: [
                            EasyRichTextPattern(
                              targetString: "$totalPomo",
                              style: const TextStyle(
                                fontFamily: "KoreanMachineBold",
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            EasyRichTextPattern(
                              targetString: "뽀모",
                              style: const TextStyle(
                                fontFamily: "KoreanMachineBold",
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
