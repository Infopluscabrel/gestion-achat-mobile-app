import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'client.g.dart';

@JsonSerializable()
class Clients {
  Clients(
      { this.codeclient,
        this.nom,
       this.email,
       this.login,
       this.password,
       this.sexe});

int? codeclient;
  String? nom;
  String? email;
  String ? sexe;
  String? login;
  String? password;

  /*factory Clients.fromJson(Map<String, dynamic> json) {

    return Clients(
      codeclient: json['codeclient'] ,
      nom: json['nom'] ,
      email: json['email'] ,
      login: json['login'] ,
      password: json['password'] ,
      sexe: json['sexe'] );

  }*/
/*
 Map<String, dynamic> toJson(Clients client) {
    return {
       'nom': client.nom,
       'email': client.email,
       'login' : client.login ,
       'password' : client.password ,
       'sexe' : client.sexe,
    };
  } 
*/
  /*Map<String, dynamic>  Clients.toJson(Clients instance){
     return {

     'nom': instance.nom,
      'email': instance.email,
      'login': instance.login,
      'password': instance.password,
      'sexe': instance.sexe
       }
    };
    */

 factory Clients.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);


}