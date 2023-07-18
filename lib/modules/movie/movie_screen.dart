import 'package:flutter/material.dart';
class Movie {
  final String name;
  final String imge;
  Movie ({
    required this.name,
    required this.imge,
});
}
class movieScreen extends StatelessWidget {
   movieScreen({Key? key}) : super(key: key);
  List<Movie> movie=[
    Movie(name: 'james Mangold', imge: 'https://flxt.tmsimg.com/assets/68190_v9_bd.jpg',),
    Movie(name: 'Matt Demon', imge: 'https://flxt.tmsimg.com/assets/68190_v9_bd.jpg',),
    Movie(name: 'Ma Demon', imge: 'https://flxt.tmsimg.com/assets/68190_v9_bd.jpg',),
    Movie(name: 'Mat Demn', imge: 'https://flxt.tmsimg.com/assets/68190_v9_bd.jpg',),
    Movie(name: 'Matt Demon', imge: 'https://flxt.tmsimg.com/assets/68190_v9_bd.jpg',),
    Movie(name: 'james Mangold', imge: 'https://flxt.tmsimg.com/assets/68190_v9_bd.jpg',),
    Movie(name: 'Matt Demon', imge: 'https://flxt.tmsimg.com/assets/68190_v9_bd.jpg',),
    Movie(name: 'Ma Demon', imge: 'https://flxt.tmsimg.com/assets/68190_v9_bd.jpg',),
    Movie(name: 'Mat Demn', imge: 'https://flxt.tmsimg.com/assets/68190_v9_bd.jpg',),
    Movie(name: 'Matt Demon', imge: 'https://flxt.tmsimg.com/assets/68190_v9_bd.jpg',),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Stack(
            alignment:Alignment.bottomRight,
            children: [
              Container(
                height:MediaQuery.of(context).size.height*0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image:NetworkImage('https://m.media-amazon.com/images/M/MV5BM2UwMDVmMDItM2I2Yi00NGZmLTk4ZTUtY2JjNTQ3OGQ5ZjM2XkEyXkFqcGdeQXVyMTA1OTYzOTUx._V1_FMjpg_UX1000_.jpg'),fit:BoxFit.fitWidth),
                  borderRadius: BorderRadiusDirectional.only(bottomStart:Radius.circular(120.0))
                ),
              ),
              Positioned(
                top: 240,
                bottom:0,
                left: 50,
                right: 0,
                child: Container(

                  height: 100,
                  width: 300,

                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadiusDirectional.only(topStart:Radius.circular(40),bottomStart:Radius.circular(40.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 40,

                      ),
                    ]
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Icon(Icons.star,color: Colors.yellow,),
                              Text('8.2/100',style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Icon(Icons.star_purple500),
                              Text('Rate this',style: TextStyle(color: Colors.black),),
                            ],
                          ),
                        ),
                        Expanded(child: Column(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              color:Colors.green,
                              child: Text('86',style: TextStyle(color:Colors.white),),alignment: Alignment.center,
                            ),
                            SizedBox(height: 5,),
                            Text('MetaScore',style: TextStyle(color: Colors.black),),

                            
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Container(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=>Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:NetworkImage('${movie[index].imge}'),

                    ),
                    SizedBox(height: 10,),
                    Text('${movie[index].name}',)

                  ],
                ),
                separatorBuilder: (context,index)=>SizedBox(width: 10.0,),
                itemCount: movie.length),
          ),


        ],
      ),
    );
  }
}
