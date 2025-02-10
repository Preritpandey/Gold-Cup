import 'package:flutter/material.dart';

class TopScorerCard extends StatelessWidget {
  final Map scorer;
  TopScorerCard({required this.scorer});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(scorer['name']),
        subtitle: Text('${scorer['club']} - Goals: ${scorer['goals']}'),
      ),
    );
  }
}
