import 'package:easy_rentals/core/theme/apptheme.dart';
import 'package:easy_rentals/presentation/modules/home/carList/screen/car_list_screen.dart';
import 'package:easy_rentals/presentation/modules/layout/layout_screen.dart';
import 'package:easy_rentals/presentation/modules/onboarding/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  final String pageRoute = 'OnboardingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2c2b34),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/onboarding.png',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Premium Cars, \nEnjoy the luxury',
                  style: AppTheme().lightTheme.textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Premium amd prestige car daily rental, \nExperience the thrill at a lower price',
                  style: AppTheme()
                      .lightTheme
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 320,
                  height: 54,
                  child: CustomElvatedButton(
                    text: 'Lets Go',
                    backgroundColor: Colors.white,
                    borderSideColor: Colors.transparent,
                    style: AppTheme()
                        .lightTheme
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 16, color: Colors.black),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, LayoutScreen().route);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
