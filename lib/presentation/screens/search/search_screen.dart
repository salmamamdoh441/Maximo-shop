import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/business_logic/search_cubit/states.dart';
import 'package:shopping_app/presentation/widget/default_form_field.dart';

import '../../../business_logic/search_cubit/cubit.dart';
import '../../widget/favourites_items.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    children: [
                      DefaultFormField(
                          onChange: (String? text) {
                            SearchCubit.get(context).search(text!);
                          },
                          controller: searchController,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'enter text to search';
                            }
                            return null;
                          },
                          prefix: Icons.search,
                          label: 'Search'),
                      const SizedBox(height: 20,),
                      if(state is SearchLoadingState)
                      const LinearProgressIndicator(),
                      if(searchController.text.isNotEmpty && state is! SearchLoadingState)
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => ProductItems(
                            image:SearchCubit.get(context).model!.data!.data![index].image ,
                              name: SearchCubit.get(context).model!.data!.data![index].name,
                              id: SearchCubit.get(context).model!.data!.data![index].id,
                              price:SearchCubit.get(context).model!.data!.data![index].price ,
                              oldPrice:SearchCubit.get(context).model!.data!.data![index].oldPrice ,
                              discount:SearchCubit.get(context).model!.data!.data![index].discount ,
                              ),
                          separatorBuilder: (context, index) => const  Divider(),
                          itemCount:SearchCubit.get(context).model!.data!.data!.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
