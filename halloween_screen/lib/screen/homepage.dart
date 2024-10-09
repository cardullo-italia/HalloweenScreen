import 'package:flutter/material.dart';
import 'package:halloween_screen/components/headerScreen.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              HeaderScreen(),
              SizedBox(height:30),
              Align(
                child:
              Text("Delizie Spettrali"),
              ),
              Container(
              height:193,
              child: const RecipeHalloween()
              )
            ],
          ),
        ),
      ),
    );
  }
}
