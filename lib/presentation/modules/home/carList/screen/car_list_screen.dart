import 'package:easy_localization/easy_localization.dart';
import 'package:easy_rentals/presentation/bloc/bloc/car_bloc.dart';
import 'package:easy_rentals/presentation/modules/home/carList/widgets/car_item.dart';
import 'package:easy_rentals/presentation/modules/settings/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CarListScreen extends StatelessWidget {
  
  final String pageRoute = 'CarListScreen';

  // List<CarModel> cars = [
  //   CarModel(
  //       model: 'Fortuner Gr',
  //       distance: 870,
  //       fuelCapacity: 50,
  //       pricePerHour: 45),
  //   CarModel(
  //       model: 'Fortuner Gr',
  //       distance: 870,
  //       fuelCapacity: 50,
  //       pricePerHour: 45),
  //   CarModel(
  //       model: 'Fortuner Gr',
  //       distance: 870,
  //       fuelCapacity: 50,
  //       pricePerHour: 45),
  // ];
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'choose'.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is Carloading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Carsuccess) {
            return ListView.builder(
              itemCount: state.carList.length,
              itemBuilder: (context, index) {
                return CarItem(car: state.carList[index]);
              },
            );
          } else if (state is Carerror) {
            return Text(state.error.toString());
          }
          return Container();
        },
      ),
    );
  }
}
// BlocBuilder<CarBloc, CarState>(
//         builder: (context, state) {
//           if (state is Carloading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is Carsuccess) {
//             return ListView.builder(
//               itemCount: cars.length,
//               itemBuilder: (context, index) {
//                 return CarItem(car: cars[index]);
//               },
//             );
//           } else if (state is Carerror) {
//             return Text(state.error.toString());
//           }
//           return Container();
//         },
//       ),
