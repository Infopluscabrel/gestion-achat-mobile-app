
import 'package:flutter_bloc/src/bloc_builder.dart' ;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:myapp/cubit/app_cubit.dart';
import 'package:myapp/cubit/app_cubit_state.dart';
import 'package:myapp/model/data_model.dart';
import 'package:myapp/services/data_services.dart';

class ListTaskBloc extends StatelessWidget {
  const ListTaskBloc({super.key});


  @override
   Widget build(BuildContext context) {
  

 
// les variables des champs
    TextEditingController nameController =TextEditingController() ;
    TextEditingController detailsController =TextEditingController() ;
     TextEditingController descriptionController =TextEditingController() ;
    
    return Scaffold(
      body: BlocBuilder<AppCubit , CubitStates>(
        builder: (context , state) {

          if (state is LoadedState) {
              var info = state.actifs ;

          return  Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(8),
        
        //    future: info,
         
            
                child:  ListView.builder(
                    itemCount: info.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text("${info[index].name} " ),
                            Text( "${info[index].id} "),
                            Text(  "${info[index].description} "),

                          ],
                        ),
                      );
                    })
          );
              }   else {
                 BlocProvider.of<AppCubit> (context).getData();
              return Container() ;
            }

        }) 
              
              ) ;          //return CircularProgressIndicator();
           
    
   }
   }