import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled1/modules/done_tasks/done_tasks_screen.dart';
import 'package:untitled1/shared/cubit/states.dart';

import '../../modules/archived_tasks/archived_tasks_screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super (AppIntialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentindex=0;

  List<Widget> Screens = [
    newTasksScreen(),
    doneTasksScreen(),
    archivedTasksScreen(),

  ];
  List<String> Titles=[
    'New Tasks',
    'Done Tasks',
    'Archived Tasks'
  ];
void changeIndex (index) {
  currentindex =  index ;
  emit(AppChangeBottomNavBarState());

}
  Database? database;
  List <Map> NewTasks =[];
  List <Map> Donetasks =[];
  List <Map> Archivetasks =[];
  void creatdatabase() {
     openDatabase(
        'todo2.db',
        version: 1,

        onCreate:(database,version){
          print('Database created');
          database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY , title TEXT , date TEXT ,time TEXT ,status TEXT)').then((value){
            print('Table Created');
          }).catchError((error){
            print('error${error.toString()}');
          });
        },
        onOpen: (database){
          getDataFromDataBase(database);
          print('Database opened');
        }
    ).then((value) {
      database = value;
      emit(AppCreateDataBase());
     });
  }
  void updateData({
    required String status,
    required int id
})
  {
      database?.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id,]).then((value){
          getDataFromDataBase(database);

          emit(AppUpdateDataBase());
      });


  }
  void deleteData({
    required int id,
  }) async {

    database?.rawDelete(
        'DELETE FROM tasks WHERE id = ?', [id]
    ).then((value) {
      getDataFromDataBase(database);
      emit(AppDeleteDataBase());
    });
  }
  insterTOdatabase({required title,required time,required date}) async{
    await database?.transaction((txn){
      txn.rawInsert('INSERT INTO tasks(title,date,time,status) VALUES("${title}","${date}","${time}","New")')
          .then((value){print('$value Insertd to database');
            getDataFromDataBase(database);
            emit(AppInsertIntoDataBase());


          })
          .catchError((error){print('error${error.toString()}');});
      return Future.value(null);


    });
  }
  void getDataFromDataBase(database)

  {
    NewTasks=[];
    Donetasks=[];
    Archivetasks=[];

    emit(AppGetDataBase());
     database!.rawQuery('SELECT * FROM tasks').then((value){
       print(NewTasks);
       value.forEach((element) {
         if(element ['status'] == 'New')

           NewTasks.add(element);
         else if (element ['status'] == 'Done')
           Donetasks.add(element);
         else
           Archivetasks.add(element);

       });


     });


    ;

  }
  bool isBottomSheetShown= false;
  IconData Fabicon = Icons.edit;
void changeBottomSheet ({
  @required bool? isShow ,
  @required IconData? icon ,}){
  isBottomSheetShown = isShow!;
  Fabicon = icon!;
  emit(AppChangeBottomSheetState());
}

}