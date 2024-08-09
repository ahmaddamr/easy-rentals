import 'package:easy_rentals/data/dataSources/firebase_data.dart';
import 'package:easy_rentals/data/models/car_model.dart';
import 'package:easy_rentals/domain/repositries/car_repo.dart';

class CarRepoImp implements CarRepositry {
  final FirebaseData data;

  CarRepoImp({required this.data});
  @override
  Future<List<CarModel>> getCarRepositry() {
    return data.getCars();
  }
}
