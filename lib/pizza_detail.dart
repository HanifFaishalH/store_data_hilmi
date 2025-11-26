import 'package:flutter/material.dart';
import 'package:store_data_hilmi/httphelper.dart';
import 'package:store_data_hilmi/model/pizza.dart';

class PizzaDetailScreen extends StatefulWidget {
  const PizzaDetailScreen({super.key});

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

final TextEditingController txtId = TextEditingController();
final TextEditingController txtName = TextEditingController();
final TextEditingController txtDescription = TextEditingController();
final TextEditingController txtPrice = TextEditingController();
final TextEditingController txtImageUrl = TextEditingController();
final TextEditingController txtCategory = TextEditingController();
final TextEditingController txtAvailable = TextEditingController();

String operationResult = '';

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  @override
  void dispose() {
    txtId.dispose();
    txtName.dispose();
    txtDescription.dispose();
    txtPrice.dispose();
    txtImageUrl.dispose();
    txtCategory.dispose();
    txtAvailable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                operationResult,
                style: TextStyle(
                    backgroundColor: Colors.green[200],
                    color: Colors.black),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtId,
                decoration: const InputDecoration(hintText: 'Insert ID'),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtName,
                decoration: const InputDecoration(hintText: 'Insert Pizza Name'),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtDescription,
                decoration: const InputDecoration(hintText: 'Insert Description'),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtPrice,
                decoration: const InputDecoration(hintText: 'Insert Price'),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtImageUrl,
                decoration: const InputDecoration(hintText: 'Insert Image Url'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtCategory,
                decoration: const InputDecoration(hintText: 'Insert Category'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtAvailable,
                decoration: const InputDecoration(hintText: 'Is Available? (true/false)'),
              ),
              const SizedBox(
                height: 48,
              ),

              ElevatedButton(
                  child: const Text('Send Post'),
                  onPressed: () {
                    postPizza();
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future postPizza() async {
    HttpHelper helper = HttpHelper();
    Pizza pizza = Pizza();
    pizza.id = int.tryParse(txtId.text) ?? 0;
    pizza.pizzaName = txtName.text;
    pizza.description = txtDescription.text;
    pizza.price = double.tryParse(txtPrice.text) ?? 0.0;
    pizza.imageUrl = txtImageUrl.text;
    pizza.category = txtCategory.text;
    pizza.isAvailable = txtAvailable.text.toLowerCase() == 'true';

    String result = await helper.postPizza(pizza);
    setState(() {
      operationResult = result;
    });
  }

}
