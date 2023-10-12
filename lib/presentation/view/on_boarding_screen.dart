import 'package:flutter/material.dart';

import '../screens/login/login_screen.dart';
import '../screens/on_boarding/on_boarding_screen.dart';
import '../widget/on_boarding_items.dart';

class OnBoardingScreen extends StatefulWidget {

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/Wavy_Bus-17_Single-09.jpg',
      title: 'Welcome to our Shopping App!',
      body: 'We are excited to have you join our community of savvy shoppers',
    ),
    BoardingModel(
      image: 'assets/images/5247.jpg',
      title: 'Discover Amazing Products:',
      body:
      'Explore a vast collection of products across various categories, from fashion and electronics to home decor and more.',
    ),
    BoardingModel(
      image: 'assets/images/20943930.jpg',
      title: 'Effortless Shopping:',
      body:
      'stores. With our Shopping App, you can browse, compare, and purchase products with just a few taps. ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var boardController = PageController();

    bool isLast = false;

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false,
                );
              },
              child: const Text(
                'SKIP',
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: 100,
                child: PageView.builder(
                  controller: boardController,
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                      print('last');
                    } else {
                      print('Not Last');
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                  OnBoardingItems(),
                  itemCount: boarding.length,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                            (route) => false,
                      );
                    } else {
                      boardController.nextPage(
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.fastEaseInToSlowEaseOut);
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios_outlined),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
