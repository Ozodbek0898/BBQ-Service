import 'package:bbq_service/view/auth_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterPage extends StatelessWidget {
  const EnterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: size.height*0.1,left: 20,right: 20),
            child: Column(
              children: [
                Container(
                  height: size.height*0.1,
                  child: Text('Ilova nomi',
                      style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: size.height*0.2,),


                Container(
                    height: size.height*0.2,
                    child: Image.asset('images/edit.png')),
                SizedBox(
                  height: size.height*0.1,

                ),
                Container(
                  height: size.height*0.1,
                  child: Text(
                    'Maqsadingizni muhimlik darajasini belgilang',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox( height: size.height*0.1,),

                RaisedButton(
                  onPressed: () {
                    Get.to(AuthPage());
                  },
                  child: Container(
                    width: 100,
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
      ),
    );
  }
}
