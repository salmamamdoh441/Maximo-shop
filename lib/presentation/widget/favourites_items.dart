import 'package:flutter/material.dart';
import 'package:shopping_app/business_logic/cubit/cubit.dart';
import 'package:shopping_app/components/constants.dart';
import 'package:shopping_app/models/change_favourites_model.dart';
import 'package:shopping_app/models/search_model.dart';

class ProductItems extends StatelessWidget {
  String? image;
  String? name;
  int? id;
  dynamic price;
  dynamic oldPrice;
  num? discount;

  ProductItems({this.image, this.name, this.id,this.price,this.oldPrice,this.discount, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Container(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                    image!,
                  ),
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                if ((discount?? 0) != 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.red,
                    child: const Text(
                      'Discount',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold, height: 1.3),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        price.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                            color: Colors.blue),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if ((discount?? 0) != 0)
                        Text(
                          oldPrice.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                            color: Colors.grey,
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            AppCubit.get(context)
                                .changeFavourites(id!);
                          },
                          icon: CircleAvatar(
                            radius: 15,
                            backgroundColor:
                                AppCubit.get(context).favourites[id]!
                                    ? Colors.blue
                                    : Colors.grey,
                            child: const Icon(
                              Icons.favorite_border,
                              size: 20,
                              color: Colors.white,
                            ),
                          ))
                    ],
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
