import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../network/local/cache_helper.dart';
import '../../view/login_screen.dart';

class BoardingModel {
  final String? image;
  final String? title;
  final String? body;
  BoardingModel({this.image, this.title, this.body});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/Wavy_Bus-17_Single-09.jpg',
      title: 'Welcome to our Shopping App!',
      body: 'We are excited to have you join our community of savvy shoppers',
    ),
    BoardingModel(
      image: 'assets/images/5247.jpg',
      title: 'Discover Amazing Products:',
      body: 'Explore a vast collection of products across various categories, from fashion and electronics to home decor and more.',
    ),
    BoardingModel(
      image: 'assets/images/20943930.jpg',
      title: 'Effortless Shopping:',
      body: 'stores. With our Shopping App, you can browse, compare, and purchase products with just a few taps. ',
    ),
  ];
  bool isLast = false;
  void submit(){
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) =>  LoginScreen()),
              (route) => false,
        );
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: submit,
              child: const Text('SKIP',style: TextStyle(fontSize: 16),))
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
                        buildBoardingItem(boarding[index]),
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
                      submit();
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

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}',),fit: BoxFit.cover,
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
            '${model.title}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            '${model.body}',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis,),
            maxLines: 2,
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      );
}
