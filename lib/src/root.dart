import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/src/app.dart';
import 'package:instagram_clone_flutter/src/pages/login.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext _, AsyncSnapshot<User?> user){
        if(user.hasData) {
          return const App();
        }else {
          return Login();
        }
      return Container();
    });
  }
}
