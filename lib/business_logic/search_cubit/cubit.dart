import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/business_logic/search_cubit/states.dart';
import 'package:shopping_app/components/constants.dart';
import 'package:shopping_app/models/search_model.dart';
import 'package:shopping_app/network/end_points.dart';
import 'package:shopping_app/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);
  SearchModel? model;
  void search(String text){
    emit(SearchLoadingState());
    DioHelper.postData(url: SEARCH, data: {
      'text':text,
      'token':token
    }).then((value) {
      model=SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}