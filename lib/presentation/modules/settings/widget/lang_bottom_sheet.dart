import 'package:easy_localization/easy_localization.dart';
import 'package:easy_rentals/core/theme/apptheme.dart';
import 'package:easy_rentals/presentation/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LangBottomSheet extends StatelessWidget {
  const LangBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                context.setLocale(const Locale('ar'));
              },
              child: const Text('Arabic'),
            ),
            TextButton(
              onPressed: () {
                context.setLocale(const Locale('en'));
                
              },
              child: const Text('English'),
            ),
          ],
        ),
      ),
    );
  }
}
