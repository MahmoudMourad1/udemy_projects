import 'package:flutter/material.dart';

class Chats {
  final String imge ;
  final String name ;
  final String ChatTitle ;
  Chats ({
    required this.imge,
    required this.name,
    required this.ChatTitle,
  });

}
class whatsappScreen extends StatelessWidget {
  const whatsappScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff128C7E),
          title: Text('WhatsApp',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),),
          bottom: TabBar(tabs:[
            Tab(text: 'Chats',),
            Tab(text: 'Status',),
            Tab(text: 'Calls',),

          ],
          ),
          actions: [
            Icon(Icons.search),
            PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              itemBuilder: (context) {
                return [
                  // In this case, we need 5 popupmenuItems one for each option.
                  const PopupMenuItem(child: Text('New Group')),
                  const PopupMenuItem(child: Text('New Broadcast')),
                  const PopupMenuItem(child: Text('Linked Devices')),
                  const PopupMenuItem(child: Text('Starred Messages')),
                  const PopupMenuItem(child: Text('Settings')),
                ];
              },
            ),
          ],
        ),
        body:  TabBarView(
          children: [
            Chattab(),

          ]
        ),

        



      ),
    );
  }
}
class Chattab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Chats> chats = [
      Chats(imge: 'https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-1/328124078_1900418853637649_7937638312654439914_n.jpg?stp=dst-jpg_p160x160&_nc_cat=100&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeHO9S-3M8BCJ4dHkykKX8h43OjruCXtVBvc6Ou4Je1UG2ZjcdksLSgqNxCcl5VhLM-NXyeQIzUUsRlx4-hywcJs&_nc_ohc=7-S9TB3pzYYAX8o23jf&_nc_ht=scontent.fcai20-3.fna&oh=00_AfApAC5jbr__ImtHl8uOLkfQtipWbEBOv82ZwIuA0O3O5g&oe=642B412F', name: 'Mahmoud Mourad', ChatTitle: 'Miss u bro hangout ?'),
      Chats(imge: 'https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-1/328124078_1900418853637649_7937638312654439914_n.jpg?stp=dst-jpg_p160x160&_nc_cat=100&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeHO9S-3M8BCJ4dHkykKX8h43OjruCXtVBvc6Ou4Je1UG2ZjcdksLSgqNxCcl5VhLM-NXyeQIzUUsRlx4-hywcJs&_nc_ohc=7-S9TB3pzYYAX8o23jf&_nc_ht=scontent.fcai20-3.fna&oh=00_AfApAC5jbr__ImtHl8uOLkfQtipWbEBOv82ZwIuA0O3O5g&oe=642B412F', name: 'Mahmoud Mourad', ChatTitle: 'Miss u bro hangout ?'),
      Chats(imge: 'https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-1/328124078_1900418853637649_7937638312654439914_n.jpg?stp=dst-jpg_p160x160&_nc_cat=100&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeHO9S-3M8BCJ4dHkykKX8h43OjruCXtVBvc6Ou4Je1UG2ZjcdksLSgqNxCcl5VhLM-NXyeQIzUUsRlx4-hywcJs&_nc_ohc=7-S9TB3pzYYAX8o23jf&_nc_ht=scontent.fcai20-3.fna&oh=00_AfApAC5jbr__ImtHl8uOLkfQtipWbEBOv82ZwIuA0O3O5g&oe=642B412F', name: 'Mahmoud Mourad', ChatTitle: 'Miss u bro hangout ?'),
      Chats(imge: 'https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-1/328124078_1900418853637649_7937638312654439914_n.jpg?stp=dst-jpg_p160x160&_nc_cat=100&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeHO9S-3M8BCJ4dHkykKX8h43OjruCXtVBvc6Ou4Je1UG2ZjcdksLSgqNxCcl5VhLM-NXyeQIzUUsRlx4-hywcJs&_nc_ohc=7-S9TB3pzYYAX8o23jf&_nc_ht=scontent.fcai20-3.fna&oh=00_AfApAC5jbr__ImtHl8uOLkfQtipWbEBOv82ZwIuA0O3O5g&oe=642B412F', name: 'Mahmoud Mourad', ChatTitle: 'Miss u bro hangout ?'),
      Chats(imge: 'https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-1/328124078_1900418853637649_7937638312654439914_n.jpg?stp=dst-jpg_p160x160&_nc_cat=100&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeHO9S-3M8BCJ4dHkykKX8h43OjruCXtVBvc6Ou4Je1UG2ZjcdksLSgqNxCcl5VhLM-NXyeQIzUUsRlx4-hywcJs&_nc_ohc=7-S9TB3pzYYAX8o23jf&_nc_ht=scontent.fcai20-3.fna&oh=00_AfApAC5jbr__ImtHl8uOLkfQtipWbEBOv82ZwIuA0O3O5g&oe=642B412F', name: 'Mahmoud Mourad', ChatTitle: 'Miss u bro hangout ?'),

    ];
    return Scaffold(
      body:Container(
        padding: EdgeInsetsDirectional.only(top: 5.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-1/328124078_1900418853637649_7937638312654439914_n.jpg?stp=dst-jpg_p160x160&_nc_cat=100&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeHO9S-3M8BCJ4dHkykKX8h43OjruCXtVBvc6Ou4Je1UG2ZjcdksLSgqNxCcl5VhLM-NXyeQIzUUsRlx4-hywcJs&_nc_ohc=7-S9TB3pzYYAX8o23jf&_nc_ht=scontent.fcai20-3.fna&oh=00_AfApAC5jbr__ImtHl8uOLkfQtipWbEBOv82ZwIuA0O3O5g&oe=642B412F'),
                  radius: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Mahmoud Mourad', style:TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),

                            Text('test test test test ', style: TextStyle(fontSize: 15,color: Colors.grey),textAlign:TextAlign.start,overflow:TextOverflow.ellipsis,),
                          ],
                        ),
                      ),
                      SizedBox(width: 70.0,),
                      Container(

                        child: Text('6:34 AM',style: TextStyle(fontSize: 20.0,),),
                      )
                    ],
                  ),
                ),


              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-1/328124078_1900418853637649_7937638312654439914_n.jpg?stp=dst-jpg_p160x160&_nc_cat=100&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeHO9S-3M8BCJ4dHkykKX8h43OjruCXtVBvc6Ou4Je1UG2ZjcdksLSgqNxCcl5VhLM-NXyeQIzUUsRlx4-hywcJs&_nc_ohc=7-S9TB3pzYYAX8o23jf&_nc_ht=scontent.fcai20-3.fna&oh=00_AfApAC5jbr__ImtHl8uOLkfQtipWbEBOv82ZwIuA0O3O5g&oe=642B412F'),
                  radius: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Mahmoud Mourad', style:TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),

                            Text('test test test test ', style: TextStyle(fontSize: 15,color: Colors.grey),textAlign:TextAlign.start,overflow:TextOverflow.ellipsis,),
                          ],
                        ),
                      ),
                      SizedBox(width: 70.0,),
                      Container(

                        child: Text('6:34 AM',style: TextStyle(fontSize: 20.0,),),
                      )
                    ],
                  ),
                ),


              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-1/328124078_1900418853637649_7937638312654439914_n.jpg?stp=dst-jpg_p160x160&_nc_cat=100&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeHO9S-3M8BCJ4dHkykKX8h43OjruCXtVBvc6Ou4Je1UG2ZjcdksLSgqNxCcl5VhLM-NXyeQIzUUsRlx4-hywcJs&_nc_ohc=7-S9TB3pzYYAX8o23jf&_nc_ht=scontent.fcai20-3.fna&oh=00_AfApAC5jbr__ImtHl8uOLkfQtipWbEBOv82ZwIuA0O3O5g&oe=642B412F'),
                  radius: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Mahmoud Mourad', style:TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),

                            Text('test test test test ', style: TextStyle(fontSize: 15,color: Colors.grey),textAlign:TextAlign.start,overflow:TextOverflow.ellipsis,),
                          ],
                        ),
                      ),
                      SizedBox(width: 70.0,),
                      Container(

                        child: Text('6:34 AM',style: TextStyle(fontSize: 20.0,),),
                      )
                    ],
                  ),
                ),


              ],
            ),
          ],


        ),
      ),

    );
  }
Widget buildChatItem ()=>Column(
  children: [
    Row(
      children: [
        CircleAvatar(
          backgroundColor:Colors.blue,
          radius: 30.0,
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mahmoud Mourad', style:TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),

                    Text('asdkjaslkasdasd asd asdasd asd asd sdj ', style: TextStyle(fontSize: 15,color: Colors.grey),textAlign:TextAlign.start,overflow:TextOverflow.ellipsis,),
                  ],
                ),
              ),
              SizedBox(width: 70.0,),
              Container(

                child: Text('6:34 AM',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,),),
              )
            ],
          ),
        ),


      ],
    )
  ],
);

}

