import 'package:flutter/material.dart';
import 'package:pr1/meditate_page.dart';
import 'package:pr1/organizer_page.dart';
import 'package:pr1/wallet_page.dart';
import 'package:pr1/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    Widget screen = const WelcomePage();
    if (page == 1) {
      screen = const MeditatePage();
    }
    if (page == 2) {
      screen = const WalletPage();
    }
    if (page == 3) {
      screen = const OrganizerPage();
    }

    return Scaffold(
      body: screen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Welcome'),
          BottomNavigationBarItem(icon: Icon(Icons.spa), label: 'Meditate'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Organizer'),
        ],
      ),
    );
  }
}
