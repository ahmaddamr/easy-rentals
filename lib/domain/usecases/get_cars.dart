import 'package:easy_rentals/data/models/car_model.dart';
import 'package:easy_rentals/domain/repositries/car_repo.dart';

class GetCars {
  final CarRepositry repositry;

  GetCars({required this.repositry});
  Future<List<CarModel>> call() async {
    return await repositry.getCarRepositry();
  }
}
