import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monkey_mind/Views/Login.dart';

class Setting extends StatefulWidget {
  SettingState createState() => SettingState();
}

class SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body:SingleChildScrollView(child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/header.png"),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {},
                minWidth: 80,
                height: 50,
                child: Text(
                  "Personal details",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepPurpleAccent.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              MaterialButton(
                onPressed: () {},
                minWidth: 80,
                height: 50,
                child: Text(
                  "Settings",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepPurpleAccent.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              MaterialButton(
                onPressed: () async{
                  await Amplify.Auth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()));
                },
                minWidth: 80,
                height: 50,
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepPurpleAccent.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("First Name")),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
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
          ),
          Padding(padding: EdgeInsets.only(left: 25),child:Text("Email"),),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
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
          ),

          Padding(padding: EdgeInsets.only(left: 20),child:Text("Country"),),
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.only(left: 10,right: 10),child:TextField(
            decoration: InputDecoration(
              hintText: "Canada",
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
          SizedBox(height: 80,),
          Padding(padding: EdgeInsets.only(left: 10,right: 10),child:MaterialButton(
            onPressed: () {},
            minWidth: MediaQuery.of(context).size.width,
            height: 50,
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.deepPurpleAccent.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
          ),),
        ],
      ),),
    );
  }
}
