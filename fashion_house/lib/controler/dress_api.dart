import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/dresses.dart';

//API creation is refernced by the CTSE labe sheet 6
String collectionName = "dresses";

//get dresses
getDresses() {
  return Firestore.instance.collection(collectionName).snapshots();
}
//add new dress
addDress(String Name, int Price){
  Dresses dress = Dresses(name: Name, price: Price);
  try{
    Firestore.instance.runTransaction(
          (Transaction transaction) async{
        await Firestore.instance
            .collection(collectionName)
            .document()
            .setData(dress.toJson());
      },
    );
  } catch(e){
    print(e.toString());
  }
}
//update dresses
update(Dresses dress, String newName, int newPrice){
  try {
    Firestore.instance.runTransaction((transaction) async {
      await transaction.update(dress.reference, {'name': newName, 'price':newPrice});
    });
  } catch(e) {
    print(e.toString());
  }
}
//delete a dress
delete(Dresses dress){
  Firestore.instance.runTransaction(
        (Transaction transaction) async{
      await transaction.delete(dress.reference);
    },
  );
}
