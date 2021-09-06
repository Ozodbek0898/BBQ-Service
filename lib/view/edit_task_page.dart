

import 'package:bbq_service/controller/task_controller.dart';
import 'package:bbq_service/model/Task.dart';
import 'package:bbq_service/view/added_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class EditTaskPage extends StatefulWidget {
  const EditTaskPage({Key? key}) : super(key: key);

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  TaskController taskController=Get.put(TaskController());

  TextEditingController name=new TextEditingController();

  DateTime selectedDate=DateTime.now();
  final DateFormat dateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');

  bool highVisibility=true;
  bool mediumVisibility=false;
  bool easyVisibility=false;

  bool _validate=false;

  getDegree(){
    if(highVisibility==true){
      return 'Yuqori';
    }else if(mediumVisibility==true){
      return "O'rta";
    }else if(easyVisibility==true){
      return 'Erkin';
    }
  }
  bool ontap =false;

  nana(){
    if(ontap==false){
      return "Bajarish lozim bo'lgan vaqt";
    }else return dateFormat.format(selectedDate);

  }
@override
  void setState(VoidCallback fn) {
    nana();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Yangi topshiriq qo'shish",
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: ListView(
       padding: EdgeInsets.all(20),
        children: [
          TextField(

            controller: name,
            decoration: InputDecoration(
                hintText: 'Qisqacha nom',
                hintStyle: TextStyle(color: Colors.black45),
                errorText: _validate? "Value cen't be empty" : null,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 27),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12, width: 2),
                    borderRadius: BorderRadius.circular(15))),
          ),
          SizedBox(
            height: 17,
          ),
          Text(
            'Qisqa va tushunarli nomlang',
            style: TextStyle(color: Colors.black45),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              shape: BoxShape.rectangle,
              border: Border.all(width: 2, color: Colors.black12),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                     nana(),
                    style: TextStyle(color: Colors.black45,
                    fontSize: 16),
                  ),
                  IconButton(
                    iconSize: 30,
                    splashColor: Colors.black12,
                    onPressed: () async{
                      ontap=true;

                      final selectedDate=await _selectedDateTime(context);
                      if(selectedDate==null) return;
                      print('kun  ${selectedDate}');

                     final selectTime=await _selectTime(context);
                     if(selectTime==null) return;
                            print('soat ${selectTime}');
                      setState(() {
                        this.selectedDate=DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          selectTime.hour,
                          selectTime.minute,

                        );
                     }
                     );


                    },
                    icon: Icon(

                      Icons.date_range,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text(
            'Vazifaning ustuvorligi',
            style: TextStyle(color: Colors.black45),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Stack(alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: InkWell(
                    splashColor: Colors.black12,
                    onTap: () {
                     setState(() {
                       highVisibility=true;
                       mediumVisibility=false;
                       easyVisibility=false;
                     });
                    },
                    child: Container(
                      height: 35,
                      width: 80,
                      color: Color(0xFFf5d3d3),
                      child: Center(
                          child: Text(
                            'Yuqori',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red
                            ),
                          )),
                    ),
                  ),
                ),
                  Visibility(
                    visible: highVisibility,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 10,
                        width: 10,
                        color: Colors.green,
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(width: 10,),
             Stack(
               alignment: Alignment.topRight,
               children: [
               ClipRRect(
                 borderRadius: BorderRadius.circular(30),
                 child: InkWell(
                   splashColor: Colors.black12,
                   onTap: () {
                    setState(() {
                      mediumVisibility=true;
                      highVisibility=false;
                      easyVisibility=false;
                    });
                   },
                   child: Container(
                     height: 35,
                     width: 80,
                     color: Color(0xFFffaecd9),
                     child: Center(
                         child: Text(
                           "O'rta",
                           textAlign: TextAlign.center,
                           style: TextStyle(
                               color: Colors.orange
                           ),
                         )),
                   ),
                 ),
               ),
                 Visibility(
                   visible: mediumVisibility,
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(20),
                     child: Container(
                       height: 10,
                       width: 10,
                       color: Colors.green,
                     ),
                   ),
                 )
             ],),
              SizedBox(width: 10,),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                      splashColor: Colors.black12,
                      onTap: () {
                        setState(() {
                          easyVisibility=true;
                          mediumVisibility=false;
                          highVisibility=false;
                        });
                      },
                      child: Container(
                        height: 35,
                        width: 80,
                        color: Color(0xFFcbf0f5),
                        child: Center(
                            child: Text(
                              "Erkin",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blue
                              ),
                            )),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: easyVisibility,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 10,
                        width: 10,
                        color: Colors.green,
                      ),
                    ),
                  )

                ],
              )
            ],
          ),
         SizedBox(height: 20,),
         Center(child:
         RaisedButton(
           onPressed: () {
             setState(() {
               name.text.isEmpty ? _validate=true : _validate=false;
             });
            if(_validate==false&&ontap==true){
             Task task=Task(nameTask: name.text,taskTime: selectedDate,taskDegree: getDegree());
             taskController.editTask(task);
            Get.to(AddedTask());
            }
           },
           child: Container(
             width: 100,
             height: 50,
             child: Center(
               child: Text(
                 "Qo'shish",
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
         )


        ],
      ),
    );
  }

  Future<TimeOfDay?> _selectTime(BuildContext context) {
    final now = DateTime.now();

   return showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: now.hour, minute: now.minute));
  }
  Future<DateTime?> _selectedDateTime(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(seconds: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100));
}
