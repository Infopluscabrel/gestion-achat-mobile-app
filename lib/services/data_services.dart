
import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:myapp/model/data_model.dart';


class DataServices{

  //String baseUrl = "https://api.npi-stores.com" ;
  String baseUrl = "http://localhost:5000" ;

  Future<List<DataModel>> getActif() async {
    
     print("appel recuperation des donnees ") ;

    var apiUrl = "/article/all" ;

    // requete vers l'api get 
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl)) ;

 final response = await http.get(Uri.parse(baseUrl+apiUrl)) ;

 
  try{
    print( "status code") ;
    print(res.statusCode) ;
      if(res.statusCode==200) {
        print("liste des actifs ok ") ;
       /// final data = "[" + response.body + "]";
      
      

    List<dynamic> list = json.decode(response.body)['data'] ;

    print(list) ;

      return  list.map( (e) => DataModel.fromJson(e)).toList() ;
     
    /* return (json.decode(response.body)['data'] as List)
      .map((e) => DataModel.fromJson(e))
      .toList();
      */
      } else {
             return <DataModel>[] ;
      }
  } catch (e) {
      print(e) ;

      return <DataModel>[] ;
  }

  }

}