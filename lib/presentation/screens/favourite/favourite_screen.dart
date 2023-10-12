
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/presentation/widget/favourites_items.dart';

import '../../../business_logic/cubit/cubit.dart';
import '../../../business_logic/cubit/states.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return ConditionalBuilder(
          condition: state is! ShopGetFavouritesLoadingState,
          fallback: (context)=>const Center(child: CircularProgressIndicator()),
          builder:(context)=> ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ProductItems(
                  image:AppCubit.get(context).favModel!.data!.data![index].product!.image ,
                  name: AppCubit.get(context).favModel!.data!.data![index].product!.name,
                  id: AppCubit.get(context).favModel!.data!.data![index].product!.id,
                  price:AppCubit.get(context).favModel!.data!.data![index].product!.price ,
                  oldPrice:AppCubit.get(context).favModel!.data!.data![index].product!.oldPrice ,
                  discount:AppCubit.get(context).favModel!.data!.data![index].product!.discount ,

                  ),
              separatorBuilder: (context, index) => const  Divider(),
              itemCount:AppCubit.get(context).favModel!.data!.data!.length,
              ),
        );
      },

    );
  }
}