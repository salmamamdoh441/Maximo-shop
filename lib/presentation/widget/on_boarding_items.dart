import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../screens/on_boarding/on_boarding_screen.dart';

class OnBoardingItems extends StatelessWidget {
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
  BoardingModel? model;
  OnBoardingItems({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    var boardController = PageController();

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(
              '${model!.image}',
            ),
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: SmoothPageIndicator(
            controller: boardController,
            count: boarding.length,
            effect: const ExpandingDotsEffect(
                dotColor: Colors.grey,
                dotHeight: 10,
                expansionFactor: 6,
                dotWidth: 5,
                spacing: 5),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '${model!.title}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          '${model!.body}',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 2,
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
