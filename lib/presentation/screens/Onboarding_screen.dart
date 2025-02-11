import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:restro_app/presentation/screens/login_page.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          buildPage(
            title: "Welcome to Foodies!",
            body:
                "Foodies is your ultimate destination for discovering and ordering delicious meals from top restaurants near you. Experience hassle-free food ordering with a few simple taps.",
          ),
          buildPage(
            title: "Fast & Reliable Delivery",
            body:
                "Our efficient delivery system ensures that your meals arrive fresh and hot. Track your order in real-time and enjoy a seamless dining experience at your doorstep.",
          ),
          buildPage(
            title: "Exciting Offers & Rewards",
            body:
                "Enjoy exclusive discounts, cashback offers, and reward points on every order. Earn points and redeem them for exciting deals on your favorite meals.",
          ),
          buildPage(
            title: "Secure & Easy Payments",
            body:
                "Pay conveniently using multiple payment options, including credit/debit cards, UPI, and cash on delivery. Your transactions are secure with our advanced encryption technology.",
          ),
        ],
        globalBackgroundColor: const Color.fromARGB(255, 226, 214, 204),
        done: const Text(
          "Start",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.deepOrange,
          ),
        ),
        onDone: () => goToHome(context),
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        next: const Icon(Icons.arrow_forward, size: 24, color: Colors.deepOrange),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(30.0, 10.0),
          activeColor: Colors.deepOrange,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 5.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }

  /// 📌 Helper function to create pages
  PageViewModel buildPage({required String title, required String body}) {
    return PageViewModel(
      titleWidget: Padding(
        padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      bodyWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Text(
          body,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: pageDecoration(),
    );
  }

  /// 📌 Page Style
  PageDecoration pageDecoration() {
    return const PageDecoration(
      titlePadding: EdgeInsets.only(top: 10),
      contentMargin: EdgeInsets.symmetric(horizontal: 20),
      fullScreen: true,
    );
  }

  void goToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
