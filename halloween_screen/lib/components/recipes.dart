import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halloween_screen/data/recipeExtractData.dart';
import 'package:halloween_screen/theme/themeColorApp.dart';

class RecipeHalloween extends StatefulWidget {
  const RecipeHalloween({super.key});

  @override
  State<RecipeHalloween> createState() => _RecipeHalloweenState();
}

class _RecipeHalloweenState extends State<RecipeHalloween> {
  late Future<List<RecipeExtractData>> recipeAll;

  @override
  void initState() {
    super.initState();
    recipeAll = RecipeExtractData.recipeAll();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RecipeExtractData.recipeAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Errore nel caricamento dei dati: ${snapshot.error}"),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text("Nessun dato disponibile"),
          );
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              RecipeExtractData recipe = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: 193,
                  width: 174,
                  decoration: const BoxDecoration(
                    color: ColorScreenHalloween.orangeColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 129,
                            width: 174,
                            decoration: BoxDecoration(
                              color: ColorScreenHalloween.orangeColor,
                              image: DecorationImage(
                                image: NetworkImage(
                                  recipe.imgRecipe,
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ), 
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              decoration: BoxDecoration(
                                color: ColorScreenHalloween.whiteColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                "Easy",
                                style: GoogleFonts.instrumentSerif(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                recipe.nameRecipe,
                                style: GoogleFonts.instrumentSerif(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                    color:
                                        ColorScreenHalloween.yellowBeigeColor),
                                overflow: TextOverflow.clip,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: ColorScreenHalloween.yellowBeigeColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
