import 'package:bbq_service/controller/clients_controller.dart';
import 'package:bbq_service/controller/task_controller.dart';
import 'package:bbq_service/model/tasks.dart';
import 'package:bbq_service/view/edit_task_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'load_task.dart';

class TasksPage extends StatelessWidget {
  TaskController controller = Get.put(TaskController());

  DateTime nowDate=DateTime.now();

  setColor(int minute){
      if(minute<nowDate.minute+5&&minute>nowDate.minute){
        return Color(0xFFf5d3d3);
      }else if(minute<nowDate.minute+15&&minute>nowDate.minute+5){
        return Color(0xFFffaecd9);
      }else if(minute>nowDate.minute+30){
        return Color(0xFFcbf0f5);
      }else return 0xFFcbf0f5;
  }

  setColorText(int minute){
    if(minute<nowDate.minute+5&&minute>nowDate.minute){
      return Colors.red;
    }else if(minute<nowDate.minute+15&&minute>nowDate.minute+5){
      return Colors.orange;
    }else if(minute>nowDate.minute+30){
      return Colors.blue;
    }else return Colors.blue;
  }

  Future<Null> refreshList() async{
    await Future.delayed(Duration(seconds: 2));
  }
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    if(controller.tasks.length==0){
      return Scaffold(
        body: RefreshIndicator(
          onRefresh: ()async{
            Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (a,b,c)=>TasksPage(),
                transitionDuration: Duration(seconds: 2))
            );
          },
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              SizedBox(height: size.height*0.2 ,),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/undraw.png'),
                    SizedBox(height: 10,),
                    Container(
                      width: 200,
                      child: Text("Sizda hozircha "
                          "topshiriqlar yo'q",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20

                        ),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 200,
                      child: Text("Yangi maqsadlar va muvofiq topshiriqlar qo'shing",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15

                        ),),
                    ),
                    SizedBox(height: 10,),
                    RaisedButton(
                      onPressed: () {
                        Get.to(EditTaskPage());


                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Topshiriq qo'shish",
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
                  ],
                ),
              ),
            ],
          )
        ),
      );
    }else {
      return Scaffold(
        body: RefreshIndicator(
          onRefresh: refreshList,
          backgroundColor: Colors.white,
          child: GetBuilder(builder: (TaskController controller) {
            return ListView(
              padding: EdgeInsets.only(top: 50,left: 20,right: 20),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Hayrli tong!',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    IconButton(splashColor: Colors.lightBlueAccent,
                      splashRadius: 20,
                      color: Colors.black45,
                      onPressed: () {
                        Get.to(EditTaskPage());
                      },
                      icon: Icon(Icons.add),
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Text('Sizda bugun uchun ${controller.todayTaskIn()} ta topshiriq bor'),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.tasks.length,
                  itemBuilder: (context,index){
                    var taskDay=DateTime.parse(controller.tasks[index].requiredTime.toString()).day;
                    var taskMonth=DateTime.parse(controller.tasks[index].requiredTime.toString()).month;
                    var taskYear=DateTime.parse(controller.tasks[index].requiredTime.toString()).year;
                    var taskHour=DateTime.parse(controller.tasks[index].requiredTime.toString()).hour;
                    var taskMinutes=DateTime.parse(controller.tasks[index].requiredTime.toString()).minute;

                    if(controller.tasks.isNotEmpty
                        &&taskDay==DateTime.now().day
                        &&taskMonth==DateTime.now().month
                        &&taskYear==DateTime.now().year
                        &&taskHour>DateTime.now().hour
                        ){
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            height: 45,
                            color: setColor(0xFFcbf0f5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(width: 1,
                                          color: Colors.black26,),

                                      ),
                                      height: 22,
                                      width: 22,
                                      child: Visibility(
                                        visible: false,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Container(
                                            child: Icon(Icons.check,
                                              color: Colors.white,
                                              size: 15,),
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      width: size.width*0.67,
                                      child: Text(controller.tasks[index].task.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(color: Colors.blue),),
                                    ),
                                  ],
                                ),
                                Icon(Icons.more_vert,
                                  color: Colors.blue,)


                              ],

                            ),
                          ),
                        ),
                      );
                    }
                    else if(taskHour==DateTime.now().hour){
                      if(taskMinutes>=DateTime.now().minute){
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              height: 45,
                              color: setColor(taskMinutes),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(width: 1,
                                            color: Colors.black26,),

                                        ),
                                        height: 22,
                                        width: 22,
                                        child: Visibility(
                                          visible: false,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: Container(
                                              child: Icon(Icons.check,
                                                color: Colors.white,
                                                size: 15,),
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Container(
                                        width: size.width*0.67,
                                        child: Text(controller.tasks[index].task.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(color: setColorText(taskMinutes)),),
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.more_vert,
                                    color: setColorText(taskMinutes),)


                                ],

                              ),
                            ),
                          ),
                        );
                      }else return Container();
                    }else return Container();
                  },
                ),
                Text('Bajarilgan topshiriqlar'),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.todayTaskDone(),
                  itemBuilder: (context,index){

                    if(controller.tasks.isNotEmpty&&
                        controller.tasks[index].status.toString().toLowerCase()=="done"){
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            height: 45,
                            color: setColor(0xFFcbf0f5),
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(width: 1,
                                          color: Colors.black26,),

                                      ),
                                      height: 22,
                                      width: 22,
                                      child: Visibility(
                                        visible: true,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Container(
                                            child: Icon(Icons.check,
                                              color: Colors.white,
                                              size: 15,),
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      width: size.width*0.67,
                                      child: Text(controller.tasks[index].task.toString(),
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.blue,
                                            decoration: TextDecoration.lineThrough
                                        ),),
                                    ),
                                  ],
                                ),
                                Icon(Icons.more_vert,
                                  color: Colors.blue,)


                              ],

                            ),
                          ),
                        ),
                      );
                    }
                    else return Container();
                  },
                ),


              ],
            );
          },),
        )
    );
    }
  }

}
