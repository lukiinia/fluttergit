import 'package:flutter/material.dart';

class QuizPageLevel1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Level 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat datang di Quiz Level 1!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika perpindahan halaman atau operasi lainnya di sini
              },
              child: Text('Mulai Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
