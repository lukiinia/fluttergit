import 'package:flutter/material.dart';

void main() {
  runApp(Register());
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Register> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F7F7),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(14),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Column(
                      children: [
                        Image.asset(
                          'images/logoku.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Mari bergabung!',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.person_outline,
                                  color: Color.fromARGB(255, 84, 80, 80).withOpacity(1),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(8),
                                  )
                                )
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Alamat Email',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Color.fromARGB(255, 84, 80, 80).withOpacity(1),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(8),
                                  )
                                )
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Kata sandi',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.black,
                  )
                )
              ),
            
              SizedBox(height: 0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.lock_clock_outlined,
                                  color: Color.fromARGB(255, 84, 80, 80).withOpacity(1),
                                ),
                              ),
                               Expanded(
                  child: TextFormField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8),
                    )
                  )
                ),
                              Spacer(),
                              SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color.fromARGB(71, 160, 154, 154).withOpacity(1),
                                ),
                              ),
                              SizedBox(width: 8),
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
             
         SizedBox(height: 50), // Add spacing between "Lupa Sandi?" and button
        Container(
          decoration: BoxDecoration(
            color: Colors.brown, // Ganti dengan warna yang diinginkan
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 4), // Mengatur offset untuk box shadow ke bawah
              ),
            ],
          ),
          child: MaterialButton(
              onPressed: () {
                // Tambahkan fungsi yang akan dijalankan saat tombol ditekan
              },
              minWidth: double.infinity, // Lebar tombol mengikuti lebar parent
              height: 60,
              child: Text(
                'Daftar',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
              )
            )
          )
        ),
        SizedBox(height: 40),
    Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    SizedBox(height: 20), // Spasi antara tombol dan teks "Belum punya akun?"
    Text(
      'Sudah punya akun?',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        color: Color(0xFFA39191),
      ),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Register()),
          );
        // Tambahkan fungsi yang akan dijalankan saat teks "Daftar" ditekan
      },
      child: Text(
        'Masuk',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
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
      ),
    );
  }
}
