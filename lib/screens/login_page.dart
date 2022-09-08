import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/screens/register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
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
          onPressed: () {},
          icon: Icon(Icons.menu_outlined),
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 222, 52, 128),
        title: Text(
          'Athulya Login',
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ElevatedButton(
                                onPressed: () {
                                  /* if(_formkey.currentState!.validate()) {
                                        User? user = await FireAuth.signInUsingEmailPassword(
                                          email: _emailTextController.text,
                                          password: _passwordTextController.text
                                        )
                                      } */
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ElevatedButton(
                                onPressed: () {
                                  _focusEmail.unfocus();
                                  _focusPassword.unfocus();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Register()));
                                  /* if(_formkey.currentState!.validate()) {
                                        User? user = await FireAuth.signInUsingEmailPassword(
                                          email: _emailTextController.text,
                                          password: _passwordTextController.text
                                        )
                                      } */
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Image.asset('assets/images/bgImg2.jpg'))
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
