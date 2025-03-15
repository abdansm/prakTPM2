import 'package:flutter/material.dart';
import 'package:praktpm2tugas/loginpage2.dart';
import 'package:praktpm2tugas/actionpage.dart';
import 'dart:math';

class Homepage extends StatefulWidget {
  final String username;
  const Homepage({super.key, required this.username});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int energy = 3;
  int happiness = 23;
  int cash = 3000;
  int hari = 1;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 65, 210, 250),
        title: Text("Rumah ${widget.username}"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Loginpage2()),
                (Route<dynamic> route) => false,
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Stats",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Happiness : $happiness",
                    style: TextStyle(fontSize: 20.0),
                  ),

                  Text("Energy : $energy", style: TextStyle(fontSize: 20.0)),
                  Text("Cash : $cash dollar", style: TextStyle(fontSize: 20.0)),
                ],
              ),
            ),
            Text(
              "Ini adalah hari ke-$hari kamu menjadi pemilik kucing",
              style: TextStyle(fontSize: 20),
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (energy < 2) {
                        SnackBar fitbar = SnackBar(
                          content: Text("kamu kelelahan"),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(fitbar);
                      } else {
                        int happi = random(1, 10);
                        int cashi = random(10, 20);
                        int energimin = 2;
                        setState(() {
                          happiness = happiness - happi;
                          cash = cash + cashi;
                          energy = energy - energimin;
                          if (energy == 0) {
                            hari++;
                            energy = 3;
                          }
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => Actionpage(
                                  happiness: happi,
                                  cash: cashi,
                                  energy: energimin,
                                ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 7, 53, 139),
                      backgroundColor: Color.fromARGB(255, 65, 210, 250),
                    ),
                    child: Text("Bekerdja"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      int happi = random(1, 10);
                      int cashi = random(1, 10);
                      int energimin = 1;
                      setState(() {
                        happiness = happiness + happi;
                        cash = cash - cashi;
                        energy = energy - energimin;
                        if (energy == 0) {
                          hari++;
                          energy = 3;
                        }
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => Actionpage(
                                happiness: happi,
                                cash: cashi,
                                energy: energimin,
                              ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 7, 53, 139),
                      backgroundColor: Color.fromARGB(255, 65, 210, 250),
                    ),
                    child: Text("main dgn kucing"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }
}
