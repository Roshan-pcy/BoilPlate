import 'package:boilerplate/chart/list_tile.dart';
import 'package:boilerplate/global/global.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              isNotificationEnabled == true
                  ? Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: double.infinity,
                      color: Colors.yellow,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Enable notificaion'),
                          InkWell(
                            child: Icon(Icons.close),
                            onTap: () async {
                              await openAppSettings();
                            },
                          )
                        ],
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: 400,
                child: LineChart(
                  curve: Curves.linear,
                  // duration: Duration(seconds: 2000),
                  LineChartData(
                    minX: 0,
                    maxX: 11,
                    minY: 0,
                    maxY: 10,
                    gridData: FlGridData(
                      show: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: const Color(0xff37434d),
                          strokeWidth: 0.1,
                        );
                      },
                      drawVerticalLine: true,
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: const Color(0xff37434d),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border:
                          Border.all(color: const Color(0xff37434d), width: 1),
                    ),
                    // borderData: FlBorderData(
                    //     show: true,
                    //     border: Border(
                    //         // bottom: BorderSide(color: Colors.transparent),
                    //         left: BorderSide(color: Colors.transparent),
                    //         right: BorderSide(color: Colors.transparent))),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 3),
                          FlSpot(2.6, 2),
                          FlSpot(4.9, 5),
                          FlSpot(6.8, 2.5),
                          FlSpot(8, 4),
                          FlSpot(9.5, 3),
                          FlSpot(11, 4),
                        ],
                        isCurved: true,

                        barWidth: 5,
                        // dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                            // show: true,
                            ),
                      ),
                      LineChartBarData(
                        color: Colors.yellow,
                        spots: [
                          FlSpot(0, 6),
                          FlSpot(2.6, 1),
                          FlSpot(4.9, 5),
                          FlSpot(6.8, 4),
                          FlSpot(8, 7),
                          FlSpot(9.5, 1),
                          FlSpot(11, 5),
                        ],
                        isCurved: true,

                        barWidth: 5,
                        // dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          color: Colors.white,
                          // show: true,
                        ),
                      ),
                    ],
                    titlesData: FlTitlesData(
                        // leftTitles: AxisTitles(
                        //   sideTitles: SideTitles(
                        //     showTitles: true,
                        //     reservedSize: 50,
                        //     interval: 3,
                        //     getTitlesWidget: (value, meta) {
                        //       if (value == 3) {
                        //         return Text('month');
                        //       } else if (value == 6) {
                        //         return Text('feb');
                        //       }
                        //       return Text(' ');
                        //     },
                        //   ),
                        // ),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 50,
                            interval: 3,
                            getTitlesWidget: (value, meta) {
                              if (value == 3) {
                                return Text('month');
                              } else if (value == 6) {
                                return Text('feb');
                              }
                              return Text(' ');
                            },
                          ),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 400,
                child: LineChart(
                  curve: Curves.linear,
                  // duration: Duration(seconds: 2000),
                  LineChartData(
                    minX: 0,
                    maxX: 11,
                    minY: 0,
                    maxY: 10,
                    gridData: FlGridData(
                      show: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: const Color(0xff37434d),
                          strokeWidth: 0.1,
                        );
                      },
                      drawVerticalLine: true,
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: const Color(0xff37434d),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border:
                          Border.all(color: const Color(0xff37434d), width: 1),
                    ),
                    // borderData: FlBorderData(
                    //     show: true,
                    //     border: Border(
                    //         // bottom: BorderSide(color: Colors.transparent),
                    //         left: BorderSide(color: Colors.transparent),
                    //         right: BorderSide(color: Colors.transparent))),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 3),
                          FlSpot(2.6, 2),
                          FlSpot(4.9, 5),
                          FlSpot(6.8, 2.5),
                          FlSpot(8, 4),
                          FlSpot(9.5, 3),
                          FlSpot(11, 4),
                        ],
                        isCurved: false,

                        barWidth: 5,
                        // dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                            // show: true,
                            ),
                      ),
                      LineChartBarData(
                        color: const Color.fromARGB(255, 59, 255, 98),
                        spots: [
                          FlSpot(0, 6),
                          FlSpot(2.6, 1),
                          FlSpot(4.9, 5),
                          FlSpot(6.8, 4),
                          FlSpot(8, 7),
                          FlSpot(9.5, 1),
                          FlSpot(11, 5),
                        ],
                        isCurved: true,

                        barWidth: 5,
                        // dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          color: Colors.white,
                          // show: true,
                        ),
                      ),
                    ],
                    titlesData: FlTitlesData(
                        // leftTitles: AxisTitles(
                        //   sideTitles: SideTitles(
                        //     showTitles: true,
                        //     reservedSize: 50,
                        //     interval: 3,
                        //     getTitlesWidget: (value, meta) {
                        //       if (value == 3) {
                        //         return Text('month');
                        //       } else if (value == 6) {
                        //         return Text('feb');
                        //       }
                        //       return Text(' ');
                        //     },
                        //   ),
                        // ),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 50,
                            interval: 3,
                            getTitlesWidget: (value, meta) {
                              if (value == 3) {
                                return Text('month');
                              } else if (value == 6) {
                                return Text('feb');
                              }
                              return Text(' ');
                            },
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
