import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/components/constants.dart';

import '../../business_logic/cubit/cubit.dart';
import '../../models/categories_model.dart';
import '../../models/home_model.dart';
import 'categories_builder.dart';
import 'grid_product.dart';

class ProductsBuilder extends StatelessWidget {
  BuildContext? context;
  HomeModel? model;
  CategoriesModel? categoriesModel;
  // ProductModel?productModel;

  ProductsBuilder(
      // this.productModel,
      this.model,
      this.categoriesModel,
      this.context,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: model!.data!.banners
                .map((e) => Image(
                      image: NetworkImage('${e.image}'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
                height: 250,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 0.8,
                scrollDirection: Axis.horizontal),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 100,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CategoriesBuilder(
                            model: categoriesModel!.data!.data[index],
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 15,
                          ),
                      itemCount: categoriesModel!.data!.data.length),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'New Products',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 8,
                childAspectRatio: 1 / 1.75,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(
                    model!.data!.products.length,
                    (index) => Container(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomStart,
                                children: [
                                  Image(
                                    image: NetworkImage(
                                      model!.data!.products[index].image!,
                                    ),
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  if (model!.data!.products[index].discount !=
                                      0)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      color: Colors.red,
                                      child: const Text(
                                        'DISCOUNT',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model!.data!.products[index].name!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          height: 1.3),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${model!.data!.products[index].price.round()!}',
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
                                        if (model!.data!.products[index]
                                                .discount !=
                                            0)
                                          Text(
                                            '${model!.data!.products[index].oldPrice.round()!}',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
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
                                                  .changeFavourites(model!.data!
                                                      .products[index].id!);
                                              print(token);
                                            },
                                            icon: CircleAvatar(
                                              radius: 15,
                                              backgroundColor:
                                                  AppCubit.get(context)
                                                              .favourites[
                                                          model!
                                                              .data!
                                                              .products[index]
                                                              .id]!
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
                        ))),
          )
        ],
      ),
    );
  }
}
