import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/bloc/quran/get_sora_context/cubit/get_sora_context_cubit.dart';
import 'package:quran_app/screens/select_sora_screen.dart';
import 'package:quran_app/src/app_color.dart';
import 'package:quran_app/utils/app_navigator.dart';

class SoraScreen extends StatefulWidget {
  int index;
  String goz2Name;
  String soraname;

  SoraScreen(
      {required this.index, required this.goz2Name, required this.soraname});

  @override
  State<SoraScreen> createState() => _SoraScreenState();
}

class _SoraScreenState extends State<SoraScreen> {
  double sliderValue = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.kWhiteColor,
        leading: IconButton(
          onPressed: () {
            AppNavigator.appNavigator(
                context,
                SelectSoraScreen(
                    index: widget.index, goz2Name: widget.goz2Name),
                isFinished: true);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 22,
            color: AppColors.kBlackColor,
          ),
        ),
        title: Text(
          widget.soraname,
          style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.kBlackColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: BlocProvider(
          create: (context) => GetSoraContextCubit()
            ..getSoraContext(
                soraName: widget.soraname, goz2name: widget.goz2Name),
          child: BlocConsumer<GetSoraContextCubit, GetSoraContextState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = GetSoraContextCubit.get(context);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        color: AppColors.kWhiteColor,
                        child: Column(
                          children: [
                            Text(
                              'حجم الخط',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: AppColors.kBlackColor),
                            ),
                            Container(
                              width: 200,
                              child: Slider(
                                  activeColor: AppColors.kRedColor,
                                  thumbColor: AppColors.kRedColor,
                                  min: 18,
                                  max: 40,
                                  value: sliderValue,
                                  onChanged: (double value) {
                                    setState(() {
                                      sliderValue = value;
                                      print(sliderValue);
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: AppColors.kBrownColor,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              ' بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ',
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.kBlackColor),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            cubit.context!,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: sliderValue.toInt().sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
