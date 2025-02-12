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
    {"name": "Darwin Núñez", "club": "Liverpool", "goals": 14},
    {"name": "Mykhailo Mudryk", "club": "Chelsea", "goals": 11},
    {"name": "Bukayo Saka", "club": "Arsenal", "goals": 10},
    {"name": "Antony Santos", "club": "Manchester United", "goals": 9},
    {"name": "Son Heun-min", "club": "Tottenham", "goals": 9},
    {"name": "Erling Haaland", "club": "Manchester City", "goals": 6},
    {"name": "Jarrod Bowen", "club": "West Ham", "goals": 5},
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
                        Text("Harry Maguire",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text("Manchester United",
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
                    'https://upload.wikimedia.org/wikipedia/commons/5/59/Harry_Maguire_2018.jpg',
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
