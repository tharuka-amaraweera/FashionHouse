import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/pants.dart';
 //API creation is refernced by the CTSE labe sheet 6

String collectionName = "pants";

//get pants
getPants() {
  return Firestore.instance.collection(collectionName).snapshots();
}

//add a new pant
addPants(String Name, int Price){
  Pants pants = Pants(pname: Name, pprice: Price);
  try{
    Firestore.instance.runTransaction(
          (Transaction transaction) async{
        await Firestore.instance
            .collection(collectionName)
            .document()
            .setData(pants.toJson());
      },
    );
  } catch(e){
    print(e.toString());
  }
}

//update a pant
update(Pants dress, String newName, int newPrice){
  try {
    Firestore.instance.runTransaction((transaction) async {
      await transaction.update(dress.reference, {'pname': newName, 'pprice':newPrice});
    });
  } catch(e) {
    print(e.toString());
  }
}
//delete a pant
delete(Pants dress){
  Firestore.instance.runTransaction(
        (Transaction transaction) async{
      await transaction.delete(dress.reference);
    },
  );
}
