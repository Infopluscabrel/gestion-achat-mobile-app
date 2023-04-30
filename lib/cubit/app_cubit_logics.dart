import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubit/app_cubit.dart';
import 'package:myapp/cubit/app_cubit_state.dart';
import 'package:myapp/main-default.dart';
import 'package:myapp/screens/list_task.dart';

import '../screens/bottom_bar.dart';


class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :  BlocBuilder<AppCubit , CubitStates> (
        builder: ( context , state ) {

            if(state is WelcomeState) {

              return const BottomBar() ;

            } if(state is LoadedState) {

              return const ListTask() ;

            } if(state is LoadingState) {
                // etat des donnees qui se chargent 
                // appeler une fonction ou lancer une vue 

              return Center(child: CircularProgressIndicator(),) ;

            } else {

              return Container() ;
            }

        },
      ),
    );
  }
}