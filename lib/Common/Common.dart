import 'dart:math';
import 'package:intl/intl.dart';
const TODO_REF='Todo';

int createTodoNumber(int timeOffcset){
  return timeOffcset+new Random().nextInt(1900);
}

String convertDate(int date)=>DateFormat('dd-MM-yyyy HH:mm')
    .format(DateTime.fromMillisecondsSinceEpoch(date));