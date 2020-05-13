//Please find the references with **reference** tag in the particular place in the implementation
import 'package:flutter/material.dart';
import '../model/Transaction.dart';
import '../controler/transaction_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//**reference**
//In order to implement this UI and the functionality in this page I hve refered CTSE lab sheet 6
//https://courseweb.sliit.lk/mod/assign/view.php?id=116780

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  bool showTextField = false;
  TextEditingController descriptionInputcontroller = TextEditingController();
  TextEditingController revenueInputController = TextEditingController();
  TextEditingController costInputController = TextEditingController();
  bool isEditing = false;
  TransactionDet transnew;

  add() {
    if (isEditing) {
      update(
          transnew,
          descriptionInputcontroller.text,
          int.parse(costInputController.text),
          int.parse(revenueInputController.text));
      setState(() {
        isEditing = false;
      });
    } else {
      addTransaction(
          descriptionInputcontroller.text,
          int.parse(costInputController.text),
          int.parse(revenueInputController.text));
    }
    descriptionInputcontroller.text = '';
    costInputController.text = '';
    revenueInputController.text = '';
  }

  Widget buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getTransactions(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }
        if (snapshot.hasData) {
          print("Documents ${snapshot.data.documents.length}");
          return buildList(context, snapshot.data.documents);
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => buildListItem(context, data)).toList(),
    );
  }

  Widget buildListItem(BuildContext context, DocumentSnapshot data) {
    final transaction = TransactionDet.fromSnapshot(data);
    return Padding(
      key: ValueKey(transaction.description),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
        //wrap with a column
        child: Column(
          children: <Widget>[
            Container(

              child: ListTile(
                isThreeLine: true,
                title: Text(
                  transaction.description,
                  style: TextStyle(fontSize: 17.0,color: Colors.black,fontWeight: FontWeight.bold),
                ),
                trailing: Wrap(
                  spacing: 1,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.delete,),
                        onPressed: () {
                          delete(transaction);
                        }),
                    IconButton(
                        icon: Icon(Icons.update),
                        onPressed: () {
                          print("update");
                          setUpdateUI(transaction);
                        }),
                  ],
                ),

                subtitle: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(0.0, 10.0, 8.0, 8.0),
                          child: Text(
                            'Cost:         Rs. ' + (transaction.cost).toString(),
                            style: TextStyle(fontSize: 17.0,color: Colors.black,),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(0.0, 10.0, 8.0, 8.0),
                          child: Text(
                            'Revenue:  Rs. ' + (transaction.revenue).toString(),
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  setUpdateUI(TransactionDet tr) {
    descriptionInputcontroller.text = tr.description;
    costInputController.text = (tr.cost).toString();
    revenueInputController.text = (tr.revenue).toString();
    setState(() {
      showTextField = true;
      isEditing = true;
      transnew = tr;
    });
  }

  button() {
    return SizedBox(
      width: double.infinity,
      child: OutlineButton(
        child: Text(isEditing ? "UPDATE" : "ADD"),
        onPressed: () {
          //calling the add() function
          add();
          setState(() {
            showTextField = false;
          });
        },
      ),
    );
  }

  //**reference**
  //In order to implement this form I have refered the CTSE lab sheet 6
  // https://courseweb.sliit.lk/mod/assign/view.php?id=116780
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Lists'),
        backgroundColor: Colors.brown,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                showTextField = !showTextField;
              });
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/wood.jpg'),
                fit: BoxFit.cover)),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            showTextField
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: descriptionInputcontroller,
                  decoration: InputDecoration(
                      labelText: "Description",
                      hintText: "Enter description"),
                ),
                TextFormField(
                  controller: revenueInputController,
                  decoration: InputDecoration(
                      labelText: "Revenue", hintText: "Enter revenue"),
                ),
                TextFormField(
                  controller: costInputController,
                  decoration: InputDecoration(
                      labelText: "Cost", hintText: "Enter cost"),
                ),
                SizedBox(
                  height: 10,
                ),
                button(),
              ],
            )
                : Container(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Transactions",
              style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: buildBody(context),
            ),
          ],
        ),
      ),
    );
  }
}
