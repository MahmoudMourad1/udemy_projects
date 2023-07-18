import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class home extends StatefulWidget {
   home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var scafoldkey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  int currentindex=0;


  bool isBottomsheetShown=false;
  IconData fabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldkey,
      appBar: AppBar(
        backgroundColor:Color(0xff321c59) ,
        shape: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10.0))),
        title: Text('ToDo aPp',style: TextStyle(color: Colors.white)),
        centerTitle:true,
      ),
        backgroundColor: Colors.transparent,
        floatingActionButton:FloatingActionButton(
          onPressed: (){
            if(isBottomsheetShown){
              if(formKey.currentState!.validate()){
                Navigator.pop(context);
                isBottomsheetShown =false;
                setState(() {
                  fabIcon= Icons.edit;
                });
              }


            }else{
              scafoldkey.currentState!.showBottomSheet((context) => Container(
                padding: EdgeInsets.all(20.0),
                color:Colors.transparent,
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
              ).closed.then((value) {
                isBottomsheetShown=false;
                setState(() {
                  fabIcon = Icons.edit;
                });

              });
              isBottomsheetShown=true;
              setState(() {
                fabIcon =Icons.add;
              });
              isBottomsheetShown =true;
              setState(() {
                fabIcon =Icons.add;
              });
            }

          },
          backgroundColor: Color(0xff321c59),
          child: Icon(fabIcon),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff321c59), Color(0xff000000)],
              stops: [0, 1],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )

          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0,top: 10.0),
                  child: Container(
                    child: ListView.separated(itemBuilder: (context,index){
                      return buildTasksItem();
                     },
                  separatorBuilder: (context,index){
                    return SizedBox(
                        height:15.0 );
                  },
                  itemCount: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff321c59),
        selectedItemColor: Color(0xff654f91) ,
        unselectedItemColor: Colors.white,
        items: const [
        BottomNavigationBarItem(icon:Icon(Icons.menu),label:'New Tasks'),
        BottomNavigationBarItem(icon:Icon(Icons.check_circle_outline),label:'Done Tasks'),
        BottomNavigationBarItem(icon:Icon(Icons.archive_outlined),label:'Archived Tasks'),
      ], onTap: (index){
        setState(() {
          currentindex= index;
        });

    },currentIndex: currentindex,
      ),

      );

  }
  Widget buildTasksItem()=> Container(
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
            const CircleAvatar(
              backgroundColor: Color(0xff654f91) ,
              radius: 30.0,
              child: Text('5:35 AM',style:TextStyle(fontSize: 15,color: Colors.white),),

            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Go to The Gym ',style: TextStyle(fontWeight:FontWeight.bold),),
                  Text('Dec 9 , 2023',style: TextStyle(color: Colors.grey),),

                ],
              ),
            ),
            SizedBox(
              width: 180,
            ),
            Row(
              children: [
                Icon(Icons.check_box,color: Colors.green,),
                Icon(Icons.archive,)
              ],

            )

          ],
        ),
      ),
    ),
  );

}
