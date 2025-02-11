import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchCard extends StatelessWidget {
  final Map match;
  final bool isLive;
  const MatchCard({super.key, required this.match, required this.isLive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(match['team1_logo']),
                        radius: 20,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        match['team1'],
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      if (isLive)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Live - 35:45',
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: Colors.white),
                          ),
                        ),
                      const SizedBox(height: 5),
                      Text(
                        'Today\n8:00PM',
                        style: GoogleFonts.poppins(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(match['team2_logo']),
                        radius: 20,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        match['team2'],
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
