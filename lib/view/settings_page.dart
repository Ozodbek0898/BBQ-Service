
import 'package:bbq_service/controller/task_controller.dart';
import 'package:bbq_service/view/profile_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SettingsPage extends StatelessWidget {


  TaskController taskController=Get.put(TaskController());

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Sozlamalar',
          style: TextStyle(
            color: Colors.black
          ),),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: size.width*0.05,right: size.width*0.05,top: size.width*0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width*0.9,
              height: size.height*0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sizning Reytingingiz -${taskController.todayTaskDone()}',
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
                  Text("Batafsil ko'rish",
                    style: TextStyle(
                        color: Colors.white54,
                      fontSize: 12
                    ),
                  )
                ],
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF467352),
                borderRadius: BorderRadius.circular(10),

              ),

            ),
            SizedBox(height: size.height*0.02,),
            Container(
              height: size.height*0.03,
              child: Text("Hisob",
              style: TextStyle(
                color: Colors.black,
                fontSize: size.height*0.03,
                fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: size.height*0.02,),
            Container(
              height: size.height*0.05,
              child: Material(
                child: InkWell(
                  onTap: (){
                    Get.to(ProfileSettings());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person_outline,
                          size:  size.height*0.05,),
                          SizedBox(width: size.width*0.02,),
                          Text("Profil",
                            style: TextStyle(
                              fontSize: size.height*0.026
                            ),
                          )
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,
                      size:  size.height*0.03,)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height*0.04,),
            Container(
              height: size.height*0.03,
              child: Text("Ko'proq",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height*0.027,
                    fontWeight: FontWeight.bold
                ),),
            ),
            SizedBox(height: size.height*0.02,),
            Container(
              height: size.height*0.05,
              child: Material(
                child: InkWell(
                  onTap: (){

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star_border,
                            size:  size.height*0.05,),
                          SizedBox(width: size.width*0.02,),
                          Text("Ilovani baholang",
                            style: TextStyle(
                                fontSize: size.height*0.026
                            ),
                          )
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,
                        size:  size.height*0.03,)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height*0.04,),
            Container(
              height: size.height*0.05,
              child: Material(
                child: InkWell(
                  onTap: (){

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.help_outline,
                            size:  size.height*0.05,),
                          SizedBox(width: size.width*0.02,),
                          Text("Yordam",
                            style: TextStyle(
                                fontSize: size.height*0.026
                            ),
                          )
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,
                        size:  size.height*0.03,)
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
