import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

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
                            "Pusat Bantuan",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 24.0),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Image.asset(
                          'assets/help-center.png',
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
                          "Pusat Bantuan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "Jika Anda mengalami keluhan silahkan hubungi kontak dibawah",
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          elevation: 5.0,
                          shadowColor: Color.fromARGB(255, 246, 246, 246),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ListTile(
                              leading: Image.asset('assets/hotline.jpg'),
                              title: Text(
                                "Hotline",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          elevation: 5.0,
                          shadowColor: Color.fromARGB(255, 246, 246, 246),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ListTile(
                              leading: Image.asset('assets/consultation.jpg'),
                              title: Text(
                                "Konsultasi Dokter",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          elevation: 5.0,
                          shadowColor: Color.fromARGB(255, 246, 246, 246),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ListTile(
                              leading: Image.asset('assets/hospital.jpg'),
                              title: Text(
                                "Rumah Sakit Terdekat",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
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