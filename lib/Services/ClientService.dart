import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;
import 'package:myapp/model/client.dart';

import '../customModels/ErrorObject.dart';
import '../helper/ApiResponse.dart';

class ClientService {
  static const API = 'http://127.0.0.1:8009';

  static const CreateClientAPI = 'http://127.0.0.1:8009/client/createclient';

  static const headers = {
    'Content-Type': 'application/json',
    "Accept": 'application/json'
  };

// Ajouter un client
  Future<ApiResponse<dynamic>> createClient(Clients client) async {
    var url = Uri.parse(CreateClientAPI);

  print("Ajout client");

  print(client.nom);

    return http
        .post(url, headers: headers, body: jsonEncode(client))
        .then((data) {

          print("Status code create ") ;
          print(data.statusCode) ;
      final int statueCode = data.statusCode;

      if (statueCode == 200) {
         print("Ajout reussi");
      //  Map<String, dynamic> jsonData = json.decode(data.body);

       

      
        return ApiResponse<Clients>(
            errorMessage: '', data: client, error: false);
      } else {
        return ApiResponse<ErrorObject>(
            error: true,
            errorMessage: 'An error occured ',
            data: ErrorObject(errorCode: statueCode, errorText: "Error"));
      }
    }).catchError((_) => ApiResponse<ErrorObject>(
            error: true,
            errorMessage: 'unable to connect to contact the server',
            data: ErrorObject(errorCode: 404, errorText: "Empty")));
  }

  static const apiUrl = 'http://127.0.0.1:8009/client/all';

// liste des clients 1 ok 
  Future<List<Clients>> getClients() async {
    
     print("appel recuperation des donnees ") ;

   // var apiUrl = "/client/all" ;

    // requete vers l'api get 
    http.Response res = await http.get(Uri.parse(apiUrl)) ;


 
  try{
    print( "status code") ;
    print(res.statusCode) ;
      if(res.statusCode==200) {
        print("liste des actifs ok ") ;
     //  final data =res.body    ;
      
      

    List<dynamic> list = json.decode(res.body) ;

   //print(list) ;

      return  list.map( (e) => Clients.fromJson(e)).toList() ;
     
    /* return (json.decode(response.body)['data'] as List)
      .map((e) => Clients.fromJson(e))
      .toList();
      */
      } else {
             return <Clients>[] ;
      }
  } catch (e) {
      print(e) ;

      return <Clients>[] ;
  }

  }


// liste des clients 
  Future<ApiResponse<List<Clients>>> getAllClients() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        final clients = jsonList.map((json) => Clients.fromJson(json)).toList();

        return ApiResponse(data: clients, errorMessage: '');
      } else {
        return ApiResponse(data: [], errorMessage: 'an error occured');
      }
    } catch (e) {
      return ApiResponse(errorMessage: 'An error occurred', data: []);
    }
  }
}
