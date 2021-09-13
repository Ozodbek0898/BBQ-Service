
import 'package:bbq_service/controller/clients_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  ClientsController controller=Get.put(ClientsController());






  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Profil sozlamalar',
            style: TextStyle(
                color: Colors.black
            ),),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: size.width*0.05,right: size.width*0.05,top: size.width*0.1),
          child: Column(
            children: [

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ism",
                style: TextStyle(
                  fontSize: size.height*0.03
                ),),
                Text(controller.userName,
                  style: TextStyle(
                      fontSize: size.height*0.03
                  ),)
            ],
          ),
              SizedBox(height: size.height*0.05,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Familiya",
                    style: TextStyle(
                        fontSize: size.height*0.03
                    ),),
                  Text(controller.userSurname,
                    style: TextStyle(
                        fontSize: size.height*0.03
                    ),)
                ],
              ),
              SizedBox(height: size.height*0.05,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Manzil",
                    style: TextStyle(
                        fontSize: size.height*0.03
                    ),),
                  Text(controller.userAddress,
                    style: TextStyle(
                        fontSize: size.height*0.03
                    ),)
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
