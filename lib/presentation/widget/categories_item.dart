import 'package:flutter/material.dart';

import '../../models/categories_model.dart';

class CategoriesItem extends StatelessWidget {
  DataModel?model;
   CategoriesItem({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
              model!.image!,
            ),
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(model!.name!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
