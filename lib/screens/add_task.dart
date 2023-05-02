import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {

// les variables des champs
    TextEditingController nameController =TextEditingController() ;
    TextEditingController detailsController =TextEditingController() ;
     TextEditingController descriptionController =TextEditingController() ;
    
    return Scaffold(
      body: 
      Container (
        width: double.maxFinite,
        height: double.maxFinite,
        padding : const EdgeInsets.only(left: 20 , right: 20),

        // insert an image 
          /* 
        decoration: const BoxDecoration(
          image: DecorationImage(
         //   fit: BoxFit.cover ,
           image: AssetImage(
            "assets/paiecash.png"
          )) 
          ),*/
/*
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center  ,
          children:[
            Column(
             
              children: [
               const  SizedBox(height: 70,) ,
                IconButton(onPressed: () {} ,
                 icon : Icon( Icons.arrow_back ,
                  color:Colors.blue ,

                ))
              ]
            ) , 
*/
               

     child :   
           Column(
          children:   [
              SizedBox(
                  height: 40,
              ) ,
              const Text(
                  "Ajoutez une tache" ,
                  style: TextStyle(
                    fontSize: 20 ,
                    fontWeight: FontWeight.w900 ,
                   )
                ),

            SizedBox(
                  height: 20,
              ) ,

               Container(
                      margin: const EdgeInsets.all(10) ,
                padding: const EdgeInsets.all(10) ,

                      child: Column(
                        children: [
                           TextField(
                  maxLines:1 ,
                  controller : nameController ,
                  decoration: const InputDecoration(

                      filled: true ,
                      fillColor:   Color(0xFFeeedf2),
                      hintText: "Titre de la tache " ,

                  ),
                ) ,
                
                const SizedBox(
                  height: 20,
                ) ,

                 TextField(
                  maxLines: 1, 
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    filled : true ,
                    fillColor:  Color(0xFFeeedf2), 
                    hintText: "Description"
                  ),
                ) ,

                 const SizedBox(
                  height: 20,
                ) ,

              SizedBox(
               
                 
                  child: ElevatedButton(
                    onPressed: () async {
                        
                        // requetes vers l'api 

                    },

                     child: const  Text("Créer") ,

                      style : const  ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)
                       )
                        )

           ),
              

        ],
      )    


      ,
               
               ) 
               
            
              ]
            )


      ) 
        );
    
    }
}