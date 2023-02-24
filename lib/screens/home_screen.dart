import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/get_data/cubit/get_data_cubit.dart';

import 'package:quran_app/models/counter_models.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../comopnets/coutner_item.dart';
import '../comopnets/item_componet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, this.timeplayNow = false});
  bool timeplayNow;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    GetDataCubit.get(context)..getDate();
    if (widget.timeplayNow == true) {
      AudioCache player = AudioCache(prefix: 'assets/sound/');
      player.play('PraySound.mpeg.mp3');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return BlocConsumer<GetDataCubit, GetDataState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GetDataCubit.get(context);

        return Scaffold(
          body: cubit.jGetDate.data == null
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 22.h,
                      ),
                      Container(
                          width: 380.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(120.r)),
                          margin: EdgeInsets.all(12.r),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 110.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/HomeScreen.jpg'),
                                      fit: BoxFit.cover),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.r)),
                                  color: Colors.redAccent,
                                ),
                                alignment: Alignment.center,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 9.r, top: 10.r),
                                alignment: Alignment.bottomRight,
                                child: Column(
                                  children: [
                                    Text(
                                      cubit.jGetDate.data!.date!.hijri!.weekday!
                                              .ar ??
                                          '',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.sp),
                                    ),
                                    Container(
                                      width: 150.w,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              cubit.jGetDate.data!.date!.hijri!
                                                      .month!.arr ??
                                                  '',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.sp),
                                            ),
                                            VerticalDivider(
                                              color: Colors.white,
                                              thickness: 2.r,
                                            ),
                                            Text(
                                              '${cubit.jGetDate.data!.date!.hijri!.day}' ??
                                                  '',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CounterTime(
                          prayTime: [
                            counterModels(
                                time: cubit.jGetDate.data!.timings!.fajr,
                                title: 'الفجر'),
                            counterModels(
                                time: cubit.jGetDate.data!.timings!.dhuhr,
                                title: 'الظهر'),
                            counterModels(
                                time: cubit.jGetDate.data!.timings!.asr,
                                title: 'العصر'),
                            counterModels(
                                time: cubit.jGetDate.data!.timings!.maghrib,
                                title: 'المغرب'),
                            counterModels(
                                time: cubit.jGetDate.data!.timings!.isha,
                                title: 'العشاء')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9.0),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 18.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Color.fromARGB(166, 238, 221, 179),
                          ),
                          child: Column(
                            children: [
                              ItemCommponent(
                                  label: 'الفجر',
                                  labelTime:
                                      cubit.jGetDate.data!.timings!.fajr),
                              ItemCommponent(
                                  label: 'الشروق',
                                  labelTime:
                                      cubit.jGetDate.data!.timings!.sunrise),
                              ItemCommponent(
                                  label: 'الظهر',
                                  labelTime:
                                      cubit.jGetDate.data!.timings!.dhuhr),
                              ItemCommponent(
                                  label: 'العصر',
                                  labelTime: cubit.jGetDate.data!.timings!.asr),
                              ItemCommponent(
                                  label: 'المغرب',
                                  labelTime:
                                      cubit.jGetDate.data!.timings!.maghrib),
                              ItemCommponent(
                                  label: 'العشاء',
                                  labelTime:
                                      cubit.jGetDate.data!.timings!.isha),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
