import 'package:flutter/material.dart';
import 'package:restro_app/presentation/model/cart_item_model.dart';

class FoodDetailPage extends StatefulWidget {
  final String foodName;
  final String price;
  final String imageUrl;
  final bool isVeg;
  final String foodDescription;


  const FoodDetailPage({
    super.key,
    required this.foodName,
    required this.price,
    required this.imageUrl,
    required this.isVeg,
    required this.foodDescription,

  });

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;
  bool isFavorite = false;

  List<CartItem> cart = [];
  String selectedOption = 'Delivery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.foodName),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(widget.imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.foodName,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                    Text(
                      widget.price,
                      style: const TextStyle(fontSize: 20, color: Colors.deepOrange, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  widget.isVeg ? Icons.eco : Icons.fastfood,
                  color: widget.isVeg ? const Color.fromARGB(255, 121, 85, 72) : const Color.fromARGB(255, 121, 85, 72),
                ),
                const SizedBox(width: 5),
                Text(
                  widget.isVeg ? "Vegetarian" : "Non-Vegetarian",
                  style: TextStyle(fontSize: 16, color: widget.isVeg ? const Color.fromARGB(255, 121, 85, 72) : const Color.fromARGB(255, 121, 85, 72)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              widget.foodDescription,
              style: const TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Quantity", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Color.fromARGB(255, 37, 34, 34)),
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                    Text("$quantity", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.add, color: Color.fromARGB(255, 28, 28, 27)),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Choose Delivery Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOptionCard('Delivery', Icons.local_shipping),
                _buildOptionCard('Pickup', Icons.store),
                _buildOptionCard('Dining In', Icons.restaurant),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    cart.add(CartItem(foodName: widget.foodName, price: widget.price, quantity: quantity, imageUrl: ''));
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Added to cart sucessfully",textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                
                child: const Text("Add to Cart", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(String option, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
      },
      child: Card(
        color: selectedOption == option ? Colors.deepOrange : Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: selectedOption == option ? Colors.white : Colors.deepOrange),
              const SizedBox(height: 8),
              Text(
                option,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: selectedOption == option ? Colors.white : Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
