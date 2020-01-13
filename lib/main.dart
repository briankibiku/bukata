import 'package:bukata/home.dart';
import 'package:flutter/material.dart';
import 'package:bukata/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/LandingPaeg': (context) => LandingPage(),
        '/Home': (context) => HomePage(),
      },
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _auth = FirebaseAuth.instance;

  bool spinner = false;
  String password;
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bukata',
          style: TextStyle(color: Color(0xFF6c0000)),
        ),
        backgroundColor: Colors.white,
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'Login',
                style: TextStyle(fontSize: 28),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                key: Key('emailTextField'),
                decoration: InputDecoration(
                  labelText: 'Enter email',
                ),
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                key: Key('passwordTextField'),
                decoration: InputDecoration(
                  labelText: 'Enter password',
                ),
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                onSaved: (value) => password = value.trim(),
                validator: Validator.validatePassword,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 40.0),
              height: 48.0,
              width: 800.0,
              child: FlatButton(
                key: Key('submitButton'),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  setState(() {
                    spinner = true;
                  });
                  try{
                  final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if(result != null){
                    Navigator.pushNamed(context, '/Home');
                  }
                  setState(() {
                    spinner = false;
                  });
                  }
                  catch(e){
                    Navigator.pushNamed(context, '/LandingPaeg');
                    print(e);
                  }
                  
                },
                color: Color(0xFF6c0000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
