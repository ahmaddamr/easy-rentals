import 'package:easy_rentals/data/models/car_model.dart';
import 'package:flutter/material.dart';

class MoreItem extends StatelessWidget {
  const MoreItem({super.key, required this.car});
  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
      child: Container(
        // margin: EdgeInsets.all(10),
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(18)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.model,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                ),
                Row(
                  children: [
                    const Icon(Icons.directions_car),
                    Text(
                      '> ${car.distance} km',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                    const Icon(Icons.battery_full),
                    Text(
                      car.fuelCapacity.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
