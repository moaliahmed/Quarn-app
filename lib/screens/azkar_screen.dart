import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quran_app/comopnets/azkar_card.dart';
import 'package:quran_app/comopnets/goz2_card.dart';
import 'package:quran_app/models/azkar.dart';
import 'package:quran_app/src/app_color.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return AzkarCard(
          azkarType: azkarList[index],
          index: index,
        );
      },
      itemCount: azkarList.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: AppColors.kGreyColor,
          thickness: 2,
        );
      },
    );
  }
}
