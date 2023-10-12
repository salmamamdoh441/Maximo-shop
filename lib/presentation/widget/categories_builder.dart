import 'package:flutter/material.dart';

import '../../models/categories_model.dart';

class CategoriesBuilder extends StatelessWidget {
  BuildContext? context;
  DataModel?model;
   CategoriesBuilder({super.key, this.model,this.context});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 3),
            blurRadius: 1,
            color: Colors.grey.shade400,
          ),
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 1,
            offset: const Offset(-3, -3),
          ),
        ],
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
           Image(
            image: NetworkImage(
               model!.image!
            ),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          Container(
              width: double.infinity,
              color: Colors.black.withOpacity(0.8),
              child:  Text(
                model!.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
