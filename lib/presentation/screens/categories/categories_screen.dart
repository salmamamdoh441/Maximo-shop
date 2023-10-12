import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../business_logic/cubit/cubit.dart';
import '../../../business_logic/cubit/states.dart';
import '../../widget/categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>  CategoriesItem(model: AppCubit.get(context).categoriesModel!.data!.data[index]),
            separatorBuilder: (context, index) => const  Divider(),
            itemCount: AppCubit.get(context).categoriesModel!.data!.data.length);
      },

    );
  }
}
