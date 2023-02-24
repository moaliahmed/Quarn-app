import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/bloc/quran/cubit/quran_cubit.dart';
import 'package:quran_app/comopnets/goz2_card.dart';
import 'package:quran_app/screens/nav_bar_screen.dart';
import 'package:quran_app/screens/quran_screen.dart';
import 'package:quran_app/src/app_color.dart';
import 'package:quran_app/utils/app_navigator.dart';

import '../models/quraan.dart';

class SelectSoraScreen extends StatelessWidget {
  int index;
  String goz2Name;
  SelectSoraScreen({required this.index, required this.goz2Name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.kWhiteColor,
        leading: IconButton(
            onPressed: () {
              AppNavigator.appNavigator(context, NavBarScreen(),
                  isFinished: true);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.kBlackColor,
              size: 25.sp,
            )),
        title: Text(
          goz2Name,
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.kBlackColor),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            QuranCubit()..calculateSoraname(goz2Name: goz2Name),
        child: BlocConsumer<QuranCubit, QuranState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = QuranCubit.get(context);
            return ListView.separated(
                padding: EdgeInsets.all(16),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return state is QuranLoadingState
                      ? CircularProgressIndicator()
                      : Goz2Card(
                          soraName: cubit.mySuraName![index],
                          isSora: true,
                          goz2Name: goz2Name,
                          mainText: cubit.mySuraName![index],
                          index: index + 1);
                },
                separatorBuilder: (context, index) => Divider(
                      thickness: 2,
                      color: AppColors.kGreyColor,
                    ),
                itemCount: cubit.mySuraName!.length);
          },
        ),
      ),
    );
  }
}
