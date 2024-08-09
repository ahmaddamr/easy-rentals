import 'package:easy_localization/easy_localization.dart';
import 'package:easy_rentals/dependency_injection.dart';
import 'package:easy_rentals/firebase_options.dart';
import 'package:easy_rentals/presentation/bloc/bloc/car_bloc.dart';
import 'package:easy_rentals/presentation/modules/home/carDetails/screen/car_details_screen.dart';
import 'package:easy_rentals/presentation/modules/home/carDetails/screen/map_details_screen.dart';
import 'package:easy_rentals/presentation/modules/home/carList/screen/car_list_screen.dart';
import 'package:easy_rentals/presentation/modules/layout/layout_screen.dart';
import 'package:easy_rentals/presentation/modules/onboarding/screen/onboarding_screen.dart';
import 'package:easy_rentals/core/theme/apptheme.dart';
import 'package:easy_rentals/presentation/provider/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initInjection();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ar')],
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
          child: const EasyRentals()),
    ),
  );
}

class EasyRentals extends StatelessWidget {
  const EasyRentals({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return BlocProvider(
      create: (context) => getIt<CarBloc>()..add(LoadCars()),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routes: {
          '/': (context) => const OnboardingScreen(),
          'CarListScreen': (context) => CarListScreen(),
          'CarDetailsScreen': (context) => const CarDetailsScreen(),
          'MapDetailsScreen': (context) => const MapDetailsScreen(),
          'LayoutScreen': (context) => LayoutScreen()
        },
        initialRoute: '/',
        theme: provider.themeData,
        // darkTheme: AppTheme().darkTheme,
        // themeMode: provider.themeData,
        // home: CarListScreen(),
      ),
    );
  }
}
