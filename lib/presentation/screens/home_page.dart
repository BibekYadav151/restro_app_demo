import 'package:flutter/material.dart';
// import 'package:restro_app/presentation/model/cart_item_model.dart';
import 'package:restro_app/presentation/model/food_item_model.dart';
import 'package:restro_app/presentation/screens/cart_page.dart';
import 'package:restro_app/presentation/screens/food_detail_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  String selectedCategory = 'Food'; // Default category

  final List<FoodItem> allFoodItems = [
    FoodItem(
      name: 'Veg Pizza',
      price: '₹250',
      imageUrl: 'assets/images/vegpizza.png',
      isVeg: true,
      description: 'A delicious vegetarian pizza topped with fresh vegetables and cheese.',
    ),
    FoodItem(
      name: 'Chicken Biryani',
      price: '₹300',
      imageUrl: 'assets/images/chickenbiryani.jpg',
      isVeg: false,
      description: 'A flavorful chicken biryani with fragrant rice and tender chicken pieces.',
    ),
    FoodItem(
      name: 'Veg momo',
      price: '₹300',
      imageUrl: 'assets/images/momoveg.jpg',
      isVeg: true,
      description: 'A flavorful chicken biryani with fragrant rice and tender chicken pieces.',
    ),
    FoodItem(
      name: 'Veg momo',
      price: '₹300',
      imageUrl: 'assets/images/momoveg.jpg',
      isVeg: true,
      description: 'A flavorful chicken biryani with fragrant rice and tender chicken pieces.',
    ),
    FoodItem(
      name: 'Mix Veg Fry',
      price: '₹300',
      imageUrl: 'assets/images/mixveg.jpg',
      isVeg: true,
      description: 'A flavorful chicken biryani with fragrant rice and tender chicken pieces.',
    ),
    FoodItem(
      name: 'Paneer Fry',
      price: '₹300',
      imageUrl: 'assets/images/paneerfry.jpg',
      isVeg: true,
      description: 'A flavorful chicken biryani with fragrant rice and tender chicken pieces.',
    ),
    FoodItem(
      name: 'Veg Burger',
      price: '₹150',
      imageUrl: 'assets/images/vegburger.jpg',
      isVeg: true,
      description: 'A classic veg burger made with a patty of fresh vegetables and sauces.',
    ),
    FoodItem(
      name: 'Mutton Kebab',
      price: '₹350',
      imageUrl: 'assets/images/muttonkabab.png',
      isVeg: false,
      description: 'Juicy mutton kebabs cooked to perfection with aromatic spices.',
    ),
    FoodItem(
      name: 'Kima Noodles',
      price: '₹200',
      imageUrl: 'assets/images/keemanoduls.png',
      isVeg: false,
      description: 'Noodles stir-fried with minced meat and a blend of spices.',
    ),
    FoodItem(
      name: 'Chicken Pizza',
      price: '₹350',
      imageUrl: 'assets/images/chickenpizza.jpg',
      isVeg: false,
      description: 'A savory chicken pizza with cheese and a tangy sauce.',
    ),
    FoodItem(
      name: 'Chicken Pizza',
      price: '₹350',
      imageUrl: 'assets/images/chickenpizza.jpg',
      isVeg: false,
      description: 'A savory chicken pizza with cheese and a tangy sauce.',
    ),
    FoodItem(
      name: 'Chicken Biryani',
      price: '₹300',
      imageUrl: 'assets/images/chickenbiryani.jpg',
      isVeg: false,
      description: 'A flavorful chicken biryani with fragrant rice and tender chicken pieces.',
    ),
     // Drinks items
  FoodItem(
    name: 'Mango Milkshake',
    price: '₹50',
    imageUrl: 'assets/images/mango.png',
    isVeg: true,
    description: 'A refreshing soft drink to go with your meal.',
  ),
  FoodItem(
    name: 'Orange Juice',
    price: '₹80',
    imageUrl: 'assets/images/orange.jpg',
    isVeg: true,
    description: 'Freshly squeezed orange juice full of vitamins.',
  ),
  FoodItem(
    name: 'Cold Coffee',
    price: '₹120',
    imageUrl: 'assets/images/coldcoffee.png',
    isVeg: true,
    description: 'Iced coffee with milk and a rich, creamy texture.',
  ),
];
  

  List<FoodItem> getFilteredFoodItems() {
    if (selectedCategory == 'Food') {
      return allFoodItems; // Show all food items
    } else if (selectedCategory == 'Veg') {
      return allFoodItems.where((food) => food.isVeg).toList();
    } else if (selectedCategory == 'Non-Veg') {
      return allFoodItems.where((food) => !food.isVeg).toList();
    } else if (selectedCategory == 'Drinks') {
      return allFoodItems.where((food) => food.name == 'Mango Milkshake' || food.name == 'Orange Juice' || food.name == 'Cold Coffee').toList(); // Add drinks when available
    }
    


    return allFoodItems;
  }

  @override
  Widget build(BuildContext context) {
    List<FoodItem> filteredFoodItems = getFilteredFoodItems();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Restaurant Menu'),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () { 
              Navigator.push(
               context,
               MaterialPageRoute(
                builder: (context) => CartPage(),
             ),
            );

              
              // Navigate to the cart screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 232, 231, 230),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 238, 238, 238).withOpacity(0.5),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for food...',
                    hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                    prefixIcon: const Icon(Icons.search, color: Colors.deepOrange, size: 24),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Category Chips
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  categoryChip('Food'),
                  categoryChip('Drinks'),
                  categoryChip('Non-Veg'),
                  categoryChip('Veg'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Food Grid
            Expanded(
              child: filteredFoodItems.isEmpty
                  ? const Center(child: Text('No items available'))
                  : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: filteredFoodItems.length,
                      itemBuilder: (context, index) {
                        final foodItem = filteredFoodItems[index];
                        return foodItemWidget(context, foodItem);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryChip(String label) {
    bool isSelected = selectedCategory == label;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
        selected: isSelected,
        onSelected: (bool selected) {
          setState(() {
            selectedCategory = label;
          });
        },
        selectedColor: Colors.deepOrange,
        backgroundColor: Colors.deepOrange.shade100,
      ),
    );
  }

  Widget foodItemWidget(BuildContext context, FoodItem foodItem) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailPage(
              foodName: foodItem.name,
              price: foodItem.price,
              imageUrl: foodItem.imageUrl,
              isVeg: foodItem.isVeg,
              foodDescription: foodItem.description,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                foodItem.imageUrl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(foodItem.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(foodItem.price, style: const TextStyle(fontSize: 14, color: Colors.black54)),
                  const SizedBox(height: 5),
                  Text(
                    foodItem.isVeg ? 'Veg' : 'Non-Veg',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: foodItem.isVeg ? const Color.fromARGB(255, 121, 120, 116) : const Color.fromARGB(255, 121, 120, 116),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

