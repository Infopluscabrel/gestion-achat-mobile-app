part of 'client.dart';

Clients _$ClientFromJson(Map<String, dynamic> json) {
  return Clients(
    codeclient: json['codeclient'] ,
      nom: json['nom'] ,
      email: json['email'] ,
      login: json['login'] as String,
      password: json['password'] as String,
      sexe: json['sexe'] as String);
}

Map<String, dynamic> _$ClientToJson(Clients instance) => <String, dynamic>{
      'nom': instance.nom,
      'email': instance.email,
      'login': instance.login,
      'password': instance.password,
      'sexe': instance.sexe
    };
