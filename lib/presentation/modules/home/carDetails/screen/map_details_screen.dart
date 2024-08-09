import 'package:easy_rentals/data/models/car_model.dart';
import 'package:easy_rentals/presentation/modules/home/carDetails/widget/feature_item.dart';
import 'package:easy_rentals/presentation/modules/onboarding/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapDetailsScreen extends StatelessWidget {
  const MapDetailsScreen({super.key, this.car});
  final String route = 'MapDetailsScreen';
  final CarModel? car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
                initialCenter: LatLng(51, -0.09), initialZoom: 13),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              )
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SizedBox(
              height: 350,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 0,
                              spreadRadius: 0)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            car?.model ?? '',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.directions_car,
                                  color: Colors.white),
                              Text(
                                '> ${car?.distance} km',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                              const Icon(Icons.battery_full,
                                  color: Colors.white),
                              Text(
                                car?.fuelCapacity.toString() ?? '',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Features',
                            style: TextStyle(color: Colors.black),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FeatureItem(
                                icon: Icon(
                                  Icons.local_gas_station,
                                  size: 35,
                                ),
                                title: 'Diesel',
                                subTitle: 'Common Rail',
                              ),
                              FeatureItem(
                                icon: Icon(
                                  Icons.speed,
                                  size: 35,
                                ),
                                title: 'Acceleration',
                                subTitle: '0 -100km/s',
                              ),
                              FeatureItem(
                                icon: Icon(
                                  Icons.ac_unit,
                                  size: 35,
                                ),
                                title: 'cold',
                                subTitle: 'Temp Control',
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${car?.pricePerHour} hour/day',
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.21,
                              ),
                              SizedBox(
                                width: 130,
                                child: CustomElvatedButton(
                                    text: 'Book Now',
                                    backgroundColor: Colors.black,
                                    borderSideColor: Colors.white,
                                    style: const TextStyle(color: Colors.white),
                                    onPressed: () {}),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 0,
                    child: Image.asset('assets/white_car.png'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
