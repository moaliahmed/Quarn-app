import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/get_data.dart';
import '../../../service/dio_helper.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataInitial());
  static GetDataCubit get(context) => BlocProvider.of(context);

  jDate jGetDate = jDate();
  getDate() {
    emit(GetDateLoding());
    DioHelper.getData(
        url: 'timingsByAddress',
        query: {'address': 'aswan', 'method': '5'}).then((value) {
      jGetDate = jDate.fromJson(value.data);
      emit(GetDateSuccess());
      print('suc$value');
    }).catchError((e) {
      print('err$e');
      emit(GetDateError());
    });
  }
}
