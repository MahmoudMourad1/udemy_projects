import 'package:flutter/material.dart';

class massenger extends StatelessWidget {
  const massenger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 20.0,
            backgroundImage:NetworkImage('https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-6/328124078_1900418853637649_7937638312654439914_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHO9S-3M8BCJ4dHkykKX8h43OjruCXtVBvc6Ou4Je1UG2ZjcdksLSgqNxCcl5VhLM-NXyeQIzUUsRlx4-hywcJs&_nc_ohc=cYXs_6TZNdoAX8wiKVJ&_nc_ht=scontent.fcai20-3.fna&oh=00_AfBlk-e6IQJCSobv-5dDDTfJ9ow0KVqffyRmvd_rzpg9Lw&oe=6441D26D') ,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Chat',
              style: TextStyle(color: Colors.black,fontSize:30.0 , fontWeight:FontWeight.bold),

            ),
          ],
        ),
        actions: [
          CircleAvatar(
            
            radius: 18.0,
            child:Icon(Icons.camera_alt,color: Colors.white,),
            

          ),
          SizedBox(
            width: 10.0,
          ),
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 18.0,
            child: Icon(Icons.edit,color: Colors.white,),

          ),
          SizedBox(
            width: 10.0,

          ),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                
                height: 30.0,
                decoration:BoxDecoration(color: Colors.grey[300],borderRadius:BorderRadius.all(Radius.circular(5.0))),

                child: Row(
                  children: [
                    Icon(Icons.search),
                    Text('search',style: TextStyle(color:Colors.black),)
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(itemBuilder:(context,index){
                  return buildStoryItem();
                },separatorBuilder:(context ,indes) => SizedBox(width: 10.0,)
                  ,itemCount:10,
                scrollDirection:Axis.horizontal,shrinkWrap: true,),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                  shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context , index){
                return buildChatItem();
              },
                  separatorBuilder: (context , index){
                return SizedBox(
                  height:10.0 ,
                );
                  },
                  itemCount: 20 ),

            ],
          ),
        ),
      ),
      
    );
  }
  Widget buildStoryItem ()=> Container(
    width:70.0,
    child: Column(

      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 20.0,
              backgroundImage:NetworkImage('https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-6/328124078_1900418853637649_7937638312654439914_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHO9S-3M8BCJ4dHkykKX8h43OjruCXtVBvc6Ou4Je1UG2ZjcdksLSgqNxCcl5VhLM-NXyeQIzUUsRlx4-hywcJs&_nc_ohc=cYXs_6TZNdoAX8wiKVJ&_nc_ht=scontent.fcai20-3.fna&oh=00_AfBlk-e6IQJCSobv-5dDDTfJ9ow0KVqffyRmvd_rzpg9Lw&oe=6441D26D') ,
            ),
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 7.0,

            ),
          ],
        ),
        Text('Mahmoud Morad',maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),

      ],
    ),
  );
  Widget buildChatItem ()=> Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 20.0,
            backgroundImage:NetworkImage('https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-6/328124078_1900418853637649_7937638312654439914_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHO9S-3M8BCJ4dHkykKX8h43OjruCXtVBvc6Ou4Je1UG2ZjcdksLSgqNxCcl5VhLM-NXyeQIzUUsRlx4-hywcJs&_nc_ohc=cYXs_6TZNdoAX8wiKVJ&_nc_ht=scontent.fcai20-3.fna&oh=00_AfBlk-e6IQJCSobv-5dDDTfJ9ow0KVqffyRmvd_rzpg9Lw&oe=6441D26D') ,
          ),
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 7.0,

          ),
        ],
      ),
      SizedBox(width: 10.0,),
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text('Mahmoud Mourad',overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text('enta faaan ya abaa enta faaan ya abaa enta faaan ya abaa enta faaan ya abaa ',overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[600],
                ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),

              Text('2:00 AM')

            ],
          )
        ],
      ),
      )

    ],
  );
}
