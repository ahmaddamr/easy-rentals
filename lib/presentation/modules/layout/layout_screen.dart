import 'package:easy_localization/easy_localization.dart';
import 'package:easy_rentals/presentation/modules/home/carList/screen/car_list_screen.dart';
import 'package:easy_rentals/presentation/modules/settings/screen/settings_screen.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  LayoutScreen({super.key});
  final String route = 'LayoutScreen';

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List<Widget> screens = [CarListScreen(), const SettingsScreen()];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: Colors.black,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: 'home'.tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings), label: 'settings'.tr())
        ],
      ),
      body: screens[index],
    );
  }
}
