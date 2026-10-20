
class StoreProduct {
  // 1. Fields (properties)
  String name;
  double price;
  int _stockQuantity; // Private field

  // 2. Constructor
  StoreProduct({
    required this.name,
    required this.price,
    required int stockQuantity,
  }) : _stockQuantity = stockQuantity;

  // 3. Getter to read the private field
  int get stockQuantity => _stockQuantity;

  // 4. Method to display product information
  void displayInfo() {
    print('Product: $name');
    print('Price: ₱${price.toStringAsFixed(2)}');
    print('Stock: $_stockQuantity');
  }

  // 5. Method to purchase a product
  bool purchase(int quantity) {
    if (quantity <= 0) {
      print('Please enter a valid quantity.');
      return false;
    }

    if (quantity > _stockQuantity) {
      print('Not enough stock for $name.');
      return false;
    }

    _stockQuantity -= quantity;
    print('Successfully purchased $quantity $name(s).');
    return true;
  }

  // 6. Method to add stock
  void restock(int quantity) {
    if (quantity <= 0) {
      print('Please enter a valid restock quantity.');
      return;
    }

    _stockQuantity += quantity;
    print('$name restocked by $quantity.');
  }
}

void main() {
  // Create at least two objects
  StoreProduct product1 = StoreProduct(
    name: 'Handmade Mug',
    price: 150.00,
    stockQuantity: 10,
  );

  StoreProduct product2 = StoreProduct(
    name: 'Woven Basket',
    price: 250.00,
    stockQuantity: 5,
  );

  // Store objects in a List
  List<StoreProduct> products = [product1, product2];

  // Display all products
  print('=== STORE PRODUCT LIST ===');

  for (StoreProduct product in products) {
    product.displayInfo();
    print('--------------------');
  }

  // Test purchasing a product
  print('\n=== PURCHASE TEST ===');
  product1.purchase(2);

  // Check updated stock
  print('Remaining stock: ${product1.stockQuantity}');

  // Test restocking
  print('\n=== RESTOCK TEST ===');
  product2.restock(3);
  print('Updated stock: ${product2.stockQuantity}');

  // Test insufficient stock
  print('\n=== INSUFFICIENT STOCK TEST ===');
  product2.purchase(20);
}
