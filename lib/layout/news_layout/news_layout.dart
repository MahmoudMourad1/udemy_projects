import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/news_layout/cubit/cubit.dart';
import 'package:untitled1/layout/news_layout/cubit/states.dart';
import 'package:untitled1/modules/search_screen/search_screen.dart';
import 'package:untitled1/shared/components/components.dart';

class newsScreen extends StatelessWidget {
  const newsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {

      },
      builder:
          (context, state) {
            var cubit = NewsCubit.get(context);
            return Scaffold(
        appBar: AppBar(
          title: Text(
              'News App'
          ),
          actions: [
            IconButton(icon: Icon(Icons.search),
              onPressed: (){
              NavigateTo(context, searchScreen());
              },)
          ],
        ),
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items:cubit.bottomItems,
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.changeBottomNavBar(index);

          },
        ),
      );
          },

    );
  }
}
