import 'package:flutter/material.dart';
import 'package:sijawa/ui/pages/homepage.dart';

class Tahu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 150.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seberapa',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(131, 63, 11, 0.5),
                fontSize: 40,
              ),
            ),
            SizedBox(height: 0), // Jarak antara kedua teks
            Text(
              'Tahukah kamu?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(131, 63, 11, 0.5),
                fontSize: 40,
              ),
            ),
             SizedBox(height:30), // Jarak antara kedua teks
            Text(
              'Tentang aksara jawa',
              style: TextStyle(
                color: Color.fromRGBO(131, 63, 11, 0.5),
                fontSize: 20,
              ),
            ),
            SizedBox(height:40),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
        GestureDetector(
          onTap: () {
            // Navigate to the homepage when the container is tapped
             Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          );
          },
                child: Container(
                  width: 140, // Sesuaikan ukuran container
                  height: 140,
                  decoration: BoxDecoration(
                    color : Colors. white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color.fromRGBO(186, 97, 29, 0.900), width: 2),
                  ),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          'images/17.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      Text(
                        'Lancar',
                        style: TextStyle(
                          fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(131, 63, 11, 0.6),
                         ),
                         ),
                       ],
                      ),
                ),
               ),
                 Padding(
                   padding: const EdgeInsets.all(15),
                   child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color.fromRGBO(186, 97, 29, 0.900), width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Image.asset(
                          'images/18.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 1),
                        Text(
                          'Sebagian',
                          style: TextStyle(
                           fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(131, 63, 11, 0.6),
                            ),
                        ),
                      ],
                    ),
                  ),
                 ),
              ],
            ),
            SizedBox(height:20),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 140, // Sesuaikan ukuran container
                  height: 140,
                  decoration: BoxDecoration(
                    color : Colors. white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color.fromRGBO(186, 97, 29, 0.900), width: 2),
                  ),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Image.asset(
                          'images/15.png',
                         width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      SizedBox(height: 8),
                      Text(
                        'Hampir ingat',
                        style: TextStyle(
                          fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(131, 63, 11, 0.6),
                        )
                      ),
                    ],
                   ),
                ),
                 Padding(
                   padding: const EdgeInsets.all(15),
                   child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color.fromRGBO(186, 97, 29, 0.900), width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Image.asset(
                          'images/16.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 1),
                        Text(
                          'Tidak sama sekali',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(131, 63, 11, 0.6),
                            ),
                        ),
                      ],
                    ),
                                   ),
                 ),
              ],
            ),  
          ],

        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Tahu(),
  ));
}
