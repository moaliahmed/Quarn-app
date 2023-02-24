import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/models/quraan.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());
  static QuranCubit get(context) => BlocProvider.of(context);
  List dataList = [];
  List? mySuraName = [];
  String? context;
  calulatGoz2(int index) {
    for (int i = 0; i <= Quraan.quranData.length; i++) {
      emit(QuranLoadingState());
      if (index.toString() == Quraan.quranData[i].part) {
        emit(QuranSuccsessState());
        dataList.add(Quraan.quranData[i]);
      }
    }
  }

  calculateSoraname({required String goz2Name}) async {
    for (int i = 0; i <= Quraan.quranData.length; i++) {
      print('ji');
      if (Quraan.quranData[i].part == goz2Name) {
        print('Hi');
        print(goz2Name);

        print('${Quraan.quranData[i].name}');

        mySuraName!.add(Quraan.quranData[i].name);
      }
    }
    ;
  }
}
