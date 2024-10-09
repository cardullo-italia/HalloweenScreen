import 'package:flutter/material.dart';
import 'package:halloween_screen/theme/themeColorApp.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("31 Ottobre 2024"),
            Text("Italia Maria Desiré Cardullo")
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: ColorScreenHalloween.yellowBeigeColor,
              borderRadius: BorderRadius.circular(10.0)),
          child: const Text("Zombie Umano"),
        ),
      ],
    );
  }
}
