import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with TickerProviderStateMixin {
  Map<String, double> _glucoseValue = {};

  Map<String, double> _cholesterolValue = {};

  Map<String, double> _uricAcidValue = {};

  final _database = FirebaseDatabase.instance.ref();

  late StreamSubscription _glucoseStream;
  late StreamSubscription _cholesterolStream;
  late StreamSubscription _uricAcidStream;

  void _activateGlucoseListeners() {
    _glucoseStream =
        _database.child('UsersData/Max30100/Glukosa').onValue.listen((event) {
      Map<dynamic, dynamic> snapshotsValues =
          event.snapshot.value as Map<dynamic, dynamic>;

      int totalData = 0;

      snapshotsValues.forEach((key, value) {
        totalData += 1;
      });

      Map<String, double> glucoseValues = {};

      for (var i = totalData - 1; i >= 0; i--) {
        glucoseValues[event.snapshot.children.elementAt(i).key.toString()] =
            event.snapshot.children.elementAt(i).value as double;
      }

      // print(glucoseValues);
      setState(() {
        _glucoseValue = glucoseValues;
      });
      
    });
  }

  void _activateCholesterolListeners() {
    _cholesterolStream = _database
        .child('UsersData/Max30100/Kolesterol')
        .onValue
        .listen((event) {
      Map<dynamic, dynamic> snapshotsValues =
          event.snapshot.value as Map<dynamic, dynamic>;

      Map<String, double> cholesterolValues = {};

      snapshotsValues.forEach(
        (key, value) {
          cholesterolValues[key.toString()] = value;
        },
      );
      setState(() {
        _cholesterolValue = cholesterolValues;
      });
    });
  }

  void _activateUricAcidListeners() {
    _uricAcidStream =
        _database.child('UsersData/Max30100/AsamUrat').onValue.listen((event) {
      Map<dynamic, dynamic> snapshotsValues =
          event.snapshot.value as Map<dynamic, dynamic>;

      Map<String, double> uricAcidValues = {};

      snapshotsValues.forEach(
        (key, value) {
          uricAcidValues[key.toString()] = value;
        },
      );
      setState(() {
        _uricAcidValue = uricAcidValues;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _activateCholesterolListeners();
    _activateGlucoseListeners();
    _activateUricAcidListeners();
    super.initState();
  }

  Widget _setGlucoseCategory(double value) {
    if (value >= 0 && value < 100) {
      return Chip(
          labelStyle: TextStyle(color: Colors.white, fontSize: 12.0),
          label: Text("Normal"),
          backgroundColor: Colors.green);
    } else if (value >= 100 && value <= 125) {
      return Chip(
          labelStyle: TextStyle(color: Colors.white, fontSize: 12.0),
          label: Text("Pradiabetes"),
          backgroundColor: Colors.orange[800]);
    } else if (value > 125) {
      return Chip(
          labelStyle: TextStyle(color: Colors.white, fontSize: 12.0),
          label: Text("Curiga Diabetes"),
          backgroundColor: Colors.red);
    } else {
      return Chip(
          labelStyle: TextStyle(color: Colors.white, fontSize: 12.0),
          label: Text("Invalid"),
          backgroundColor: Colors.black);
    }
  }

  Widget _setCholesterolCategory(double value) {
    if (value >= 0 && value < 200) {
      return Chip(
          labelStyle: TextStyle(color: Colors.white, fontSize: 12.0),
          label: Text("Baik"),
          backgroundColor: Colors.green);
    } else if (value >= 200 && value < 240) {
      return Chip(
          labelStyle: TextStyle(color: Colors.white, fontSize: 12.0),
          label: Text("Waspada"),
          backgroundColor: Colors.orange[800]);
    } else if (value >= 240) {
      return Chip(
          labelStyle: TextStyle(color: Colors.white, fontSize: 12.0),
          label: Text("Curiga Diabetes"),
          backgroundColor: Colors.red);
    } else {
      return Chip(
          labelStyle: TextStyle(color: Colors.white, fontSize: 12.0),
          label: Text("Invalid"),
          backgroundColor: Colors.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    ScrollController _scrollControllerGlucose = ScrollController();
    ScrollController _scrollControllerCholesterol = ScrollController();
    ScrollController _scrollControllerUricAcid = ScrollController();

    return Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
            backgroundColor: Colors.blue[900],
            elevation: 0,
            title: Text("Riwayat")),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.blue[900],
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "HemoSense",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 24.0),
                          ),
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                  ),
                  child: TabBar(
                      indicatorWeight: 3.0,
                      labelColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.green,
                      controller: _tabController,
                      tabs: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.blue[800],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0))),
                            child: Tab(
                              text: "Gula Darah",
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.blue[800],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0))),
                            child: Tab(text: "Kolesterol")),
                        Container(
                          child: Tab(text: "Asam Urat"),
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.blue[800],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0))),
                        )
                      ]),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView(
                          controller: _scrollControllerGlucose,
                          children: _glucoseValue.entries
                              .map((element) => Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    elevation: 4,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _setGlucoseCategory(element.value),
                                          Flexible(
                                            child: Column(
                                              children: [
                                                Text(
                                                  element.value
                                                      .toStringAsFixed(1),
                                                  style: TextStyle(
                                                      fontSize: 24.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "mg/dl",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(
                                                  element.key.toString(),
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12.0)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        ListView(
                            controller: _scrollControllerGlucose,
                            children: _cholesterolValue.entries
                                .map((element) => Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      elevation: 4,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            _setCholesterolCategory(
                                                element.value),
                                            Flexible(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    element.value
                                                        .toStringAsFixed(1),
                                                    style: TextStyle(
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "mg/dl",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                                    element.key.toString(),
                                                    style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontSize: 12.0)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList()),
                        Column(
                          children: [
                            Text("Keterangan",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                            SizedBox(height: 5.0),
                            Chip(
                              backgroundColor: Colors.transparent,
                              shape: StadiumBorder(
                                  side: BorderSide(
                                      color:
                                          Color.fromARGB(255, 30, 136, 229))),
                              labelStyle: TextStyle(
                                  color: Colors.blue[600], fontSize: 12.0),
                              label: Text("Laki-Laki: 3.4-7 mg/dl"),
                            ),
                            Chip(
                              backgroundColor: Colors.transparent,
                              shape: StadiumBorder(
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 233, 30, 99))),
                              labelStyle:
                                  TextStyle(color: Colors.pink, fontSize: 12.0),
                              label: Text("Perempuan: 2.4-6 mg/dl"),
                            ),
                            Expanded(
                              child: ListView(
                                  controller: _scrollControllerGlucose,
                                  children: _uricAcidValue.entries
                                      .map((element) => Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0))),
                                            elevation: 4,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 20.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Flexible(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          element.value
                                                              .toStringAsFixed(
                                                                  1),
                                                          style: TextStyle(
                                                              fontSize: 24.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          "mg/dl",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: FittedBox(
                                                      fit: BoxFit.fitWidth,
                                                      child: Text(
                                                          element.key
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              fontSize: 12.0)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ))
                                      .toList()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            )));
  }
}
