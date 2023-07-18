import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';

class newTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context , state){},
      builder: (context,state){
        var task = AppCubit.get(context).NewTasks;
        return ConditionalBuilder(builder: (context) =>ListView.separated(itemBuilder: (context , index){
          return buildTasksItem(task[index],context);
        },
            separatorBuilder: (context, index){
              return SizedBox(
                height: 10.0,
              );
            },
            itemCount: task.length ),
          condition: task.length>0,
          fallback: (context){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Icon(Icons.menu,color: Colors.white,
                ),
                Text('Please Add Some Tasks' , style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold,fontSize: 16.0),)
              ],
            ),
          );

          },
        );
      },

    );
  }
  Widget buildTasksItem(Map model,context)=> Dismissible(
    key: Key(model ['id'].toString()),
    child: Container(
      height: 100.0,
      decoration: BoxDecoration(borderRadius:BorderRadius.only(topLeft: Radius.circular(8.0),bottomLeft:Radius.circular(8.0) )
        ,color: Color(0xff654f91),
      ),
      child: Container(

        color: Color(0xfffcf9f5),
        margin: EdgeInsets.only(
            left: 4.0
        ),
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: [
               CircleAvatar(
                backgroundColor: Color(0xff654f91) ,
                radius: 30.0,
                 child: Text('${model ['time']}',style:TextStyle(fontSize: 15,color: Colors.white),),

              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${model['title']} ',style: TextStyle(fontWeight:FontWeight.bold),),
                    Text('${model ['date']}',style: TextStyle(color: Colors.grey),),

                  ],
                ),
              ),
              SizedBox(
                width: 100,
              ),
              Row(
                children: [
                  IconButton(onPressed: (){
                    AppCubit.get(context).updateData(status: 'Done', id: model['id']);

                  },
                      icon:Icon(Icons.check_box,color: Colors.green,)),
                  IconButton(onPressed: (){
                    AppCubit.get(context).updateData(status: 'Archived', id: model['id']);

                  },
                      icon:Icon(Icons.archive,color: Colors.black,)),
                ],

              )

            ],
          ),
        ),
      ),
    ),
    onDismissed: (direction){
      AppCubit.get(context).deleteData(id:model ['id']);


    },
  );

}
