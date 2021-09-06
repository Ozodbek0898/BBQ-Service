import 'package:bbq_service/controller/task_controller.dart';
import 'package:bbq_service/model/Task.dart';
import 'package:bbq_service/view/added_task.dart';
import 'package:bbq_service/view/edit_task_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasksPage extends StatelessWidget {

  TaskController controller = Get.put(TaskController());

  DateTime nowDate=DateTime.now();

  setColor(Task task){
      if(task.taskDegree.toString()=='Yuqori'){
        return Color(0xFFf5d3d3);
      }else if(task.taskDegree.toString()=="O'rta"){
        return Color(0xFFffaecd9);
      }else if(task.taskDegree.toString()=='Erkin'){
        return Color(0xFFcbf0f5);
      }else return Colors.white70;
  }

  setColorText(Task task){
    if(task.taskDegree.toString()=='Yuqori'){
      return Colors.red;
    }else if(task.taskDegree.toString()=="O'rta"){
      return Colors.orange;
    }else if(task.taskDegree.toString()=='Erkin'){
      return Colors.blue;
    }else return Colors.white70;
  }

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    if(controller.taskList.length==0){
      return Scaffold(
        body: Center(
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
      );
    }else return Scaffold(
        body: GetBuilder(builder: (TaskController controller) {
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
              Text('Sizda bugun uchun ${controller.taskList.length} ta topshiriq bor'),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.taskList.length,
                itemBuilder: (context,index){
                  var taskDay=controller.taskList[index].taskTime?.day;
                  var taskMonth=controller.taskList[index].taskTime?.month;
                  var taskYear=controller.taskList[index].taskTime?.year;
                  var taskHour=controller.taskList[index].taskTime?.hour;
                  var taskMinutes=controller.taskList[index].taskTime?.minute;

                  if(controller.taskList.isNotEmpty
                      &&taskDay==DateTime.now().day
                      &&taskMonth==DateTime.now().month
                      &&taskYear==DateTime.now().year
                      &&taskHour!>DateTime.now().hour){
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          height: 45,
                          color: setColor(controller.taskList[index]),
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
                                    child: Text(controller.taskList[index].nameTask.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(color: setColorText(controller.taskList[index])),),
                                  ),
                                ],
                              ),
                              Icon(Icons.more_vert,
                                color: setColorText(controller.taskList[index]),)


                            ],

                          ),
                        ),
                      ),
                    );
                  }
                  else if(taskHour==DateTime.now().hour){
                    if(taskMinutes!>=DateTime.now().minute){
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            height: 45,
                            color: setColor(controller.taskList[index]),
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
                                      child: Text(controller.taskList[index].nameTask.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(color: setColorText(controller.taskList[index])),),
                                    ),
                                  ],
                                ),
                                Icon(Icons.more_vert,
                                  color: setColorText(controller.taskList[index]),)


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
                itemCount: controller.taskList.length,
                itemBuilder: (context,index){
                  var taskDay=controller.taskList[index].taskTime?.day;
                  var taskMonth=controller.taskList[index].taskTime?.month;
                  var taskYear=controller.taskList[index].taskTime?.year;
                  var taskHour=controller.taskList[index].taskTime?.hour;
                  var taskMinutes=controller.taskList[index].taskTime?.minute;
                  if(controller.taskList.isNotEmpty
                      &&taskHour!<DateTime.now().hour
                      &&taskDay==DateTime.now().day
                      &&taskMonth==DateTime.now().month
                      &&taskYear==DateTime.now().year){
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          height: 45,
                          color: setColor(controller.taskList[index]),
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
                                    child: Text(controller.taskList[index].nameTask.toString(),
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: setColorText(controller.taskList[index]),
                                          decoration: TextDecoration.lineThrough
                                      ),),
                                  ),
                                ],
                              ),
                              Icon(Icons.more_vert,
                                color: setColorText(controller.taskList[index]),)


                            ],

                          ),
                        ),
                      ),
                    );
                  }
                  else if(taskHour==DateTime.now().hour){
                    if(taskMinutes!<DateTime.now().minute){
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: 45,
                            padding: EdgeInsets.symmetric(vertical: 5),
                            color: setColor(controller.taskList[index]),
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
                                      child: Text(controller.taskList[index].nameTask.toString(),
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: setColorText(controller.taskList[index]),
                                            decoration: TextDecoration.lineThrough
                                        ),),
                                    ),
                                  ],
                                ),
                                Icon(Icons.more_vert,
                                  color: setColorText(controller.taskList[index]),)


                              ],

                            ),
                          ),
                        ),
                      );
                    }else return Container();
                  }else return Container();
                },
              ),


            ],
          );
        },)
    );
  }

}
