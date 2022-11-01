import 'package:flutter/material.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
            backgroundColor: Colors.blue[900],
            elevation: 0,
      ),
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
                            "Panduan",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 24.0),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Image.asset(
                          'assets/tutorial.png',
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cara Penggunaan Hemoscan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Card(
                          color: Colors.blue[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 25.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Langkah 1",
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                CircleAvatar(backgroundColor: Colors.blue[900],radius: 25.0,child: Image.asset('assets/power-on.png')),
                                SizedBox(width: 10.0),
                                Flexible(child: Text("Hidupkan alat Hemosense",style: TextStyle(color: Colors.white),))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Card(
                          color: Colors.blue[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 25.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Langkah 2",
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                CircleAvatar(backgroundColor: Colors.blue[900],radius: 25.0,child: Image.asset('assets/finger.png')),
                                SizedBox(width: 10.0),
                                Flexible(child: Text("Masukan jarimu pada alat Hemosense",style: TextStyle(color: Colors.white),))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Card(
                          color: Colors.blue[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 25.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Langkah 3",
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                CircleAvatar(backgroundColor: Colors.blue[900],radius: 25.0,child: Image.asset('assets/clock.png')),
                                SizedBox(width: 10.0),
                                Flexible(child: Text("Tunggu sesaat, nilai kadar gula, kolesterol dan asam urat anda akan muncul pada layar ",style: TextStyle(color: Colors.white),))
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                )
              ]
            )
          )
      )
    );
  }
}
