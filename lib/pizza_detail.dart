import 'package:flutter/material.dart';
import 'package:store_data_hilmi/httphelper.dart';
import 'package:store_data_hilmi/model/pizza.dart';

class PizzaDetailScreen extends StatefulWidget {
  final Pizza pizza;
  final bool isNew;

  const PizzaDetailScreen({
    super.key,
    required this.pizza,
    required this.isNew,
  });

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

final txtId = TextEditingController();
final txtName = TextEditingController();
final txtDescription = TextEditingController();
final txtPrice = TextEditingController();
final txtImageUrl = TextEditingController();
final txtCategory = TextEditingController();
final txtAvailable = TextEditingController();

String operationResult = '';

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  @override
  void initState() {
    if (!widget.isNew) {
      txtId.text = widget.pizza.id.toString();
      txtName.text = widget.pizza.pizzaName;
      txtDescription.text = widget.pizza.description;
      txtPrice.text = widget.pizza.price.toString();
      txtImageUrl.text = widget.pizza.imageUrl;
      txtCategory.text = widget.pizza.category;
      txtAvailable.text = widget.pizza.isAvailable.toString();
    }
    super.initState();
  }

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
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              _buildTextField(txtId, 'Insert ID'),
              _buildTextField(txtName, 'Insert Pizza Name'),
              _buildTextField(txtDescription, 'Insert Description'),
              _buildTextField(txtPrice, 'Insert Price'),
              _buildTextField(txtImageUrl, 'Insert Image URL'),
              _buildTextField(txtCategory, 'Insert Category'),
              _buildTextField(txtAvailable, 'Is Available? (true/false)'),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: savePizza,
                child: Text(widget.isNew ? 'Add Pizza' : 'Update Pizza'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hint),
      ),
    );
  }

  Future<void> savePizza() async {
    HttpHelper helper = HttpHelper();
    Pizza pizza = Pizza();
    pizza.id = int.tryParse(txtId.text) ?? 0;
    pizza.pizzaName = txtName.text;
    pizza.description = txtDescription.text;
    pizza.price = double.tryParse(txtPrice.text) ?? 0.0;
    pizza.imageUrl = txtImageUrl.text;
    pizza.category = txtCategory.text;
    pizza.isAvailable = txtAvailable.text.toLowerCase() == 'true';

    final result = await (widget.isNew
        ? helper.postPizza(pizza)
        : helper.putPizza(pizza));

    setState(() {
      operationResult = result;
    });
  }
}
