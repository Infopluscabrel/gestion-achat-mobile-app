
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/app_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFeeedf2),
        body :  Align(
          alignment: Alignment.center,
          child: 
              Container(
                margin: const EdgeInsets.all(10) ,
                padding: const EdgeInsets.all(10) ,
                child: Column(
                  children: [
                    

                      Text(
                  "Faites vos achats en toute secutité" ,
                  style: TextStyle(
                    fontSize: 20 ,
                    fontWeight: FontWeight.w900 ,
                   )
                ),

                SizedBox(
                  height: 20,
              ) ,

                ElevatedButton(
                  onPressed: () async {
                    BlocProvider.of<AppCubit>(context).getData() ;
                }, 
                child: Text("Lister les articles") ,
                style : const  ButtonStyle(
                       
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)
                       )
                
                )

                  ],
                )  

              ) ,
             
               ) 
    );
  }
}