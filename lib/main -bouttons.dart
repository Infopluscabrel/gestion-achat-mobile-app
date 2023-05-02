import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

   MyApp({super.key});
final String info = "Gest Achat" ;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home: const soir() ,
    );
  }
}

class soir extends StatefulWidget {
  const soir({super.key});

  @override
  State<soir> createState() => _soirState();
}

class _soirState extends State<soir> {

var info = "Gest Achat market" ;
 String value = "";
void onclick() {
  setState(() {
     value= " Produit ajoutez dans le panier avec succes " ;
  });
}

void onclick2(String value2) {
  setState(() {
    String value= "Retour dans votre boutique " ;
  });
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    info = "Bienvenue sur Super SAS";
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title :  Text("Raised Button")
              ) ,
              body: Column(
                mainAxisAlignment : MainAxisAlignment.center,
                children: const <Widget> [
                  ElevatedButton(
                   child: Text('First' , style: TextStyle(color: Colors.green   )
                   ) ,
                   onPressed:null ,
                  ),

                    Divider(height: 20,color: Colors.white) ,

                   ElevatedButton(onPressed: null,
                   child: Text('Second' , style: TextStyle(color: Colors.blue  )
                   ) ,

                  ),


 Divider(height: 20,color: Colors.white) ,

                                 
     
                

                ]

              )
        );

  }
}

