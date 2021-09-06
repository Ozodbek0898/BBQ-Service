

import 'package:bbq_service/view/auth_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'enter_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Image.asset(
              'images/img.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 70),
                    child: Container(
                      width: 300,
                      child: Text(
                        'Maqsadlaringizni '
                            'oson boshqaring ',
                        style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: InkWell(
                        splashColor: Colors.black12,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EnterPage()));
                        },
                        child: Container(
                          height: 50,
                          width: 320,
                          color: Colors.white,
                          child: Center(
                              child: Text(
                                'Boshlash',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
