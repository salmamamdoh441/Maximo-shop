import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit/cubit.dart';
import '../../../business_logic/cubit/states.dart';
import '../../widget/login_toast.dart';
import '../../widget/products_builder.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is ShopChangeFavouritesSuccessState){
          if(!state.favoritesModel!.status!){
            defaultScaffoldToast(context: context,msg: state.favoritesModel!.message!);
          }

        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
            condition: AppCubit.get(context).homeModel != null &&
                AppCubit.get(context).categoriesModel != null,
            builder: (context) =>
                ProductsBuilder(AppCubit.get(context).homeModel,AppCubit.get(context).categoriesModel,context

                ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
