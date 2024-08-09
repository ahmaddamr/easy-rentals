import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle});
  final Icon icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            icon,
            Text(
              title,
              style:
                  const TextStyle(fontSize: 19, fontWeight: FontWeight.normal),
            ),
            Text(subTitle,
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
