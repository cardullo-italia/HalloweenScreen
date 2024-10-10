import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halloween_screen/data/filmExtractData.dart';
import 'package:halloween_screen/theme/themeColorApp.dart';

class FilmHalloween extends StatefulWidget {
  const FilmHalloween({super.key});

  @override
  State<FilmHalloween> createState() => _FilmHalloweenState();
}

class _FilmHalloweenState extends State<FilmHalloween> {
  late Future<List<FilmExtractData>> filmAll;

  @override
  void initState() {
    super.initState();
    filmAll = FilmExtractData.getAllFilm();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FilmExtractData.getAllFilm(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text("Nessun dato disponibile"),
          );
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              FilmExtractData film = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 222,
                  width: 156,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(film.imgFilm),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                film.nameFilm,
                                style: GoogleFonts.instrumentSerif(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis, 
                                maxLines: 1, 
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.yellow, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  film.ratedFilm,
                                  style: GoogleFonts.instrumentSerif(
                                    color: ColorScreenHalloween.yellowBeigeColor,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorScreenHalloween.yellowBeigeColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Guarda",
                              style: GoogleFonts.instrumentSerif(
                                  color: ColorScreenHalloween.blackColor,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(width: 4),  
                              const Icon(Icons.arrow_forward, 
                              color: ColorScreenHalloween.blackColor,
                              ),
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
