import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/news_layout/cubit/states.dart';
import 'package:untitled1/modules/business_screen/business_screen.dart';
import 'package:untitled1/modules/science_screen/science_screen.dart';
import 'package:untitled1/modules/sports_screen/sports_screen.dart';
import 'package:untitled1/shared/network/remote/dio_helper.dart';

import '../../../modules/settings_screen/settings_screen.dart';

class NewsCubit extends Cubit<NewsStates>{

NewsCubit() : super (NewsInitialState());

static NewsCubit get(context) => BlocProvider.of(context);

int currentIndex= 0 ;
List<Widget> screens = [
  BusinessScreen(),
  SportsScreen(),
  ScienceScreen(),
  SettingsScreen(),
];

List<BottomNavigationBarItem> bottomItems = [
  BottomNavigationBarItem(icon:Icon(Icons.business),label: 'Business'),
  BottomNavigationBarItem(icon:Icon(Icons.sports_score_sharp),label: 'Sports'),
  BottomNavigationBarItem(icon:Icon(Icons.science),label: 'Science'),

];
void changeBottomNavBar (int index){
  currentIndex = index;
  if(index ==1 ){
    getsports();
  }
  if(index ==2 ){
    getscience();
  }
  emit(NewsBottomNavState());
}

List<dynamic> business = [];

void getBusiness(){
  emit(NewsGetBusinessLoadingState());
  DioHelper.getData(url: 'v2/top-headlines',
      query: {
      'country': 'us',
        'category':'business',
        'apikey':'f57dcf2cc5254ba7aa0dfeb8bda29318',
    }).then((value){
      // print(value.data['articles'][0]['title']);
      business= value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());

  }).catchError((error){
    print(error.toString());
    emit(NewsGetBusinessErrorState());

  });
}

List<dynamic> sports = [];

void getsports(){
  emit(NewsGetSportsLoadingState());
  if(sports.length == 0){
    DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category':'sports',
          'apikey':'f57dcf2cc5254ba7aa0dfeb8bda29318',
        }).then((value){
      // print(value.data['articles'][0]['title']);
      sports= value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsErrorState());

    });
  }
  else{
    emit(NewsGetSportsSuccessState());
  }

}

List<dynamic> science = [];

void getscience(){
  emit(NewsGetScienceLoadingState());
  if(science.length == 0){
    DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category':'science',
          'apikey':'f57dcf2cc5254ba7aa0dfeb8bda29318',
        }).then((value){
      // print(value.data['articles'][0]['title']);
      science= value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState());

    });
  }else{
    emit(NewsGetScienceSuccessState());
  }

}

List<dynamic> search = [];

void getsearch(String value){
  emit(NewsGetSearchLoadingState());
  DioHelper.getData(url: 'v2/everything',
      query: {
        'q':'$value',
        'apikey':'f57dcf2cc5254ba7aa0dfeb8bda29318',
      }).then((value){
    // print(value.data['articles'][0]['title']);
    search= value.data['articles'];
    print(search[0]['title']);
    emit(NewsGetSearchSuccessState());

  }).catchError((error){
    print(error.toString());
    emit(NewsGetSearchErrorState());

  });


}





}