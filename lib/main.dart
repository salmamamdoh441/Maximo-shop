import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/presentation/screens/home/home_screen.dart';
import 'package:shopping_app/presentation/screens/login/login_screen.dart';
import 'package:shopping_app/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:shopping_app/styles/themes.dart';

import 'business_logic/bloc_observer.dart';
import 'business_logic/cubit/cubit.dart';
import 'business_logic/cubit/states.dart';
import 'components/constants.dart';
import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.int();
  bool? isDark = CacheHelper.getData(key: 'isDark') ?? true;
  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding') ?? true;
  token = CacheHelper.getData(key: 'token') ;
  if (onBoarding != null) {
    if (token != null) {
      widget = const HomeScreen();
    } else {
      widget = LoginScreen();
    }

  } else {
    widget = OnBoardingScreen();
  }

  print(onBoarding);
  runApp(ShopApp(isDark!,widget));
}

class ShopApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;
  const ShopApp(this.isDark, this.startWidget, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (
        BuildContext context,
      ) =>
          AppCubit()..changeAppMode(fromShared: isDark)..getHomeData()..getCategoriesData()..getFavouritesData()..getUserData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            home: startWidget,
          );
        },
      ),
    );
  }
}
