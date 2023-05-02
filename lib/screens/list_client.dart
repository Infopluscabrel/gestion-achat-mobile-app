import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/client.dart';
import 'package:myapp/model/data_model.dart';
import 'package:myapp/services/ClientService.dart';
import 'package:myapp/services/data_services.dart';

class ListClient extends StatelessWidget {
  const ListClient({super.key});

  @override
   Widget build(BuildContext context) {

// les variables des champs
    TextEditingController nameController =TextEditingController() ;
    TextEditingController detailsController =TextEditingController() ;
     TextEditingController descriptionController =TextEditingController() ;
    
    return Scaffold(
      body:Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<List<Clients>>  (
            future: fetchClientss(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Clients> clients = snapshot.data as List<Clients>;
                return ListView.builder(
                    itemCount: clients.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text("${clients[index].login} " ),
                            Text( "${clients[index].nom} "),
                            Text(  "${clients[index].sexe} "),

                          ],
                        ),
                      );
                    });
              }
              if (snapshot.hasError) {
                print(snapshot.error.toString());
                return Text('error');
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }
    
    Future<List<Clients>> fetchClientss() async {

  /// demo de donnees 
      /*return <Clients>[
        Clients(id: 1, description: "description", name: "cabrel") ,
        Clients(id: 2, description: "description2", name: "romaric") ,
      ];*/
    return await ClientService().getClients() ;
  }
}