const keyId = 'id';
const keyName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImage = 'imageUrl';
const keyCategory = 'category';
const keyAvailable = 'isAvailable';

class Pizza {
  int id = 0;
  String pizzaName = "";
  String description = "";
  double price = 0.0;
  String imageUrl = "";
  String category = "";
  bool isAvailable = true;

  Pizza();

  Pizza.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json[keyId]?.toString() ?? '') ?? 0;
    pizzaName = json[keyName]?.toString() ?? 'No name';
    description = json[keyDescription]?.toString() ?? '';
    price = double.tryParse(json[keyPrice]?.toString() ?? '') ?? 0.0;
    imageUrl = json[keyImage]?.toString() ?? '';
    category = json[keyCategory]?.toString() ?? 'Uncategorized';
    isAvailable = (json[keyAvailable]?.toString() == 'true');
  }

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
      keyCategory: category,
      keyAvailable: isAvailable
    };
  }
}
