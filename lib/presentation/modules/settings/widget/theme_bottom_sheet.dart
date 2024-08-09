import 'package:easy_rentals/core/theme/apptheme.dart';
import 'package:easy_rentals/presentation/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                provider.changetheme(AppTheme().lightTheme);
              },
              child: const Text('Light'),
            ),
            TextButton(
              onPressed: () {
                provider.changetheme(AppTheme().darkTheme);
              },
              child: const Text('Dark'),
            ),
          ],
        ),
      ),
    );
  }
}
