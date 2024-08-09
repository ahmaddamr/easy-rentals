import 'package:easy_rentals/data/models/car_model.dart';

abstract class CarRepositry {
  Future<List<CarModel>> getCarRepositry();
}
