import 'package:bbq_service/model/Task.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  List<Task> taskList = [];


  editTask(Task task){
      taskList.add(task);
      print(taskList[0].nameTask);


  }

}
