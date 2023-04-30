
class DataModel{
  String? name ;
   String? description ;
    int id ;

  DataModel({
     required this.id ,
       this.description,
      this.name

  });

  factory DataModel.fromJson(Map<String, dynamic> json) {

    return DataModel(
      name : json["data"] ,
      description: json["description"] ,
      id: json["id"] 
    ) ;

  }

}