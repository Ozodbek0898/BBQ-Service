import 'package:bbq_service/controller/clients_controller.dart';
import 'package:bbq_service/controller/task_controller.dart';
import 'package:bbq_service/view/added_task.dart';
import 'package:bbq_service/view/edit_task_page.dart';
import 'package:bbq_service/view/settings_page.dart';
import 'package:bbq_service/view/tasks_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'load_task.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;
  ClientsController controller=Get.put(ClientsController());
  @override
  void initState() {
    controller.fetchPost();


    super.initState();
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          TasksPage(),
          SettingsPage()



        ],
      ),
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.water_damage_outlined),
          ),


         

          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.person_outline),
          ),
        ],
        unselectedItemColor: Colors.black38,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        iconSize: 25,
      ),
    );
  }
}


