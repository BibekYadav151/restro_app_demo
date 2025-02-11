import 'package:flutter/material.dart';

class CartItem {
  String name;
  double price;
  String imageUrl;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });
}

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(name: 'Veg Pizza', price: 250, imageUrl: 'assets/images/vegpizza.png', quantity: 1),
    CartItem(name: 'Chicken Biryani', price: 300, imageUrl: 'assets/images/chickenbiryani.jpg', quantity: 2),
    CartItem(name: 'Cold Coffee', price: 120, imageUrl: 'assets/images/coldcoffee.png', quantity: 1),
  ];

  String selectedPaymentMethod = '';

  double getTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Cart', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(item.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
                      ),
                      title: Text(item.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      subtitle: Text('₹${item.price.toStringAsFixed(2)} x ${item.quantity}',
                          style: const TextStyle(fontSize: 14, color: Colors.black54)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                if (item.quantity > 1) {
                                  item.quantity--;
                                } else {
                                  cartItems.removeAt(index);
                                }
                              });
                            },
                          ),
                          Text('${item.quantity}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                            onPressed: () {
                              setState(() {
                                item.quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(thickness: 1),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const Text('Select Payment Method:',
            //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Row(
            //             children: [
            //               Radio(
            //                 value: 'UPI',
            //                 groupValue: selectedPaymentMethod,
            //                 onChanged: (value) {
            //                   setState(() {
            //                     selectedPaymentMethod = value.toString();
            //                   });
            //                 },
            //               ),
            //               const Text('UPI')
            //             ],
            //           ),
            //           Row(
            //             children: [
            //               Radio(
            //                 value: 'Card',
            //                 groupValue: selectedPaymentMethod,
            //                 onChanged: (value) {
            //                   setState(() {
            //                     selectedPaymentMethod = value.toString();
            //                   });
            //                 },
            //               ),
            //               const Text('Credit/Debit Card')
            //             ],
            //           ),
            //           Row(
            //             children: [
            //               Radio(
            //                 value: 'COD',
            //                 groupValue: selectedPaymentMethod,
            //                 onChanged: (value) {
            //                   setState(() {
            //                     selectedPaymentMethod = value.toString();
            //                   });
            //                 },
            //               ),
            //               const Text('Cash on Delivery')
            //             ],
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('₹${getTotalPrice().toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Sucessfully Order Placed $selectedPaymentMethod',textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child:
                const Text('Checkout', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
