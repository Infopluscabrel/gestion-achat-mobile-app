import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/data_model.dart';
import 'package:myapp/services/data_services.dart';

class ListTask extends StatelessWidget {
  const ListTask({super.key});

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
          child: FutureBuilder<List<DataModel>>  (
            future: fetchDataModels(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<DataModel> dataModels = snapshot.data as List<DataModel>;
                return ListView.builder(
                    itemCount: dataModels.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text("${dataModels[index].name} " ),
                            Text( "${dataModels[index].id} "),
                            Text(  "${dataModels[index].description} "),

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
    
    Future<List<DataModel>> fetchDataModels() async {

  /// demo de donnees 
      /*return <DataModel>[
        DataModel(id: 1, description: "description", name: "cabrel") ,
        DataModel(id: 2, description: "description2", name: "romaric") ,
      ];*/
    return DataServices().getActif() ;
  }
}