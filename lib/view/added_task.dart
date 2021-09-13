

import 'package:bbq_service/view/edit_task_page.dart';
import 'package:bbq_service/view/navigation_bar.dart';
import 'package:bbq_service/view/tasks_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddedTask extends StatelessWidget {
  const AddedTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,

        color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: size.height*0.3,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(20),

                height: size.height*0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Topshiriq qo'shildi!",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,),
                    SizedBox(height: size.height*0.03,),
                    Text("Operator siz ko'rsatgan vaqtda eslatadi."),
                    SizedBox(height: size.height*0.03,),
                    RaisedButton(
                      onPressed: () {
                        Get.off(EditTaskPage());
                      },
                      child: Container(
                        width: size.width*0.6,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Yangi qo'shish",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.blue,
                    ),
                    SizedBox(height: size.height*0.03,),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(splashFactory: InkSplash.splashFactory,
                        onTap: (){
                        Get.off(NavigationBar());
                        },
                        child: Text('Asosiy oynaga qaytish',
                          style: TextStyle(
                              color: Colors.blue
                          ),),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height*0.3,),
            ],
          )
        )

      ),
    );
  }
}
