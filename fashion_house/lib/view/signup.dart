//Please find the references with **reference** tag in the particular place in the implementation
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //***
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
//      appBar: AppBar(
//        backgroundColor: Colors.brown,
//      ),
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/woodone.jpg'),
                  fit: BoxFit.cover)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              //Divider(height: 70.0,),
              SizedBox(height: 50.0,),
             Container(

               child: Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     Text('Sign Up',style:TextStyle(fontSize: 50.0,fontFamily:'DancingScript')),
                   ],
                 ),
               ),
             ),

              Divider(
                height: 70.0,

              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                  child: SizedBox(
                    height: 80.0,
                    child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Please type email';
                        }
                      },
                      onSaved: (input) => _email = input,
                      decoration: InputDecoration(
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),
                          labelText: "email",
                          hintText: "Enter email"),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 5.0),
                  child: SizedBox(
                    height: 80.0,
                    child: TextFormField(
                      obscureText: true,
                      validator: (input) {
                        if (input.length < 6) {
                          return 'Please enter password more than 6 characters';
                        }
                      },
                      onSaved: (input) => _password = input,
                      decoration: InputDecoration(
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),
                          labelText: "Password",
                          hintText: "Enter password"),
                    ),
                  ),
                ),
              ),

              Center(
                child: SizedBox(
                  width: 290.0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.brown)),
                      onPressed: signUp,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20.0,
                              color: Colors.white),
                        ),
                      ),
                      color: Colors.brown,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.brown)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Signin();
                        }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20.0,
                          color: Colors.brown),
                    ),
                  ),
//                    color: Colors.brown[100],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //**reference**
  //In order to do the firebase user authentication i have followed this video https://www.youtube.com/watch?v=bXlMNfwhlwg
  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: _email, password: _password))
            .user;
        user.sendEmailVerification();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Signin();
        }));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
