import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halloween_screen/components/film.dart';
import 'package:halloween_screen/components/headerScreen.dart';
import 'package:halloween_screen/components/music.dart';
import 'package:halloween_screen/components/recipes.dart';
import 'package:halloween_screen/theme/themeColorApp.dart';

class HomepageHalloween extends StatefulWidget {
  const HomepageHalloween({super.key});

  @override
  State<HomepageHalloween> createState() => _HomepageHalloweenState();
}

class _HomepageHalloweenState extends State<HomepageHalloween> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorScreenHalloween.beigeColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HeaderScreen(),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Delizie Spettrali",
                  style: GoogleFonts.instrumentSerif(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: ColorScreenHalloween.orangeColor),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.center,
                height: 193,
                child: const RecipeHalloween(),
              ),
               const SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Musiche Spettrali",
                  style: GoogleFonts.instrumentSerif(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: ColorScreenHalloween.orangeColor),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height:93,
                child: const MusicHalloween()
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Film da vedere",
                  style: GoogleFonts.instrumentSerif(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: ColorScreenHalloween.orangeColor),
                ),
              ),
              const SizedBox(
               height:222,
                child: FilmHalloween()
              )
            ],
          ),
        ),
      ),
    );
  }
}
