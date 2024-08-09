part of 'car_bloc.dart';

@immutable
sealed class CarState {}

final class CarInitial extends CarState {}

class Carloading extends CarState {}

class Carsuccess extends CarState {
  final List<CarModel> carList;

  Carsuccess({required this.carList});
}

class Carerror extends CarState {
  final String error;

  Carerror({required this.error});
}

