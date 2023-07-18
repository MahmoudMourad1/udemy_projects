import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/news_layout/cubit/cubit.dart';
import 'package:untitled1/layout/news_layout/cubit/states.dart';
import 'package:untitled1/shared/components/components.dart';

class searchScreen extends StatelessWidget {
  searchScreen({Key? key}) : super(key: key);
  var SearchController =TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){

      },
      builder: (context,state){
        var list  = NewsCubit.get(context).search;
        return Scaffold(

          appBar: AppBar(

            iconTheme: IconThemeData(color: Colors.black),

          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: defaultFormField(controller: SearchController,
                  type: TextInputType.text,
                  onChange: (value){
                  NewsCubit.get(context).getsearch(value);
                  },
                  validate: (String value){
                    if(value!.isEmpty){
                      return ('Search Must not be empty');
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(child: articleBuilder(list,context,isSearch: true))

            ],
          ),
        );
      },
    );
  }
}
