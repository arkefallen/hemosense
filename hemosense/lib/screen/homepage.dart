import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _glucoseValue = "-";

  String _cholesterolValue = '-';

  String _uricAcidValue = "-";

  final _database = FirebaseDatabase.instance.ref();

  late StreamSubscription _glucoseStream;
  late StreamSubscription _cholesterolStream;
  late StreamSubscription _uricAcidStream;

  void _activateGlucoseListeres() {
    _glucoseStream =
        _database.child('UsersData/Max30100/Glukosa').onValue.listen((event) {
      final snapshots = event.snapshot.children;
      String glucoseValue =
          snapshots.elementAt((snapshots.length) - 1).value.toString();
      double convertedGlucoseValue = double.parse(glucoseValue);
      setState(() {
        _glucoseValue = convertedGlucoseValue.toStringAsFixed(1);
      });
    });
  }

  void _activateCholesterolListeners() {
    _cholesterolStream = _database
        .child('UsersData/Max30100/Kolesterol')
        .onValue
        .listen((event) {
      final snapshots = event.snapshot.children;
      String cholesterolValue =
          snapshots.elementAt((snapshots.length) - 1).value.toString();
      double convertedCholesterolValue = double.parse(cholesterolValue);
      setState(() {
        _cholesterolValue = convertedCholesterolValue.toStringAsFixed(1);
      });
    });
  }

  void _activateUricAcidListeners() {
    _uricAcidStream =
        _database.child('UsersData/Max30100/AsamUrat').onValue.listen((event) {
      final snapshots = event.snapshot.children;
      String uricAcidValue =
          snapshots.elementAt((snapshots.length) - 1).value.toString();
      double convertedUricAcidValue = double.parse(uricAcidValue);
      setState(() {
        _uricAcidValue = convertedUricAcidValue.toStringAsFixed(1);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _activateCholesterolListeners();
    _activateGlucoseListeres();
    _activateUricAcidListeners();
    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    _cholesterolStream.cancel();
    _glucoseStream.cancel();
    _uricAcidStream.cancel();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.account_circle_rounded, color: Colors.blue[900],),
                    const SizedBox(width: 8.0),
                    Text(
                      "Hi, Selamat Datang!",
                      style: TextStyle(
                          color: Colors.blue[900], fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: 45.0,
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.blue[900],
          ),
          child: ListView(
            children: [
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Image.asset(
                        'assets/Logoo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Flexible(
                      child: Image.asset(
                        'assets/logo-white-2.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(height: 20.0),
                        Text(
                          "Kesehatan Anda Terbaru",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 120.0,
                          decoration: BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 23.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        "Gula Darah",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        _glucoseValue,
                                        style: TextStyle(
                                            fontSize: 36.0,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        "mg/dl",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                                const Flexible(child: SizedBox(width: 30.0)),
                                Column(
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        "Kolesterol",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        _cholesterolValue,
                                        style: TextStyle(
                                            fontSize: 36.0,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Text(
                                      "mg/dl",
                                      style: TextStyle(
                                          // fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                const Flexible(
                                    child: SizedBox(
                                  width: 30.0,
                                )),
                                Column(
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        "Asam Urat",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        _uricAcidValue,
                                        style: TextStyle(
                                            fontSize: 36.0,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        "mg/dl",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Expanded(
                            child: GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, mainAxisSpacing: 10.0),
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, '/history'),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0.0, 4.0),
                                              blurRadius: 10.0,
                                              spreadRadius: 1.0,
                                              color: Color.fromARGB(
                                                  255, 202, 201, 201))
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                            radius: 35.0,
                                            backgroundColor: Colors.white,
                                            child: Image.asset(
                                                "assets/history.png",
                                                fit: BoxFit.cover)),
                                        Text("Riwayat")
                                      ],
                                    ),
                                  ),
                                )),
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, '/help'),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0.0, 4.0),
                                              blurRadius: 10.0,
                                              spreadRadius: 1.0,
                                              color: Color.fromARGB(
                                                  255, 202, 201, 201))
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                            radius: 35.0,
                                            backgroundColor: Colors.white,
                                            child: Image.asset(
                                                "assets/help-center-blue.png",
                                                fit: BoxFit.cover)),
                                        Text("Bantuan")
                                      ],
                                    ),
                                  ),
                                )),
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, '/tutorial'),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0.0, 4.0),
                                              blurRadius: 10.0,
                                              spreadRadius: 1.0,
                                              color: Color.fromARGB(
                                                  255, 202, 201, 201))
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                            radius: 35.0,
                                            backgroundColor: Colors.white,
                                            child: Image.asset(
                                                "assets/tutorial-blue.png",
                                                fit: BoxFit.cover)),
                                        Text("Panduan")
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

// Widget listItem({required Map sensor}) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 23.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Flexible(
//           child: Column(
//             children: const [
//               FittedBox(
//                 fit: BoxFit.fitWidth,
//                 child: Text(
//                   "Gula Darah",
//                   style: TextStyle(
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//               ),
//               FittedBox(
//                 fit: BoxFit.fitWidth,
//                 child: Text(
//                   sensor.containsValue(value),
//                   style: TextStyle(
//                       fontSize: 36.0,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.white),
//                 ),
//               ),
//               FittedBox(
//                 fit: BoxFit.fitWidth,
//                 child: Text(
//                   "mg/dl",
//                   style: TextStyle(
//                       fontSize: 12.0,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.white),
//                 ),
//               )
//             ],
//           ),
//         ),
//         const Flexible(child: SizedBox(width: 50.0)),
//         Flexible(
//           child: Column(
//             children: const [
//               FittedBox(
//                 fit: BoxFit.fitWidth,
//                 child: Text(
//                   "Kolesterol",
//                   style: TextStyle(
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//               ),
//               FittedBox(
//                 fit: BoxFit.fitWidth,
//                 child: Text(
//                   "242",
//                   style: TextStyle(
//                       fontSize: 36.0,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.white),
//                 ),
//               ),
//               Text(
//                 "mg/dl",
//                 style: TextStyle(
//                     // fontSize: 12.0,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.white),
//               )
//             ],
//           ),
//         ),
//         const Flexible(
//             child: SizedBox(
//           width: 50.0,
//         )),
//         Flexible(
//           child: Column(
//             children: const [
//               FittedBox(
//                 fit: BoxFit.fitWidth,
//                 child: Text(
//                   "Asam Urat",
//                   style: TextStyle(
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//               ),
//               FittedBox(
//                 fit: BoxFit.fitWidth,
//                 child: Text(
//                   "9,8",
//                   style: TextStyle(
//                       fontSize: 36.0,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.white),
//                 ),
//               ),
//               FittedBox(
//                 fit: BoxFit.fitWidth,
//                 child: Text(
//                   "mg/dl",
//                   style: TextStyle(
//                       fontSize: 12.0,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.white),
//                 ),
//               )
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }
