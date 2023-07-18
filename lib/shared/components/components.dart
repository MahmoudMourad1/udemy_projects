
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/modules/webview_screen/webview_screen.dart';

Widget defaultButton ({
  required double width ,
  required Color background ,
  required String text,
  required Function? function,


  double radius = 0.0
}) => Container(
width: width,
height: 40.0,
child: MaterialButton(
  onPressed :(){
    function!();
  }  ,
child: Text( text.toUpperCase() ,
style: TextStyle(
color: Colors.white
),
),

),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius,),
    color: background,


  ),
);
Widget defaultFormField({
  required TextEditingController  controller,
  required TextInputType type,
  final Function? onSubmit,
  final Function? onChange,
  required Function validate,
  required String label,
  required IconData prefix,
  final Function? onTap,


}) => TextFormField(
  controller: controller,
  keyboardType: type,
  onFieldSubmitted:(value){
    onSubmit!(value);
  },
  onChanged: (value){
    onChange!(value);
  },
  onTap: (){
    onTap!();
  },
  validator: (value){
    validate(value);
  },
  decoration: InputDecoration(
    labelText: label,

    prefixIcon: Icon(
        prefix,
    ),
    border: OutlineInputBorder(),
  ),

);

Widget BuildArticleItem(article,context) => InkWell(
  onTap: (){
    NavigateTo(context, webviewScreen(article['url']));

  },
  child:   Padding(

  padding: const EdgeInsets.all(20.0),

  child: Row(

  children: [

  Container(

  width: 120.0,

  height: 120.0,

  decoration: BoxDecoration(borderRadius:BorderRadius.circular(10.0),

  image:DecorationImage(

  image: NetworkImage('${article['urlToImage']}'),

  fit: BoxFit.cover

  )

  ),

  ),

  SizedBox(width: 20.0,),

  Expanded(

  child: Container(

  height: 120.0,

  child: Column(

  mainAxisAlignment: MainAxisAlignment.start,

  crossAxisAlignment: CrossAxisAlignment.start,

  children: [

  Expanded(

  child: Text(

  '${article['title']}',

  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),overflow:TextOverflow.ellipsis,maxLines: 4,),

  ),

  SizedBox(height: 10.0,),

  Text(

  '${article['publishedAt']}',

  style: TextStyle(fontSize: 10.0,color: Colors.grey),),

  ],



  ),

  ),

  )



  ],

  ),

  ),
);
Widget articleBuilder(list,context,{isSearch = false})=>ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context)=> ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index){
          return BuildArticleItem(list[index],context);
        },
        separatorBuilder: (context,index)=>SizedBox(height: 10.0,),
        itemCount: 10),
    fallback: (context)=>isSearch ? Container() : Center(child: CircularProgressIndicator()));

void NavigateTo (context, widget) => Navigator.push(context,
    MaterialPageRoute(builder:(context)=>widget ));
