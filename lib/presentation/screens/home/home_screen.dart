import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/components/constants.dart';
import 'package:shopping_app/presentation/screens/login/login_screen.dart';

import '../../../business_logic/cubit/cubit.dart';
import '../../../business_logic/cubit/states.dart';
import '../search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (BuildContext context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    print(token);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchScreen()));
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ))
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottom(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favourite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
