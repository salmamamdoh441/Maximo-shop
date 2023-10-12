import 'package:flutter/material.dart';

import '../../models/home_model.dart';

class GridProduct extends StatelessWidget {
  HomeModel? model;

   GridProduct({this.model,super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(
            model!.data!.products.length,
                (index) => Column(
              children: [
                Image(
                    image: NetworkImage(model!.data!.products[index].image!))
              ],
            )));
  }
}
