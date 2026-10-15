import 'package:flutter/material.dart';

class MeditatePage extends StatefulWidget {
  const MeditatePage({super.key});

  @override
  State<MeditatePage> createState() => _MeditatePageState();
}

class _MeditatePageState extends State<MeditatePage> {
  // 0 All, 1 Bible, 2 Dailies, 3 Minutes, 4 Novena
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Row(
                children: [
                  Text('9:41', style: TextStyle(fontSize: 16)),
                  Spacer(),
                  Icon(Icons.signal_cellular_alt, size: 16),
                  SizedBox(width: 4),
                  Icon(Icons.wifi, size: 16),
                  SizedBox(width: 4),
                  Icon(Icons.battery_full, size: 18),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 8, 0),
              child: Row(
                children: [
                  const Text(
                    'Meditate',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Поиск')),
                      );
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  categoryButton('All', 0),
                  const SizedBox(width: 8),
                  categoryButton('Bible In a Year', 1),
                  const SizedBox(width: 8),
                  categoryButton('Dailies', 2),
                  const SizedBox(width: 8),
                  categoryButton('Minutes', 3),
                  const SizedBox(width: 8),
                  categoryButton('Novena', 4),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  if (selected == 0 || selected == 2) songCard(),
                  if (selected == 0 || selected == 3)
                    lessonCard(
                      const Color(0xFFFF9F43),
                      Icons.cloud_outlined,
                      'The Sleep Hour',
                      'Ashina Mukherjee',
                      '3 Sessions',
                    ),
                  if (selected == 0 || selected == 2)
                    lessonCard(
                      const Color(0xFFFFD56A),
                      Icons.nightlight_round,
                      'Easy on the Mission',
                      'Peter Mach',
                      '5 minutes',
                    ),
                  if (selected == 0 || selected == 1)
                    lessonCard(
                      const Color(0xFF4C8DFF),
                      Icons.wb_sunny,
                      'Relax with Me',
                      'Amanda James',
                      '3 Sessions',
                    ),
                  if (selected == 0 || selected == 4)
                    lessonCard(
                      const Color(0xFF2EC4B6),
                      Icons.cloud,
                      'Sun and Energy',
                      'Micheal Hiu',
                      '5 minutes',
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryButton(String text, int index) {
    bool on = selected == index;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selected = index;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: on ? const Color(0xFF2EC4C0) : Colors.white,
        foregroundColor: on ? Colors.white : const Color(0xFF2EC4C0),
      ),
      child: Text(text),
    );
  }

  Widget songCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFFFC857),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.wb_sunny_outlined, color: Colors.white, size: 64),
        ),
        const SizedBox(height: 8),
        const Text(
          'A Song of Moon',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Text('Start with the basics'),
        Row(
          children: [
            const Icon(Icons.favorite_border, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            const Text('9 Sessions', style: TextStyle(color: Colors.grey)),
            const Spacer(),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('A Song of Moon')),
                );
              },
              child: const Text('Start'),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget lessonCard(
    Color color,
    IconData icon,
    String title,
    String author,
    String info,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: Colors.white, size: 36),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(author, style: const TextStyle(color: Colors.grey)),
          Row(
            children: [
              const Icon(Icons.favorite_border, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(info, style: const TextStyle(color: Colors.grey)),
              const Spacer(),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(title)),
                  );
                },
                child: const Text('Start'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
