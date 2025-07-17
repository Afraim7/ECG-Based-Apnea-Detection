import 'package:apnoxia/Models/ecgsignal.dart';

abstract class ApnoxiaState {}

final class Initial extends ApnoxiaState {}

final class Loading extends ApnoxiaState {}

final class LoadingSessionEnded extends ApnoxiaState {}

class ApnoxiaECGUploaded extends ApnoxiaState {
  final ECGSignal pickedSignal;
  ApnoxiaECGUploaded({required this.pickedSignal});
}

class ECGDataFetched extends ApnoxiaState {
  final String chartPath;
  final String apneaResults;
  ECGDataFetched({required this.apneaResults, required this.chartPath});
}

final class Error extends ApnoxiaState {
  final String message;
  Error(this.message);
}