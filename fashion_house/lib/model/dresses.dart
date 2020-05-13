import 'package:cloud_firestore/cloud_firestore.dart';

//model basics are referenced by CTSE labsheet 6
class Dresses{
  String name;
  int price;
  DocumentReference reference;

  Dresses({this.name, this.price});

  Dresses.fromMap(Map<String, dynamic> map, {this.reference}){
    name=map["name"];
    price=map["price"];
  }

  Dresses.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
  toJson() {
    return {'name': name, 'price':price};
  }
}