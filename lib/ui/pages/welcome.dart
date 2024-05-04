import 'package:flutter/material.dart';
import 'package:sijawa/ui/pages/login.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60), // Jarak dari atas
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Image.asset(
                'images/logowel.png',
                width: 300, // Sesuaikan ukuran gambar
                height: 300,
                fit: BoxFit.contain, // Sesuaikan tata letak gambar
              ),
            ),
            SizedBox(height: 90), // Jarak antara gambar dan teks
            Text(
              'Hi! Siap untuk',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 0), // Jarak antara gambar dan teks
            Text(
              'belajar aksara jawa?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Jarak antara gambar dan teks
            Text(
              'Lengkapi profilmu',
              style: TextStyle(
                color: Color.fromRGBO(131, 63, 11, 0.9),
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 40), // Jarak antara teks dan tombol
            FractionallySizedBox(
              widthFactor: 0.8, // Sesuaikan faktor lebar sesuai kebutuhan
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  // Tambahkan fungsi yang akan dijalankan saat tombol ditekan
                },
                height: 60,
                color: Color.fromRGBO(131, 63, 11, 1.0), // Warna tombol
                elevation: 5, // Elevation (box shadow) tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Radius sudut tombol
                ),
                child: Text(
                  'Memulai',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
    Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    SizedBox(height: 20), // Spasi antara tombol dan teks "Belum punya akun?"
    Text(
      'Punya akun?',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        color: Colors.black,
      ),
    ),
    GestureDetector(
      onTap: () {
        // Tambahkan fungsi yang akan dijalankan saat teks "Daftar" ditekan
      },
      child: Text(
        'Masuk',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: Colors.brown,
          decoration: TextDecoration.underline,
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
