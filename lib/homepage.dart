import 'package:flutter/material.dart';
import 'package:loginpage/orderpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          // catatan: "spacing" bukan properti dari Column
          // bisa diganti dengan SizedBox untuk spasi antar widget
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Selamat datang di Home Page!'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderPage()),
                );
              },
              child: const Text('Order Now'),
            ),
          ],
        ),
      ),
    );
  }
}
