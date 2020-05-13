import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/shirts.dart';

//API creation is refernced by the CTSE labe sheet 6
String collectionName = "shirts";

//get all shirts
getShirts() {
  return Firestore.instance.collection(collectionName).snapshots();
}

//add a new shirt
addShirts(String Name, int Price){
  Shirts shirts = Shirts(sname: Name, sprice: Price);
  //Shirts dressPrice = Shirts(sprice: Price);
  try{
    Firestore.instance.runTransaction(
          (Transaction transaction) async{
        await Firestore.instance
            .collection(collectionName)
            .document()
            .setData(shirts.toJson());
      },
    );
  } catch(e){
    print(e.toString());
  }
}

//update a shirt
update(Shirts shirts, String newName, int newPrice){
  try {
    Firestore.instance.runTransaction((transaction) async {
      await transaction.update(shirts.reference, {'sname': newName, 'sprice':newPrice});
    });
  } catch(e) {
    print(e.toString());
  }
}
//delete a pant
delete(Shirts shirts){
  Firestore.instance.runTransaction(
        (Transaction transaction) async{
      await transaction.delete(shirts.reference);
    },
  );
}
