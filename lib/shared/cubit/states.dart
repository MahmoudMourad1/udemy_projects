import 'package:bloc/bloc.dart';

abstract class AppStates {}

class AppIntialState extends AppStates{}
class AppChangeBottomNavBarState extends AppStates {}
class AppCreateDataBase extends AppStates{}
class AppGetDataBase extends AppStates{}
class AppUpdateDataBase extends AppStates{}
class AppDeleteDataBase extends AppStates{}
class AppInsertIntoDataBase extends AppStates{}
class AppChangeBottomSheetState extends AppStates {}
