

import 'package:bloc/bloc.dart';
import 'package:myapp/cubit/app_cubit_state.dart';
import 'package:myapp/services/data_services.dart';

class AppCubit extends Cubit<CubitStates>{
  AppCubit({required this.data}) : super( InitialState()){

    emit(WelcomeState() ) ;
  }  

  final DataServices data ;
  late final actifs ;

  void getData () async {
    try{
      emit(LoadingState()) ;
      actifs = await data.getActif() ;

      emit(LoadedState(actifs)) ;

    }
     catch(e){
      
     }
  }
}