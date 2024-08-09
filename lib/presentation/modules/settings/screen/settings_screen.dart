import 'package:easy_localization/easy_localization.dart';
import 'package:easy_rentals/presentation/modules/settings/widget/lang_bottom_sheet.dart';
import 'package:easy_rentals/presentation/modules/settings/widget/theme_bottom_sheet.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'settings'.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'language'.tr(),
              style: const TextStyle(fontSize: 25),
            ),
            InkWell(
              onTap: () {
                showBottomSheetLang(context);
              },
              child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(7),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all()),
                child: const Text(
                  'English',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
              Text(
              'theme'.tr(),
              style: const TextStyle(fontSize: 25),
            ),
            InkWell(
              onTap: () {
                showBottomSheetTheme(context);
              },
              child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(7),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all()),
                child: const Text(
                  'Light',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showBottomSheetTheme(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) 
      {
        return const ThemeBottomSheet();
      },
    );
  }
  void showBottomSheetLang(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) 
      {
        return const LangBottomSheet();
      },
    );
  }
}
