//Please find the references with **reference** tag in the particular place in the implementation

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/stockDet.dart';
import 'DressesList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'PantsList.dart';
import 'ShirtsList.dart';
import 'TransactionList.dart';
import 'signin.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static int val1 = 5;
  static int val2 = 10;
  static int val3 = 15;
  static int val4 = 20;
  static int revenue = 100000;
  static int cost = 50200;
  static String sval1 = val1.toString();
  static String sval2 = val2.toString();
  static String sval3 = val3.toString();
  static String sval4 = val4.toString();
  static String srevenue = revenue.toString();
  static String scost = cost.toString();
  List<Stock> stocks = [
    Stock(
        propertyOne: 'Low Stock',
        propertyTwo: 'Shipping',
        propertyThree: 'Orders',
        propertyFour: 'Dilivery',
        valueOne: sval1,
        valueTwo: sval2,
        valueThree: sval3,
        valueFour: sval4,
        tCost: scost,
        tRevenue: srevenue)
  ];

  //cardone
  //**reference**
  //in order to do the card implementation I have site this website https://api.flutter.dev/flutter/material/Card-class.html
  Widget CardOne(name) {
    return Card(
      color: Colors.brown[50],
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: Container(
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('images/iconone.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          name,
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  //cardTwo
  //**reference**
  //in order to do the card implementation I have site this website https://api.flutter.dev/flutter/material/Card-class.html
  Widget CardTwo(name) {
    return Card(
      color: Colors.brown[50],
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: Container(
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('images/icontwo.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          name,
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  //CardThree
  //**reference**
  //in order to do the card implementation I have site this website https://api.flutter.dev/flutter/material/Card-class.html
  Widget CardThree(name) {
    return Card(
      color: Colors.brown[50],
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: Container(
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('images/iconorders.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          name,
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  //CardFour
  //**reference**
  //in order to do the card implementation I have site this website https://api.flutter.dev/flutter/material/Card-class.html
  Widget CardFour(name) {
    return Card(
      color: Colors.brown[50],
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: Container(
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                          AssetImage('images/icondelivery.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          name,
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  //CadrFive
  //**reference**
  //in order to do the card implementation I have site this website https://api.flutter.dev/flutter/material/Card-class.html
  Widget CardFive(name) {
    return Card(
      color: Colors.brown[50],
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: Container(
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('images/iconrevenue.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          "\$ " + name,
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  //CardSiz
  //**reference**
  //in order to do the card implementation I have site this website https://api.flutter.dev/flutter/material/Card-class.html
  Widget CardSix(name) {
    return Card(
      color: Colors.brown[50],
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: Container(
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('images/iconcost.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          "\$ " + name,
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
        ),
        //Navigation Drawer
        //**reference**
        //In order to create the navigation drawer I have follower this video tutorial
        // https://www.youtube.com/watch?v=jDQQM1RfjNc
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/wood.jpg'),
                    fit: BoxFit.cover)),
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                          Colors.brown[600],
                          Colors.brown,
                          Colors.brown[400]
                        ])),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        child: Column(
                          children: <Widget>[
                            Material(
                              borderRadius:
                              BorderRadius.all(Radius.circular(40.0)),
                              elevation: 10,
                              child: CircleAvatar(
                                backgroundImage: AssetImage('images/logo.png'),
                                radius: 40.0,
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                'Fashion House',
                                style: TextStyle(
                                    color: Colors.brown[50], fontSize: 25.0),
                              ),
                            ) //
                          ],
                        ),
                      ),
                    )),
                //begining of the navigation drawer body
                //In the body of navigation drawer there is a multirow list and the tiles of the list has been customized
                // using a common function called 'CustomListTile'
                CustomListTile(
                  Icons.filter_1,
                  'Dresses',
                      () => {
                    //print('Hello'),
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return DressesList();
                    })),
                  },
                ),
                CustomListTile(
                    Icons.filter_2,
                    'Shirts',
                        () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return ShirtsList();
                          })),
                    }),
                CustomListTile(
                    Icons.filter_3,
                    'Pants',
                        () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return PantsList();
                          })),
                    }),
                //CustomListTile(Icons.filter_4, 'log out', () => {}),
                Padding(
                  padding: const EdgeInsets.only(top: 165.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return Orders();
                          }));
                    },

                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                      child: Text(
                        'View Transactions',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                    color: Colors.brown[400],
                  ),
                )
              ],
            ),
          ),
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection('dashboardStock').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text("Luading.... please wait");
            }
            if (snapshot.hasData) {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/bodyone.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  children: <Widget>[
                    //SizedBox(height: 25.0),
                    //Dashboard Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'Dashboard',
                                style: TextStyle(
                                    fontSize: 25.0, fontWeight: FontWeight.bold),
                              ),
                            )),
                        SizedBox(width: 80.0),
                        Container(
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.end,
                              //crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                RaisedButton(
                                  color: Colors.brown[200],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.brown)),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return Signin();
                                        }));
                                  },
                                  child: Text('SIGN OUT'),
                                ),
                              ],
                            ))
                      ],
                    ),

                    //DRow1
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
//                      row 1 space 1
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: Container(),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          // column for card 1
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: stocks
                                  .map((stock) => CardOne(
                                  snapshot.data.documents[0]['stock']))
                                  .toList()),
                        ),
                        Expanded(
                          flex: 1,
                          //row1 space 2
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: Container(),
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          //column for card 2
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: stocks
                                  .map((stock) => CardTwo(
                                  snapshot.data.documents[0]['shipping']))
                                  .toList()),
                        ),
                        Expanded(
                          flex: 1,
                          //row 1 space 3
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: Container(),
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 60.0),
                    //DRow2

                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
//                      row 2 space 1
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                //color: Colors.blue,
                                child: Container(),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          // column for card 3
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: stocks
                                  .map((stock) => CardThree(
                                  snapshot.data.documents[0]['orders']))
                                  .toList()),
                        ),
                        Expanded(
                          flex: 1,
                          //row 2 space 2
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: Container(),
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          //column for card 4
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: stocks
                                  .map((stock) => CardFour(
                                  snapshot.data.documents[0]['delivery']))
                                  .toList()),
                        ),
                        Expanded(
                          flex: 1,
                          //row 2 space 3
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: Container(),
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 60.0),
                    //DRow3
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
//                      row 3 space 1
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                color: Colors.blue,
                                child: Container(),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          // column for card 5
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: stocks
                                  .map((stock) => CardFive(
                                  snapshot.data.documents[0]['revenue']))
                                  .toList()),
                        ),
                        Expanded(
                          flex: 1,
                          //row 3 space 2
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: Container(),
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          //column for card 6
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: stocks
                                  .map((stock) => CardSix(
                                  snapshot.data.documents[0]['cost']))
                                  .toList()),
                        ),
                        Expanded(
                          flex: 1,
                          //row 3 space 3
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: Container(),
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ));
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String description;
  Function onTap;

  //Customization function for tiles in the multi-row list of navigation drawer body
  //**reference**
  //In order to create the navigation drawer I have follower this video tutorial
  // https://www.youtube.com/watch?v=jDQQM1RfjNc
  CustomListTile(this.icon, this.description, this.onTap);
  @override
  Widget build(BuildContext context) {
    //inkwell is a button
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black))),
        child: InkWell(
          splashColor: Colors.brown,
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 80.0,
                child: Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 8.0, 0.0),
                      child: Text(
                        description,
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
