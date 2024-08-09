import 'package:bloc/bloc.dart';
import 'package:easy_rentals/data/models/car_model.dart';
import 'package:easy_rentals/domain/usecases/get_cars.dart';
import 'package:meta/meta.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;
  CarBloc({required this.getCars}) : super(CarInitial()) {
    on<CarEvent>((event, emit) async {
      emit(Carloading());

      try {
        final carsData = await getCars.call();
        emit(Carsuccess(carList: carsData));
        print('dat ${carsData}');
      } catch (e) {
        emit(Carerror(error: e.toString()));
      }
    });
  }
}
