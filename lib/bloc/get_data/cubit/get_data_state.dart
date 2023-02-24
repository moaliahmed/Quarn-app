part of 'get_data_cubit.dart';

@immutable
abstract class GetDataState {}

class GetDataInitial extends GetDataState {}

class GetDateSuccess extends GetDataState {}

class GetDateLoding extends GetDataState {}

class GetDateError extends GetDataState {}
