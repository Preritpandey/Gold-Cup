import 'package:flutter/material.dart';
import 'package:gold_cup/app/controllers/live_stream_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class LiveMatchList extends StatelessWidget {
  final LiveStreamController controller = Get.put(LiveStreamController());
  LiveMatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true, // Prevents infinite height issues
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ClipPath(
                clipper: CustomCardClipper(),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color:
                        index % 2 == 0 ? const Color(0xFF2A0140) : Colors.red,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Gold Cup",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 14)),
                      Text("Game Week 3",
                          style: GoogleFonts.poppins(
                              color: Colors.white70, fontSize: 12)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          teamInfo(controller.liveMatch['team1']!),
                          matchScore(),
                          teamInfo(controller.liveMatch['team2']!),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget teamInfo(String teamName) {
    return Column(
      children: [
        Image.network(
          "https://raw.githubusercontent.com/sangamsgit/Project-Football-Goldcup-Website/main/Assets/images/apf.jpg",
          height: 40,
        ),
        const SizedBox(height: 5),
        Text(teamName,
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 14)),
      ],
    );
  }

  Widget matchScore() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(12)),
          child: Text("90+5",
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 12)),
        ),
        const SizedBox(height: 5),
        Text("3 : 2",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class CustomCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double cutSize = 20.0;

    path.moveTo(0, 0);
    path.lineTo(size.width - cutSize, 0);
    path.lineTo(size.width, cutSize);
    path.lineTo(size.width, size.height);
    path.lineTo(cutSize, size.height);
    path.lineTo(0, size.height - cutSize);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
