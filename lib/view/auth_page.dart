import 'dart:convert';
import 'package:bbq_service/controller/clients_controller.dart';
import 'package:bbq_service/controller/task_controller.dart';
import 'package:bbq_service/view/navigation_bar.dart';
import 'package:bbq_service/view/tasks_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class AuthPage extends StatefulWidget {

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  ClientsController controller=Get.put(ClientsController());
  TaskController taskController=Get.put(TaskController());
  bool isloading = false;
  bool hider=false;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  signIn(String email, String pass) async {
    var url = Uri.parse(
        'http://Realtarget.uz/sanctum/token');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map body={"email":email,"password":pass,"device_name":"Samsung"};
    var jsonResponse;
    var res = await http.post(url,body: body);
    print(res.statusCode);
    if (res.statusCode == 200) {
      jsonResponse = res.body;

      if (jsonResponse != '') {
        setState(() {
          isloading = false;
        });
        prefs.setString("token", jsonResponse.toString());

        controller.setAuth(email, pass);
        controller.getToken();
        taskController.getToken();



        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => NavigationBar()),
                (Route<dynamic> route) => false);
      } else {
        setState(() {
          isloading = false;
          hider=true;
        });
      }
    }else{
      setState(() {
        hider=true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 30),
            child: Text(
              'Kirish',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                controller: email,
                key: ValueKey('Login'),
                onChanged: (value) {},
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black38),
                    labelText: 'Login',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 17, horizontal: 27),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(17)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(17))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.lightBlueAccent, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(17)))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: pass,
                obscureText: true,
                key: ValueKey('Parol'),
                onChanged: (value) {},
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black38),
                    labelText: 'Parol',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 17, horizontal: 27),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(17)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(17))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.lightBlueAccent, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(17)))),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(visible: hider,
                  child: Text("Login yoki parol xato",
              style: TextStyle(color: Colors.red),)),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: Text(
                  'Parolni unutdingizmi?',
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    isloading = true;
                  });
                  signIn(email.text, pass.text);
                },
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Kirish',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.lightBlueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
