import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditTaskPage extends StatefulWidget {
  const EditTaskPage({Key? key}) : super(key: key);

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  DateTime selectedDate=DateTime.now()
  ;
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Yangi topshiriq qo'shish",
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Qisqacha nom',
                  hintStyle: TextStyle(color: Colors.black45),
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
                      dateFormat.format(selectedDate),
                      style: TextStyle(color: Colors.black45,
                      fontSize: 16),
                    ),
                    IconButton(
                      iconSize: 30,
                      splashColor: Colors.black12,
                      onPressed: () async{
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
                       });

                      },
                      icon: Icon(

                        Icons.date_range,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
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
