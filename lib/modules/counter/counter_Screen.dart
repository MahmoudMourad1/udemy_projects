import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/modules/counter/cubit/cubit.dart';
import 'package:untitled1/modules/counter/cubit/states.dart';

class counterScreen extends StatelessWidget {
  const counterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create:(BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter '
              ),
            ),

            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){
                    CounterCubit.get(context).minus();

                  },
                      child: Text('Minus')),
                  Padding(padding: EdgeInsets.all(20)),
                  Text('${CounterCubit.get(context).counter}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Padding(padding: EdgeInsets.all(20)),
                  TextButton(onPressed: (){
                    CounterCubit.get(context).plus();

                  },
                      child: Text('Plus')
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
