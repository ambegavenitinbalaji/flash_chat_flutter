// import 'package:firebase_auth/firebase_auth.dart';
//
// class AuthenticationHelper {
//   final _auth = FirebaseAuth.instance;
//   final String email;
//   final String passsword;
//
//   Future registerUser(required this.email, required this.password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       return null;
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }
// }
