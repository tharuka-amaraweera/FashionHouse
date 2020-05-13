import 'package:cloud_firestore/cloud_firestore.dart';
//model basics are referenced by CTSE labsheet 6
class Shirts{
  String sname;
  int sprice;
  DocumentReference reference;

  Shirts({this.sname, this.sprice});

  Shirts.fromMap(Map<String, dynamic> map, {this.reference}){
    sname=map["sname"];
    sprice=map["sprice"];
  }

  Shirts.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
  toJson() {
    return {'sname': sname, 'sprice':sprice};
  }
}