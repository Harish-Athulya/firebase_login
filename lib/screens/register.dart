import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'validator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 222, 52, 128),
        title: Text(
          'Register user',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Container(
                  // height: 200,
                  padding: EdgeInsets.all(12),
                  // color: Colors.green,
                  child: Form(
                      child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _nameTextController,
                        focusNode: _focusName,
                        validator: ((value) {
                          if(value == null) {
                            return null;
                          }
                          else{
                            return "Invalid Field";
                          }
                        }),
                        decoration: InputDecoration(
                            icon: const Icon(
                                Icons.supervised_user_circle_outlined),
                            hintText: 'Enter your name',
                            labelText: 'Name',
                            border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(10)))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailTextController,
                        focusNode: _focusEmail,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.mail_outline),
                            hintText: 'Enter your mail',
                            labelText: 'Email Id',
                            border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(10)))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          controller: _passwordTextController,
                          focusNode: _focusPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.password),
                            hintText: 'Enter password',
                            labelText: 'Password',
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                              borderSide: new BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            onTap: () {
                              print('Submit Button clicked');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green,
                              ),
                              child: Center(
                                  child: Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              )),
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Image.asset('assets/images/bgImg.jpg'))
                    ],
                  )),
                ),
              );
            }

            return CircularProgressIndicator();
          }),
    );
  }
}
