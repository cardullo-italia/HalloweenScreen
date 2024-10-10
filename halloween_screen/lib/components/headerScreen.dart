import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halloween_screen/theme/themeColorApp.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "31 Ottobre 2024",
              style: GoogleFonts.instrumentSerif(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: ColorScreenHalloween.orangeColor
              ),
            ),
            Text(
              "Italia Maria Desiré Cardullo",
              style: GoogleFonts.instrumentSerif(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: ColorScreenHalloween.yellowBeigeColor,
              borderRadius: BorderRadius.circular(10.0)),
          child: Text(
            "Zombie Umano",
            style: GoogleFonts.instrumentSerif(
              fontSize: 17,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
