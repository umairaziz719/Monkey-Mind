import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monkey_mind/Views/Verify.dart';

class Registration extends StatefulWidget {
  RegistrationState createState() => RegistrationState();
}

class RegistrationState extends State<Registration> {
  TextEditingController fn = TextEditingController();
  TextEditingController ln = TextEditingController();
  TextEditingController em = TextEditingController();
  TextEditingController gen = TextEditingController();
  TextEditingController cn = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController pass = TextEditingController();
  var _data;
  Future<String> _onSignup(String name, String email, String pass, String dob,
      String gen, String cn) async {
    try {
      Map<CognitoUserAttributeKey, String> userAttributes = {
        CognitoUserAttributeKey.email: email,
        CognitoUserAttributeKey.name: name,
        CognitoUserAttributeKey.birthdate: dob,
        CognitoUserAttributeKey.gender: gen,
        CognitoUserAttributeKey.custom("country"): cn
        // additional attributes as needed
      };
      await Amplify.Auth.signUp(
        username: email,
        password: pass,
        options: CognitoSignUpOptions(clientMetadata: {
          "email": email.toString(),
          "name": name.toString(),
          "dob": dob.toString(),
          "gender": gen.toString(),
          "country": cn.toString()
        },
        userAttributes: userAttributes),
      );
      return "Register";
    } on AuthException catch (e) {
      _showError(context, e.message);
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
String _selectedValue="Select";
  String _selectedCountry="Canada";
  String date="DD-MM-YYYY";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registration",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text("Email")),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: fn,
                          decoration: InputDecoration(
                            hintText: "First Name",
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
                      ],
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("Last Name"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: ln,
                              decoration: InputDecoration(
                                hintText: "Last Name",
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
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Email"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: em,
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
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Gender"),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (){_showPicker(context);},
                  child:TextField(
                  controller: gen,
                  decoration: InputDecoration(
                    hintText: _selectedValue,
                    enabled: false,
                    filled: true,
                    suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
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
                ),),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Country"),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: ()
                  {
                    _countryPicker(context);
                  },
                  child:TextField(
                  controller: cn,
                  decoration: InputDecoration(
                    hintText: _selectedCountry,
                    enabled: false,
                    filled: true,
                    suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
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
                ),),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Date of Birth"),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (){_countryDatePicker(context);},
                  child:TextField(
                  controller: dob,
                  decoration: InputDecoration(
                    hintText: date,
                    enabled: false,
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
                ),),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Password"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: pass,
                  decoration: InputDecoration(
                    hintText: "Password",
                    enabled: true,
                    filled: true,
                    suffixIcon: Icon(Icons.visibility),
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
                  onPressed: () async{
                   var res=await  _onSignup(fn.text.toString() + ln.text.toString(), em.text,
                        pass.text, dob.text, gen.text, cn.text);
                    if(res=="Register") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Verify(email: em.text,)));
                    }
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
          ),
        ),
      ),
    );
  }
  void _showPicker(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: CupertinoPicker(
            backgroundColor: Colors.white,
            itemExtent: 30,
            scrollController: FixedExtentScrollController(initialItem: 1),
            children: [
              Text('Male'),
              Text('Female'),
              Text('Other'),

            ],
            onSelectedItemChanged: (value) {
              setState(() {
                if(value==1) {
                  _selectedValue ="Female";
                }
                if(value==0) {
                  _selectedValue ="Male";
                }
                if(value==2) {
                  _selectedValue ="Other";
                }
                setState(() {

                });
              });
            },
          ),
        ));
  }
  void _countryPicker(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: CupertinoPicker(
            backgroundColor: Colors.white,
            itemExtent: 30,
            scrollController: FixedExtentScrollController(initialItem: 1),
            children: [
              Text('Pakistan'),
              Text('Canada'),
              Text('Usa'),

            ],
            onSelectedItemChanged: (value) {
              setState(() {
                if(value==1) {
                  _selectedCountry ="Canada";
                }
                if(value==0) {
                  _selectedCountry ="Pakistan";
                }
                if(value==2) {
                  _selectedCountry ="Usa";
                }
                setState(() {

                });
              });
            },
          ),
        ));
  }
  void _countryDatePicker(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              date=value.toString();
              setState(() {

              });
            },
            initialDateTime: DateTime.now(),
          ),
        ));
  }
}

