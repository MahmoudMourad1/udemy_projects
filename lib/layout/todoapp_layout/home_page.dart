import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled1/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:untitled1/modules/done_tasks/done_tasks_screen.dart';
import 'package:untitled1/modules/new_tasks/new_tasks_screen.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class homePage extends StatelessWidget
{


  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..creatdatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
       listener: (context, state) {
         if(state is AppInsertIntoDataBase){
           Navigator.pop(context);
         }
       },
        builder: (context, state) {
         AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: ScaffoldKey,
            appBar:AppBar(
              backgroundColor:Color(0xff321c59) ,
              shape: OutlineInputBorder(borderRadius:BorderRadius.only(bottomLeft:Radius.circular(40.0),bottomRight: Radius.circular(40.0))),
              title:Text (cubit.Titles[cubit.currentindex]),
              centerTitle:true,
            ) ,
            backgroundColor: Colors.transparent,
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                if(cubit.isBottomSheetShown){
                  if(formKey.currentState!.validate()){
                    cubit.insterTOdatabase(title: titleController.text, time: timeController.text, date: dateController.text);

                  }
                }
                else{

                  ScaffoldKey.currentState!.showBottomSheet((context) => Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: titleController,
                            decoration: InputDecoration(
                              labelText: 'Task Title',
                              border:OutlineInputBorder(),
                              prefix: Icon(Icons.title),
                            ),
                            validator:(String? value){
                              if(value!.isEmpty){
                                return 'Title is not be empty';
                              }
                              return null;

                            },
                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(

                            controller: timeController,
                            decoration: InputDecoration(
                              labelText: 'Task Time',
                              border:OutlineInputBorder(),
                              prefix: Icon(Icons.watch_later_outlined),
                            ),
                            validator:(String? value){
                              if(value!.isEmpty){
                                return 'Time is not be empty';
                              }
                              return null;

                            },
                            onTap: () {
                              showTimePicker(context: context, initialTime: TimeOfDay?.now()).then((value) {
                                timeController.text=value!.format(context);

                              });

                            },
                            textAlign:TextAlign.start,



                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(

                            controller: dateController,
                            decoration: InputDecoration(
                              labelText: 'Task Date',
                              border:OutlineInputBorder(),
                              prefix: Icon(Icons.watch_later_outlined),
                            ),
                            validator:(String? value){
                              if(value!.isEmpty){
                                return 'Date is not be empty';
                              }
                              return null;

                            },
                            onTap: () {
                              showDatePicker(context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.utc(2023),
                                  lastDate: DateTime.utc(2024)).then((value){
                                dateController.text=DateFormat.yMMMd().format(value!);
                              });
                            },
                            textAlign:TextAlign.start,



                          ),
                        ],
                      ),
                    ),
                  ),
                      elevation: 20.0).closed.then((value){
                    cubit.changeBottomSheet(isShow:false,
                        icon:Icons.edit
                    );

                  });
                  cubit.changeBottomSheet(isShow:true,
                      icon:Icons.add
                  );




                }

              },
              backgroundColor: Color(0xff321c59),
              child:  Icon(cubit.Fabicon,),),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xff321c59),
              selectedItemColor: Color(0xff654f91) ,
              unselectedItemColor: Colors.white,
              items:const [
              BottomNavigationBarItem(icon:Icon(Icons.menu),label:'New Tasks'),
              BottomNavigationBarItem(icon:Icon(Icons.check_circle_outline),label:'Done Tasks'),
              BottomNavigationBarItem(icon:Icon(Icons.archive_outlined),label:'Archived Tasks'),
            ],onTap:(index){
              cubit.changeIndex(index);
            },
              currentIndex:cubit.currentindex,
            ),
            body:Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff321c59), Color(0xff000000)],
                    stops: [0, 1],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  )

              ),
              child: ConditionalBuilder(condition: true,
                  builder: (context)=> cubit.Screens[cubit.currentindex],
                  fallback: (context)=> Center(child:CircularProgressIndicator(),)
              ),
            ),
          );
        },

      ),
    );


  }


}






