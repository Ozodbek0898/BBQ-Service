import 'dart:convert';

import 'package:bbq_service/model/tasks.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'clients_controller.dart';

class TaskController extends GetxController {


  List<Tasks> tasks=[];
  String token="";



  getToken() async{

    SharedPreferences pref=await SharedPreferences.getInstance();
    token=pref.getString('token').toString();
    print("tkkkkk ${token}");
    // final store=FlutterSecureStorage();
    // var token=await store.read(key: 'token');
  }

  todayTaskIn(){
    int count=0;
    for(int i=0;i<tasks.length;i++){
      if(DateTime.parse(tasks[i].requiredTime.toString()).year==DateTime.now().year&&
          DateTime.parse(tasks[i].requiredTime.toString()).month==DateTime.now().month&&
          DateTime.parse(tasks[i].requiredTime.toString()).day==DateTime.now().day&&
          DateTime.parse(tasks[i].requiredTime.toString()).hour>DateTime.now().hour
          ){

        count++;

      }else if(DateTime.parse(tasks[i].requiredTime.toString()).year==DateTime.now().year&&
          DateTime.parse(tasks[i].requiredTime.toString()).month==DateTime.now().month&&
          DateTime.parse(tasks[i].requiredTime.toString()).day==DateTime.now().day&&
          DateTime.parse(tasks[i].requiredTime.toString()).hour==DateTime.now().hour){
        if(DateTime.parse(tasks[i].requiredTime.toString()).minute>DateTime.now().minute){
          count++;
        }
      }
    }
    return count;
  }
  todayTaskDone(){
    int count=0;
    for(int i=0;i<tasks.length;i++){
      if(tasks[i].status.toString().toLowerCase()=="done"){
        count++;

      }
    }
    return count;
  }

  getTask(int id) async{
    var url = Uri.parse(
        'http://Realtarget.uz/api/client_task/${id}');
    var res = await http.get(url,headers: {
      "Accept":"application/json",
      "Authorization":"Bearer ${token}"
    });
    print(res.statusCode);
    if(res.statusCode==200){
      var data = json.decode(res.body) as List;
      tasks=data.map((data) => Tasks.fromJson(data)).toList();
      print(tasks);

    }


  }


}
