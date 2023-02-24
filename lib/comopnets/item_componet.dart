import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCommponent extends StatelessWidget {
  ItemCommponent({super.key, required this.label, required this.labelTime});
  String? label;
  String? labelTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90.r), color: Colors.white),
        height: 55.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('$labelTime', style: TextStyle(fontSize: 32.sp)),
            Text(
              '$label',
              style: TextStyle(fontSize: 32),
            )
          ],
        ),
      ),
    );
  }
}
