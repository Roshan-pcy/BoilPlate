import 'dart:async';

import 'package:boilerplate/chart/appColor.dart';
import 'package:boilerplate/chart/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;
  StreamController<int> controller = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.3,
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    height: 18,
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                              setState(() {
                                if (!event.isInterestedForInteractions ||
                                    pieTouchResponse == null ||
                                    pieTouchResponse.touchedSection == null) {
                                  touchedIndex = -1;
                                  return;
                                }
                                touchedIndex = pieTouchResponse
                                    .touchedSection!.touchedSectionIndex;
                              });
                            },
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: showingSections(),
                        ),
                      ),
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Indicator(
                        color: AppColors.contentColorBlue,
                        text: 'Study',
                        isSquare: false,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: AppColors.contentColorYellow,
                        text: 'Productivity',
                        isSquare: false,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: AppColors.contentColorPurple,
                        text: 'Fitness',
                        isSquare: false,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: AppColors.contentColorGreen,
                        text: 'Fourth',
                        isSquare: false,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: FortuneWheel(
                duration: Duration(seconds: 10),
                selected: controller.stream,
                items: [
                  FortuneItem(
                      onPanStart: (details) {},
                      onForcePressStart: (details) {
                        print('Started');
                      },
                      onPanEnd: (details) {
                        print('Ended');
                      },
                      child: Text('Han Solo'),
                      style: FortuneItemStyle(
                          color: const Color.fromARGB(255, 167, 95, 95))),
                  FortuneItem(child: Text('Yoda')),
                  FortuneItem(child: Text('Obi-Wan Kenobi')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.contentColorBlue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.contentColorYellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.contentColorPurple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.contentColorGreen,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
