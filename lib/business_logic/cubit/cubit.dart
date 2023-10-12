import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/business_logic/cubit/states.dart';

import '../../components/constants.dart';
import '../../models/categories_model.dart';
import '../../models/change_favourites_model.dart';
import '../../models/home_model.dart';
import '../../models/home_model.dart';
import '../../models/login_model.dart';
import '../../network/end_points.dart';
import '../../network/local/cache_helper.dart';
import '../../network/remote/dio_helper.dart';
import '../../presentation/screens/categories/categories_screen.dart';
import '../../presentation/screens/favourite/favourite_screen.dart';
import '../../presentation/screens/products/products_screen.dart';
import '../../presentation/screens/setting/setting_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(ShopLoginInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  LoginModel? shoppingModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {'email': email, 'password': password},
    ).then((value) {
      print(value.data);
      shoppingModel = LoginModel.fromJson(value.data);
      CacheHelper.saveData(key: 'token', value: shoppingModel!.data!.token);
      print(shoppingModel!.data!.token);
      print(shoppingModel!.message);
      print(shoppingModel!.status);
      emit(ShopLoginSuccessState(shoppingModel!));
    }).onError((error, StackTrace) {
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }
  

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ShopChangeAppModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(ShopChangeAppModeState());
      });
    }
  }

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavouriteScreen(),
     SettingsScreen(),
  ];
  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;
  Map<int, bool> favourites = {};
  void getHomeData() {
    emit(ShopHomeLoadingState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      printFullText(homeModel.toString());
      print(homeModel!.data!.banners[0].image);
      homeModel!.data!.products.forEach((element) {
        favourites.addAll({element.id!: element.inFavorites!});
      });

      emit(ShopHomeSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ShopHomeErrorState());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategoriesData() {
    DioHelper.getData(url: CATEGORIES, token: token).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      printFullText(categoriesModel.toString());
      print(categoriesModel!.data);

      emit(ShopCategoriesSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ShopCategoriesErrorState());
    });
  }
  FavoritesModel?favoritesModel;
  void changeFavourites(int productId) {
    favourites[productId]=!favourites[productId]!;
    emit(ShopFavouritesSuccessState());

    DioHelper.postData(
        url: FAVOURITES, data: {'product_id': productId}, token: token).then((value){
      favoritesModel=FavoritesModel.fromJson(value.data);
      print(value.data);
      if(!favoritesModel!.status!){
        favourites[productId]=!favourites[productId]!;

      }
      else{
        getFavouritesData();
      }
          emit(ShopChangeFavouritesSuccessState(favoritesModel));

    }).onError((error, stackTrace) {
      favourites[productId]=!favourites[productId]!;

      emit(ShopFavouritesErrorState());

    });
  }
  FavoritesModel? favModel;

  void getFavouritesData() {
    emit(ShopGetFavouritesLoadingState());
    DioHelper.getData(url: FAVOURITES, token: token).then((value) {
      favModel = FavoritesModel.fromJson(value.data);
      printFullText(favModel.toString());
      print(favModel!.data);

      emit(ShopGetFavouritesSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ShopGetFavouritesErrorState());
    });
  }
  LoginModel?loginModel;
  void getUserData() {
    emit(ShopUserDataLoadingState());
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      printFullText(loginModel!.data!.name);
      print(loginModel!.data);

      emit(ShopUserDataSuccessState(loginModel));
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ShopUserDataErrorState());
    });
  }
}
