import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controler/dress_api.dart';
import '../model/dresses.dart';

//List view is referenced by CTSE labsheet 6
class DressesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dresses Interface',
      home: ShowDressList(),
    );
  }
}

class ShowDressList extends StatefulWidget {
  ShowDressList() : super();
  final String title ="Dresses Store";
  ShowDressListState createState() => ShowDressListState();

}

class ShowDressListState extends State<ShowDressList> {
  bool showTextField = false;
  TextEditingController dressNameInputcontroller = TextEditingController();
  TextEditingController dressPriceInputController = TextEditingController();
  bool isEditing = false;
  Dresses dressnew;
  //new
  String newName;
  String newPrice;

  add(){
    if(isEditing){
      update(dressnew, dressNameInputcontroller.text, int.parse(dressPriceInputController.text));
      setState(() {
        isEditing=false;
      });
    }else{
      addDress(dressNameInputcontroller.text, int.parse(dressPriceInputController.text));
    }
    dressNameInputcontroller.text='';
    dressPriceInputController.text='';
  }

  Widget buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getDresses(),
      builder: (context, snapshot) {
        if(snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }
        if(snapshot.hasData){
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

  Widget buildListItem(BuildContext context, DocumentSnapshot data){
    final dress=Dresses.fromSnapshot(data);
    return Padding(
      key:ValueKey(dress.name),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.brown),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: <Widget>[
            Container(

              child: ListTile(
                title: Text(
                  dress.name,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                trailing: Wrap(
                  spacing: 1,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: (){
                          delete(dress);
                        }
                    ),
                    IconButton(
                        icon: Icon(Icons.update),
                        onPressed: (){
                          setUpdateUI(dress);
                        }
                    )
                  ],
                ),
                subtitle: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0,10.0,8.0,8.0),
                          child: Text('Price: Rs. '+(dress.price).toString(),style: TextStyle(fontSize: 17.0,color: Colors.black),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }

  setUpdateUI(Dresses dress){

    dressNameInputcontroller.text = dress.name;
    dressPriceInputController.text =(dress.price).toString();
    setState(() {
      showTextField = true;
      isEditing = true;
      dressnew = dress;
    });
  }

  button(){
    return SizedBox(
      width: double.infinity,
      child: OutlineButton(
        child: Text(isEditing ? "UPDATE" : "ADD"),
        onPressed: (){
          add();
          setState(() {
            showTextField = false;
          });
        },
      ),
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.brown,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
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
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            showTextField
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: dressNameInputcontroller,
                  decoration: InputDecoration(
                      labelText: "Name",hintText:"Enter Dress Name"),
                ),
                TextFormField(
                  controller: dressPriceInputController,
                  decoration: InputDecoration(
                      labelText: "Price",hintText:"Enter Dress Price"),
                ),
                SizedBox(
                  height: 10,
                ),
                button(),
              ],
            )
                :Container(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Dresses Collection Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.black),
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