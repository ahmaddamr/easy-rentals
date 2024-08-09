import 'package:easy_rentals/core/theme/apptheme.dart';
import 'package:easy_rentals/data/models/car_model.dart';
import 'package:easy_rentals/presentation/modules/home/carDetails/screen/car_details_screen.dart';
import 'package:flutter/material.dart';

class CarItem extends StatelessWidget {
  final CarModel car;
  const CarItem({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsScreen(
              car: car,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color(0xffF3F3F3),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5),
            ]),
        child: Column(
          children: [
            Image.asset('assets/car_image.png'),
            Text(
              car.model,
              style: AppTheme()
                  .lightTheme
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/gps.png'),
                    Text(
                      car.distance.toString(),
                      style: AppTheme()
                          .darkTheme
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 16),
                    ),
                    Image.asset('assets/pump.png'),
                    Text(
                      car.fuelCapacity.toString(),
                      style: AppTheme()
                          .lightTheme
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 16),
                    ),
                  ],
                ),
                Text(
                  '\$${car.pricePerHour}/h',
                  style: AppTheme().lightTheme.textTheme.bodyMedium!.copyWith(
                      color: Colors.black.withOpacity(0.6), fontSize: 16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
