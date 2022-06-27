import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monkey_mind/Views/Registration.dart';
import 'package:monkey_mind/Views/Verify.dart';

import 'Home.dart';

class Login extends StatefulWidget {
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  Future<String> _onLogin(String email,String password) async {
    try {
      final res = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      if (res.isSignedIn){
        // Login user
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Home()));
      }

      return "Login";
    } on AuthException catch (e) {
      if (e.message.contains('already a user which is signed in')) {
        await Amplify.Auth.signOut();
        _showError(context, e.toString());
        return 'Problem logging in. Please try again.';

      }
      _showError(context, e.message.toString());
      return '${e.message} - ${e.recoverySuggestion}';
    }
  }
  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          message,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset("assets/monkeylogo.png"),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(padding: EdgeInsets.only(left: 20), child: Text("Email")),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Email@email.com",
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.purple,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20), child: Text("Password")),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: pass,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.visibility),
                  hintText: "Password",
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.purple,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text("Forget Your Password?"),
              ),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                onPressed: () {
                  // Amplify.Auth.signOut();
                  _onLogin(email.text, pass.text);
                  // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Home()));
                  },
                minWidth: MediaQuery.of(context).size.width,
                height: 50,
                child: Text("Login"),
                color: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text("Don't Have an Account?"),
              ),
              SizedBox(
                height: 5,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Registration()));
                },
                minWidth: MediaQuery.of(context).size.width,
                height: 50,
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepPurpleAccent.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              )
            ],
          ),
        )));
  }
}
