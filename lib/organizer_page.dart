import 'package:flutter/material.dart';

class OrganizerPage extends StatefulWidget {
  const OrganizerPage({super.key});

  @override
  State<OrganizerPage> createState() => _OrganizerPageState();
}

class _OrganizerPageState extends State<OrganizerPage> {
  bool following = false;
  bool showAllText = false;
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    String about =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.';
    if (showAllText) {
      about =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.';
    }

    String followText = 'Follow';
    if (following) {
      followText = 'Following';
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Назад')),
                    );
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Text(
                  'Organizer',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Center(
              child: CircleAvatar(
                radius: 48,
                child: Icon(Icons.person, size: 48),
              ),
            ),
            const SizedBox(height: 12),
            const Center(
              child: Text(
                'Albert Flores',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('2,368', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Followers'),
                  ],
                ),
                Column(
                  children: [
                    Text('346', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Following'),
                  ],
                ),
                Column(
                  children: [
                    Text('13', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Events'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  following = !following;
                });
              },
              child: Text(followText),
            ),
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Messages')),
                );
              },
              child: const Text('Messages'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      tab = 0;
                    });
                  },
                  child: const Text('About'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      tab = 1;
                    });
                  },
                  child: const Text('Events'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      tab = 2;
                    });
                  },
                  child: const Text('Reviews'),
                ),
              ],
            ),
            if (tab == 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(about),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showAllText = !showAllText;
                      });
                    },
                    child: Text(showAllText ? 'Show less' : 'Read more'),
                  ),
                ],
              ),
            if (tab == 1)
              const Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.event),
                    title: Text('Summer Meetup'),
                    subtitle: Text('12 Oct, 18:00'),
                  ),
                  ListTile(
                    leading: Icon(Icons.event),
                    title: Text('Design Talk'),
                    subtitle: Text('20 Oct, 19:30'),
                  ),
                  ListTile(
                    leading: Icon(Icons.event),
                    title: Text('Community Night'),
                    subtitle: Text('2 Nov, 17:00'),
                  ),
                ],
              ),
            if (tab == 2)
              const Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Отличная организация'),
                    subtitle: Text('Мария, 5.0'),
                  ),
                  ListTile(
                    leading: Icon(Icons.star_half),
                    title: Text('Хорошие события'),
                    subtitle: Text('Иван, 4.5'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
