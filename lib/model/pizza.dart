class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza.fromJson(Map<String, dynamic> json):
        id = int.tryParse(json['id']?.toString() ?? '') ?? 0,
        pizzaName = (json['pizzaName'] != null)
            ? json['pizzaName'].toString()
            : 'No name',
        description = (json['description'] != null)
            ? json['description'].toString()
            : '',
        price = double.tryParse(json['price']?.toString() ?? '') ?? 0,
        imageUrl = json['imageUrl']?.toString() ?? '';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl
    };
  }
}
