import 'package:firebase_auth/firebase_auth.dart';

class Authenticate {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future <String> signIn(String email, String password)  async {
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);

      if(result != null) {
        return 'true';
      }
    }
    catch (e) {}
    return email;
  }
  
}