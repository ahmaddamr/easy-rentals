import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_rentals/data/models/car_model.dart';
import 'package:easy_rentals/presentation/modules/home/carDetails/screen/map_details_screen.dart';
import 'package:easy_rentals/presentation/modules/home/carDetails/widget/more_item.dart';
import 'package:easy_rentals/presentation/modules/home/carList/widgets/car_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key, this.car});
  final CarModel? car;

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen>
    with SingleTickerProviderStateMixin {
  final String pageRoute = 'CarDetailsScreen';
  AnimationController? controller;
  Animation<double>? animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    animation = Tween<double>(begin: 1.0, end: 1.6).animate(controller!)
      ..addListener(() {
        setState(() {});
      });
    controller!.forward();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.info_outline),
            const SizedBox(
              width: 5,
            ),
            Text(
              'information'.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          CarItem(
            car: CarModel(
                model: widget.car?.model ?? "",
                distance: widget.car!.distance,
                fuelCapacity: widget.car?.fuelCapacity ?? 0,
                pricePerHour: widget.car?.pricePerHour ?? 0),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffF3F3F3),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 5,
                              blurRadius: 10)
                        ]),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: Image.asset('assets/user.png'),
                        ),
                        Text(
                          'Jane Cooper',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                        const Text(
                          '\$4.25',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapDetailsScreen(
                            car: widget.car,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffF3F3F3),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 5,
                              blurRadius: 10)
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/maps.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          MoreItem(
            car: CarModel(
                model: widget.car?.model ?? "",
                distance: widget.car?.distance ?? 0,
                fuelCapacity: widget.car?.fuelCapacity ?? 0,
                pricePerHour: widget.car?.pricePerHour ?? 0),
          ),
          MoreItem(
            car: CarModel(
                model: widget.car?.model ?? "",
                distance: widget.car!.distance + 100,
                fuelCapacity: widget.car!.fuelCapacity + 100,
                pricePerHour: widget.car?.pricePerHour ?? 0),
          ),
          MoreItem(
            car: CarModel(
                model: widget.car?.model ?? "",
                distance: widget.car!.distance + 200,
                fuelCapacity: widget.car!.fuelCapacity + 200,
                pricePerHour: widget.car?.pricePerHour ?? 0),
          ),
        ],
      ),
    );
  }
}
