import 'dart:core';
import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Produit {
  Produit(
      {this.codeProduit,
      this.label,
      this.pu,
      this.qteSeuil,
      this.qteStock});

  String? codeProduit;
  String? label;
  Float? pu;
  int? qteStock;
  int? qteSeuil;

 
}
