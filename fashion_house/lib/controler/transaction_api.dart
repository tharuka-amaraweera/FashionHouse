//Please find the references with **reference** tag in the particular place in the implementation
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/Transaction.dart';
//**reference**
//The API implementations for handling CRUD opertions on transaction data is based on CTSE labsheet 06
String collectionName = "transactions";

//get transaction
getTransactions() {
  return Firestore.instance.collection(collectionName).snapshots();
}

//add transaction
addTransaction(String description, int cost, int revenue){
  TransactionDet tr = TransactionDet(description: description, cost: cost,revenue:revenue);
  try{
    Firestore.instance.runTransaction(
          (Transaction transaction) async{
        await Firestore.instance
            .collection(collectionName)
            .document()
            .setData(tr.toJson());
      },
    );
  } catch(e){
    print(e.toString());
  }
}

//update a transaction
update(TransactionDet tr, String description, int cost, int revenue){
  try {
    Firestore.instance.runTransaction((transaction) async {
      await transaction.update(tr.reference, {'description': description,'revenue':revenue,'cost':cost});
    });
  } catch(e) {
    print(e.toString());
  }
}
//delete transaction
delete(TransactionDet tr){
  Firestore.instance.runTransaction(
        (Transaction transaction) async{
      await transaction.delete(tr.reference);
    },
  );
}