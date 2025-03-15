import 'package:flutter/material.dart';

class Actionpage extends StatelessWidget {
  final int happiness;
  final int cash;
  final int energy;

  const Actionpage({
    super.key,
    required this.happiness,
    required this.cash,
    required this.energy,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String msg, msg1, msg2, gambar;
    if (energy == 1) {
      gambar = "images/happi2.gif";
      msg = "Kamu Bermain dengan kucingmu. Hatimu terisi dengan kebahagiaan";
      msg1 = "happiness +$happiness";
      msg2 = "Cash -$cash";
    } else {
      gambar = "images/kucing_nangis.jpg";
      msg = "Kamu bekerjda keras untuk menghidupi kucingmu";
      msg1 = "happiness -$happiness";
      msg2 = "cash +$cash";
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 65, 210, 250),
        title: Text("Action page"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(gambar, height: 250, width: 250),
            ),
            Text(msg, style: TextStyle(fontSize: 20)),
            Text(msg1, style: TextStyle(fontSize: 20)),
            Text(msg2, style: TextStyle(fontSize: 20)),
            Text("Energy -$energy", style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 7, 53, 139),
                backgroundColor: Color.fromARGB(255, 65, 210, 250),
              ),
              child: Text("kembali"),
            ),
          ],
        ),
      ),
    );
  }
}
