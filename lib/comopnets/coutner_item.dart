import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/models/counter_models.dart';
import 'package:quran_app/screens/home_screen.dart';
import 'package:quran_app/utils/app_navigator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterTime extends StatefulWidget {
  CounterTime({super.key, required this.prayTime});
  List<counterModels> prayTime;
  @override
  State<CounterTime> createState() => _CounterTimeState();
}

class _CounterTimeState extends State<CounterTime> {
  late int minTime;
  String? prayName;
  @override
  void initState() {
    DateTime now = DateTime.now();
    minTime = 86400;
    var format = DateFormat("HH:mm");
    for (int i = 0; i < 5; i++) {
      var one = format.parse('${widget.prayTime[i].time}');
      var two = format.parse('${now.hour}:${now.minute}');
      print("${one.difference(two)}");

      var te = one.difference(two).inSeconds.toString();
      if (int.parse(te) > 0 && int.parse(te) < minTime) {
        minTime = int.parse(te);
        prayName = widget.prayTime[i].title;
      }
    }
    if (minTime == 86400) {
      prayName = widget.prayTime[0].title;
      var one = format.parse('${widget.prayTime[0].time}');
      var t = format.parse('00:00');
      var daytime = format.parse('24:00');
      var two = format.parse('${now.hour}:${now.minute}');
      var totel = one.difference(t).inSeconds.toString();
      var totel1 = daytime.difference(two).inSeconds.toString();
      minTime = int.parse(totel) + int.parse(totel1);
    }
    print(minTime);
    startTimer();
    super.initState();
  }

  Timer? countdownTimer;
  int t = 9;
  late Duration myDuration = Duration(seconds: minTime);

  void startTimer() {
    print('prient$minTime');
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;

    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        AppNavigator.appNavigator(
            context,
            HomeScreen(
              timeplayNow: true,
            ));
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);

    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Container(
        width: 360.w,
        decoration: BoxDecoration(
            border: Border.all(width: 2.w),
            borderRadius: BorderRadius.circular(22.r)),
        child: Column(
          children: [
            Text(
              'متبقي علي صلاه $prayName',
              style: TextStyle(fontSize: 22.sp),
            ),
            Text(
              '$hours:$minutes:$seconds',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 50.sp),
            ),
          ],
        ));
  }
}
