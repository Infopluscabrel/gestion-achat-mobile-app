
import 'package:equatable/equatable.dart';
import 'package:myapp/model/data_model.dart';

abstract class CubitStates extends Equatable{

}

class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

// etat des donnees qui chargent 
class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];

}


// etat des donnees qui se chargent
class LoadedState extends CubitStates {

  LoadedState(this.actifs);

  final List<DataModel> actifs ; 

  @override
  // TODO: implement props
  List<Object> get props => [actifs];

}