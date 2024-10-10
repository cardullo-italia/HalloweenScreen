import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halloween_screen/data/musicExtractData.dart';
import 'package:halloween_screen/theme/themeColorApp.dart';

class MusicHalloween extends StatefulWidget {
  const MusicHalloween({super.key});

  @override
  State<MusicHalloween> createState() => _MusicHalloweenState();
}

class _MusicHalloweenState extends State<MusicHalloween> {
  late Future<List<MusicExtractData>> musicAll;

  @override
  void initState() {
    super.initState();
    musicAll = MusicExtractData.getAllMusic();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MusicExtractData.getAllMusic(),
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
            itemCount: 3,
            itemBuilder: (context, index) {
              MusicExtractData music = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  height: 93,
                  width: 258,
                  decoration: const BoxDecoration(
                    color: ColorScreenHalloween.orangeColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: ColorScreenHalloween.orangeColor,
                          image: DecorationImage(
                            image: NetworkImage(
                              music.imgMusic,
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            music.nameMusic,
                            style: GoogleFonts.instrumentSerif(
                                fontSize: 20, fontWeight: FontWeight.normal, color: ColorScreenHalloween.yellowBeigeColor),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.skip_previous,
                                  color: ColorScreenHalloween.yellowBeigeColor),
                              SizedBox(width: 10),
                              Icon(Icons.play_circle_outline,
                                  color: ColorScreenHalloween.yellowBeigeColor),
                              SizedBox(width: 10),
                              Icon(Icons.skip_next,
                                  color: ColorScreenHalloween.yellowBeigeColor),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
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
