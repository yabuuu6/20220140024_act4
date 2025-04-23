import 'package:flutter/material.dart';
import 'package:loginpage/detailorder.dart'; 

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController makananController = TextEditingController();
  final TextEditingController minumanController = TextEditingController();
  final TextEditingController jumlahMakananController = TextEditingController();
  final TextEditingController jumlahMinumanController = TextEditingController();

  int totalHarga = 0;

  void calculateTotalPrice() {
    int jumlahMakanan = int.tryParse(jumlahMakananController.text) ?? 0;
    int jumlahMinuman = int.tryParse(jumlahMinumanController.text) ?? 0;

    setState(() {
      totalHarga = (jumlahMakanan * 32000) + (jumlahMinuman * 5000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Page'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: makananController,
                decoration: const InputDecoration(labelText: 'Food Order'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your food order';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: minumanController,
                decoration: const InputDecoration(labelText: 'Drink Order'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your drink order';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: jumlahMakananController,
                decoration: const InputDecoration(labelText: 'Food QTY Order'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your qty of food order';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: jumlahMinumanController,
                decoration: const InputDecoration(labelText: 'Drink QTY Order'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your qty of drink order';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    calculateTotalPrice();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailOrderPage(
                          makanan: makananController.text,
                          minuman: minumanController.text,
                          jumlahMakanan: jumlahMakananController.text,
                          jumlahMinuman: jumlahMinumanController.text,
                          totalHarga: totalHarga,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Order Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
