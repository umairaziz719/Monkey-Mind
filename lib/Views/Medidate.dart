import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Rain.dart';

class Medidate extends StatefulWidget {
  MedidateState createState() => MedidateState();
}

class MedidateState extends State<Medidate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Monkey Mind",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset("assets/medi.png"),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    print("hhh");
                    _showDatePicker(context);
                  },
                  child: Row(
                    children: [
                      Text(
                        "Duration",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Spacer(),
                      Text(
                        time == null
                            ? "25 min"
                            : "" + time.toString() + " mins",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey,
                        size: 15,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    showPicker();
                  },
                  child: Row(
                    children: [
                      Text(
                        "Exercise",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Spacer(),
                      Text(
                        "Morning Rain",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey,
                        size: 15,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Rain()));
                  },
                  minWidth: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Text(
                    "Start Session",
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

  var time;

  // Show the modal that contains the CupertinoDatePicker
  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 300,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: CupertinoTimerPicker(
                      onTimerDurationChanged: (Duration value) {
                        setState(() {
                          time = value.inHours.toString() +
                              ":" +
                              value.inMinutes.toString();
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: CupertinoButton(
                      child: const Text('OK'),
                      onPressed: () => Navigator.of(ctx).pop(),
                    ),
                  ),
                ],
              ),
            ));
  }

  late int selectedValue;

  showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
              child: CupertinoPicker(
            backgroundColor: Colors.white,
            onSelectedItemChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            itemExtent: 32.0,
            children: const [
              Text('Morning Rain'),
              Text('Mindfulness meditation'),
              Text('Kundalini yoga'),
            ],
          ));
        });
  }
}
