import 'package:flutter/cupertino.dart';
import 'package:quran_app/service/dio_helper.dart';
import 'package:quran_app/src/app_root.dart';

main() {
  DioHelper.init();
  runApp(AppRoot());
}
