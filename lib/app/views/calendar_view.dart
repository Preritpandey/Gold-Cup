import 'package:flutter/material.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return MostGoalsPage();
  }
}

class MostGoalsPage extends StatelessWidget {
  final List<Map<String, dynamic>> players = [
    {"name": "Anjan Bista", "club": "Machhindra FC", "goals": 14},
    {"name": "Manish Dangi", "club": "APF FC", "goals": 11},
    {"name": "Kiran Chemjong", "club": "Church Boys", "goals": 10},
    {"name": "Rohit Chand", "club": "Shena", "goals": 9},
    {"name": "Ayush Ghalan", "club": "NRT", "goals": 9},
    {"name": "Gillespye Jung", "club": "Church Boys City", "goals": 6},
    {"name": "Sanjeeb Bista", "club": "NRT", "goals": 5},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Most Goals", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(Icons.sports_soccer, color: Colors.black),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade700,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("1",
                            style:
                                TextStyle(fontSize: 24, color: Colors.white)),
                        Text("Anant tamang",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text("Machhindra FC",
                            style: TextStyle(color: Colors.white70)),
                        Text("18",
                            style: TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Image.network(
                    'https://mhendolafole.org/wp-content/uploads/elementor/thumbs/anant-tamang-qrc0jpycv0xuofsfspurkgx9mlcxdatcy73n6ih0ug.jpg',
                    height: 100,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];
                return ListTile(
                  leading: Text("${index + 2}", style: TextStyle(fontSize: 18)),
                  title: Text(player["name"],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  subtitle: Text(player["club"]),
                  trailing: Text("${player["goals"]}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
