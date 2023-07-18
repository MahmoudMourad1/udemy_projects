import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit () : super (counterIntialState());
  static CounterCubit get(context) => BlocProvider.of(context);
  int counter = 1;
  void minus (){
    counter -- ;
    emit(counterminus());
  }
  void plus (){
    counter ++ ;
    emit(counterPlus() );
  }

}