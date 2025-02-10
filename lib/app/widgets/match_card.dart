import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final Map match;
  final bool isLive;
  const MatchCard({super.key, required this.match, required this.isLive});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:
            CircleAvatar(backgroundImage: NetworkImage(match['team1_logo'])),
        title: Text('${match['team1']} vs ${match['team2']}'),
        subtitle:
            isLive ?const Text('Live - 35:45') : Text('Time: ${match['time']}'),
        trailing:
            CircleAvatar(backgroundImage: NetworkImage(match['team2_logo'])),
      ),
    );
  }
}
