import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/quraan.dart';

part 'get_sora_context_state.dart';

class GetSoraContextCubit extends Cubit<GetSoraContextState> {
  GetSoraContextCubit() : super(GetSoraContextInitial());
  static GetSoraContextCubit get(context) => BlocProvider.of(context);
  String? context;
  getSoraContext({required String soraName, required String goz2name}) {
    for (int i = 0; i <= Quraan.quranData.length - 1; i++) {
      if (soraName == Quraan.quranData[i].name &&
          goz2name == Quraan.quranData[i].part) {
        print('Suc');
        context = Quraan.quranData[i].content;
      }
    }
  }
}
