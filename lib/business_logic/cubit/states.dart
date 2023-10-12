import 'package:shopping_app/models/change_favourites_model.dart';

import '../../models/login_model.dart';

abstract class AppStates {}

class ShopLoginInitialState extends AppStates {}
class ShopLoginLoadingState extends AppStates {}
class ShopLoginSuccessState extends AppStates {
   final LoginModel shoppingModel;

  ShopLoginSuccessState(this.shoppingModel);
}
class ShopLoginErrorState extends AppStates {
  final String error;

  ShopLoginErrorState(this.error);
}


class ShopChangeAppModeState extends AppStates {}
class ShopChangeBottomNavState extends AppStates {}
class ShopHomeLoadingState extends AppStates {}
class ShopHomeSuccessState extends AppStates {}
class ShopHomeErrorState extends AppStates {}
class ShopCategoriesLoadingState extends AppStates{}
class ShopCategoriesSuccessState extends AppStates{}
class ShopCategoriesErrorState extends AppStates{}
class ShopFavouritesSuccessState extends AppStates{}
class ShopChangeFavouritesSuccessState extends AppStates{
  final FavoritesModel ?favoritesModel;

  ShopChangeFavouritesSuccessState(this.favoritesModel);
}
class ShopFavouritesErrorState extends AppStates{}
class ShopGetFavouritesSuccessState extends AppStates{}
class ShopGetFavouritesLoadingState extends AppStates{}
class ShopGetFavouritesErrorState extends AppStates{}
class ShopUserDataSuccessState extends AppStates{
  final LoginModel?loginModel;

  ShopUserDataSuccessState(this.loginModel);
}
class ShopUserDataLoadingState extends AppStates{}
class ShopUserDataErrorState extends AppStates{}

