import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int tab = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: Column(
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
            Row(
              children: [
                const SizedBox(width: 16),
                const Icon(Icons.account_balance_wallet),
                const SizedBox(width: 8),
                const Text(
                  'My E-Wallet',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Уведомления')),
                    );
                  },
                  icon: const Icon(Icons.notifications_none),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Andrew Ainsley',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '****  ****  ****  3629',
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Your balance',
                          style: TextStyle(color: Colors.white70),
                        ),
                        const Text(
                          '\$9,379',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Top Up')),
                            );
                          },
                          child: const Text('Top Up'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Transaction History',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('See All')),
                      );
                    },
                    child: const Text('See All'),
                  ),
                  operation('Lawson Chair', 'Dec 15, 2024', '\$120', false),
                  operation('Top Up Wallet', 'Dec 15, 2024', '\$400', true),
                  operation('Parabolic Reflector', 'Dec 14, 2024', '\$170', false),
                  operation('Mini Wooden Table', 'Dec 13, 2024', '\$165', false),
                  operation('Top Up Wallet', 'Dec 12, 2024', '\$300', true),
                ],
              ),
            ),
            BottomNavigationBar(
              currentIndex: tab,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  tab = index;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag),
                  label: 'Orders',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet),
                  label: 'Wallet',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget operation(String title, String date, String amount, bool plus) {
    Color color = Colors.red;
    if (plus) {
      color = Colors.green;
    }

    return ListTile(
      leading: const Icon(Icons.receipt_long),
      title: Text(title),
      subtitle: Text(date),
      trailing: Text(
        amount,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
