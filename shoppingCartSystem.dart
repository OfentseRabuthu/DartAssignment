void main() {
  List<double> cartItems = [15.0, 25.0, 7.0, 50.0, 5.0];

  // Anonymous function to filter out items below $10
  cartItems = cartItems.where((item) => item >= 10).toList();

  print("Filtered Cart Items: \$${cartItems}");

  // Calculate total price with optional tax parameter
  double totalBeforeDiscount = calculateTotal(cartItems, tax: 0.08);

  print("Total Before Discount: \$${totalBeforeDiscount.toStringAsFixed(2)}");

  // Apply a discount of 10% to all items using a higher-order function
  List<double> discountedItems =
      applyDiscount(cartItems, (price) => price * 0.9);
  double totalAfterDiscount = calculateTotal(discountedItems, tax: 0.08);

  print("Total After 10% Discount: \$${totalAfterDiscount.toStringAsFixed(2)}");

  // Calculate special factorial discount based on number of items
  double factorialDiscountPercent =
      calculateFactorialDiscount(cartItems.length);
  double finalPrice =
      totalAfterDiscount * (1 - (factorialDiscountPercent / 100));

  print(
      "Final Price After Factorial Discount: \$${finalPrice.toStringAsFixed(2)}");
}

// Function to calculate total with optional tax parameter
double calculateTotal(List<double> prices, {double tax = 0.0}) {
  double total = prices.reduce((sum, item) => sum + item);
  return total * (1 + tax);
}

// Higher-order function to apply discount to each item
List<double> applyDiscount(
    List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).toList();
}

// Recursive function to calculate factorial discount based on number of items
double calculateFactorialDiscount(int n) {
  if (n <= 1) {
    return 1.0;
  }
  return n * calculateFactorialDiscount(n - 1);
}
