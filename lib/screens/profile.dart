import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body : Column(
          
          children: [
 Container(
                margin: const EdgeInsets.all(60) ,
                padding: const EdgeInsets.all(60) ,

                 // insert an image 
         
        decoration: const BoxDecoration(
          image: DecorationImage(
         //   fit: BoxFit.cover ,
           image: AssetImage(
            "assets/paiecash.png"
          )) 
          ),

                

              ) ,

              Container(
                  child: const  Text(
                  "Reglez rapidement votre facture" ,
                  style: TextStyle(
                    fontSize: 20 ,
                    fontWeight: FontWeight.w900 ,
                   )
                ),
              ),
             
          ]
             
               ) ,
    );
  }
}