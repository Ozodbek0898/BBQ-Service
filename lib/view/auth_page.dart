

import 'package:bbq_service/view/navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 30),
            child: Text(
              'Kirish',
              style: TextStyle(
                  color: Colors.black
              ),
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
                        borderSide:
                        BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(17))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(17)))),
              ),
              SizedBox(height: 20,),
              TextField(
                obscureText: true,
                key: ValueKey('Parol'),
                onChanged: (value) {},
                decoration: InputDecoration(
                  labelStyle:  TextStyle(color: Colors.black38),
                    labelText: 'Parol',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 17, horizontal: 27),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(17)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(17))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(17)))),
              ),
              SizedBox(height: 10,),
              InkWell(
                child: Text('Parolni unutdingizmi?',
                style: TextStyle(
                  color: Colors.lightBlue
                ),),
              ),
              SizedBox(height: 150,),

              RaisedButton(
                onPressed: () {
                  Get.to(NavigationBar());
                },
                child: Container(
                  height: 50,

                  child: Center(
                    child: Text(
                      'Kirish',
                      style: TextStyle(
                          color: Colors.white
                      ),
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
