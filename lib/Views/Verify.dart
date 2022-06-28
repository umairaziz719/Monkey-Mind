import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monkey_mind/Views/Home.dart';

class Verify extends StatefulWidget {
  VerifyState createState() => VerifyState();
  Verify({required this.email,this.pass});
  var email;
  var pass;
}

class VerifyState extends State<Verify> {
  final _controller = TextEditingController();
  bool _isEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isEnabled = _controller.text.isNotEmpty;
      });
    });
  }

  void _verifyCode(BuildContext context,String code) async {
    try {
      final res = await Amplify.Auth.confirmSignUp(
        username:widget.email,
        confirmationCode: code,
      );
      if (res.isSignUpComplete) {
        // Login user
        final user = await Amplify.Auth.signIn(
            username:widget.email, password:widget.pass);

        if (user.isSignedIn) {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Home()));
        }
      }
    } on AuthException catch (e) {
      _showError(context, e.message);

    }
  }

  void _resendCode(BuildContext context) async {
    try {
      await Amplify.Auth.resendSignUpCode(username:widget.pass);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blueAccent,
          content: Text('Confirmation code resent. Check your email',
              style: TextStyle(fontSize: 15)),
        ),
      );
    } on AuthException catch (e) {
      _showError(context, e.message);
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                Text("You need to verify your email in order to proceed"),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Enter the code sent to your email")),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "                    \t\t\t\t\t       *    *    *    *   *   *",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
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
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 5,
                ),
                MaterialButton(
                  onPressed: () {
                    _verifyCode(context,_controller.text);
                  },
                  minWidth: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Text(
                    "Verify",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.deepPurpleAccent.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
