
import 'dart:convert';
import 'package:bbq_service/controller/task_controller.dart';
import 'package:bbq_service/model/clients.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ClientsController extends GetxController{
  TaskController taskController=Get.put(TaskController());

  final url="http://Realtarget.uz/api/clients";
  late String email;
  late String pass;
  List<Clients> clients=[];
  late String userName="";
  late String userSurname="";
  late int userId=0;
  late String userAddress="";
  late String beginNamaz="";
  late String dateBirth="";



   String token='';

   setAuth(String email,String pass){
    this.email=email;
    this.pass=pass;
  }

  getToken() async{

    SharedPreferences pref=await SharedPreferences.getInstance();
     token=pref.getString('token').toString();
    print("tkkkkk ${token}");

    // final store=FlutterSecureStorage();
    // var token=await store.read(key: 'token');
  }

  void getClient()  {
     print("dsfsd");
     for(int i=0;i<clients.length;i++){
      if(email.contains(clients[i].email.toString())&&clients[i].password==pass){
        userName = clients[i].name.toString();
        userSurname= clients[i].lastName.toString();
        userId=clients[i].id!;
        userAddress=clients[i].address.toString();
        beginNamaz =clients[i].beginNamaz.toString();
        dateBirth=clients[i].birthday.toString();
        print(clients[i].name);
        print(clients[i].lastName);
        print(clients[i].address);
        print(clients[i].beginNamaz);
        print(clients[i].birthday);
        print(userId);
        taskController.getTask(userId);


      }
     }


  }

void fetchPost() async{
  var res = await http.get(Uri.parse(url),headers: {
    "Accept":"application/json",
    "Authorization":"Bearer ${token}"
  });
  print(res.statusCode);
  print(res.body);
  print("get tok ${getToken()}");
  if (res.statusCode == 200) {
    var data = json.decode(res.body) as List;
    clients=data.map((data) => Clients.fromJson(data)).toList();
    print(clients[0].email);
    getClient();





  }
  print(clients.length);
}


}