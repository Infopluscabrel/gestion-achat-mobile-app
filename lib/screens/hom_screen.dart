
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeedf2),
        body :  Center(
          
          child: 
              Container(
                margin: const EdgeInsets.all(10) ,
                padding: const EdgeInsets.all(10) ,
                child: const  Text(
                  "Faites vos achats en toute secutité" ,
                  style: TextStyle(
                    fontSize: 20 ,
                    fontWeight: FontWeight.w900 ,
                   )
                ),

              ) ,
             
               ) 
    );
  }
}