import 'dart:core';

class TodoModel {
  String content,contentNumber;
  int createDate;
  bool isDone;

  TodoModel({this.content, this.createDate, this.isDone,this.contentNumber});

  TodoModel.fromJson(Map<String,dynamic>json){
    content=json['content'];
    createDate=json['createDate'];
    isDone=json['isDone'] as bool;
    contentNumber=json['contentNumber'];
  }
  Map<String,dynamic>toJson(){
      final data=Map<String,dynamic>();
      data['createDate']=this.createDate;
      data['content']=this.content;
      data['isDone']=this.isDone;
      data['contentNumber']=this.contentNumber;
      return data;
  }
}