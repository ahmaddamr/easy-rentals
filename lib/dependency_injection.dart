import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_rentals/data/dataSources/firebase_data.dart';
import 'package:easy_rentals/data/reposetories/car_repo_imp.dart';
import 'package:easy_rentals/domain/repositries/car_repo.dart';
import 'package:easy_rentals/domain/usecases/get_cars.dart';
import 'package:easy_rentals/presentation/bloc/bloc/car_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void initInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseData>(
        () => FirebaseData(firestore: getIt<FirebaseFirestore>()));
    getIt.registerLazySingleton<CarRepositry>(
        () => CarRepoImp(data: getIt<FirebaseData>()));
    getIt.registerLazySingleton<GetCars>(
        () => GetCars(repositry: getIt<CarRepositry>()));
    getIt.registerFactory(() => CarBloc(getCars: getIt<GetCars>()));
  } catch (e) {}
}
