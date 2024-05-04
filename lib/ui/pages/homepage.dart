import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:sijawa/ui/pages/Kategori.dart';
import 'dart:async';



class ListItem {
  final String imagePath;
  final String text;

  ListItem({required this.imagePath, required this.text});
}

var services = ["Kamus", "Quiz", "J-board"];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  final List<List<String>> categoryContentsList = [
    ['Jawa'],
    ['Sandhangan'],
    ['Wilangan'],
    ['Rekan'],
    ['Murda'],
  ];
  List<String> imageAssetNames = [
  'images/aksawa.png',
  'images/sandhangan.png',
  'images/wilangan.png',
  'images/rekan.png',
  'images/rekan.png',
];

  // Contoh daftar teks judul
  List<String> titles = [
    'Aksara Jawa',
    'Sandhangan',
    'Aksara wilangan',
    'Aksara Rekan',
    'Aksara Murda',
  ];

  // Contoh daftar teks deskripsi
  List<String> descriptions = [
    '20 Jenis',
    '20 Jenis',
    '10 Jenis',
    '5 Jenis',
    '8 Jenis',
  ];
  int selectedService = 0;
  int selectedNavBarItem = 0;
  List<bool> isBookmarkedList = [false, false, false, false, false];
  bool isQuizButtonPressed = false;
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
                  GestureDetector(
                  onTap: () {
                    // Navigate to the edit profile page here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfilePage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                  ),
                  SizedBox(width: 8),
                  // Hello, User
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, User!',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // Spacer to create space
                  Spacer(),
                  // Notification Icon
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(14),
                    child: Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(20)),
              // Text
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      'Mau Belajar apa',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      'hari ini?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // Search and Filter Containers
              Padding(padding: EdgeInsets.all(15)),
              Row(
                children: [
                  // Search Container
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
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
                            Icons.search,
                            color: Color.fromARGB(255, 84, 80, 80).withOpacity(1),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Color.fromARGB(255, 110, 103, 103).withOpacity(1),
                            ),
                            decoration: InputDecoration(
                              hintText: 'Pencarian',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Filter Container
                  Spacer(),
                  Container(
                    width: 46,
                    height: 43,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
             SizedBox(height: 10), // Add some spacing
              // List of Services
             Padding(padding: EdgeInsets.all(14)),
           Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: services.asMap().entries.map((entry) {
                  int index = entry.key;
                  String service = entry.value;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedService = index;
                         // Tandai bahwa tombol "Quiz" ditekan
                        if (index == 1) {
                          isQuizButtonPressed = true;
                        } else {
                          isQuizButtonPressed = false;
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 100,
                      decoration: BoxDecoration(
                        color: selectedService == index ? Colors.brown : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.brown),
                      ),
                      child: Center(
                        child: Text(
                          service,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: selectedService == index ? Colors.white : Colors.brown,
                          )
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: isQuizButtonPressed
                    ? Container(
                        height: 300,
                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFF8F5A32),
                          borderRadius: BorderRadius.circular(21),
                          border: Border.all(color: Colors.brown),
                        ),
                        child: Column(
                      children: [
                  SizedBox(height: 10,),
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 50.0),
                      child: Text(
                        'Ayo',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(height: 10,),
               Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 0.0),
                      child: Text(
                        'Belajar',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 0.0),
                      child: Text(
                        'Bersama',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0, top: 40.0),
                              child: ElevatedButton(
                                onPressed: () {
                                 Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => QuizPage()), // Ganti QuizPage() dengan halaman quiz yang sesuai
                                 );
                                 },
                                style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10), 
                                minimumSize: Size(160, 0),// Adjust padding as needed
                                // You can also set other button properties here
                                ),
                                child: Text(
                                  'Main',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Colors.brown,
                                  ),
                                ),
                              ),
                            ),
                            ]
                          ),
                        ),
                      ]
                        )
                        )

             :SizedBox(
  height: 250,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: imageAssetNames.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
        Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => KategoriPage(index: index, categoryContents: categoryContentsList)),
      );
        },
        child: Container(
          width: 250,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(21),
            border: Border.all(color: Colors.brown),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Gambar
              Image.network(
                imageAssetNames[index], // Menggunakan URL gambar sesuai indeks
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 15),

              // Teks Judul (Cetak Tebal)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      titles[index], // Menggunakan teks judul sesuai indeks
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF833F0B),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0),

              // Teks Deskripsi (Cetak Thin)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      descriptions[index], // Menggunakan teks deskripsi sesuai indeks
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    SizedBox(height: 12),

                    // Ikon Bookmark
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isBookmarkedList[index] = !isBookmarkedList[index];
                        });
                      },
                      child: Icon(
                        isBookmarkedList[index] ? Icons.bookmark : Icons.bookmark_outline,
                        color: isBookmarkedList[index] ? Colors.brown : Colors.brown,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  ),
),

              )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.brown,
        buttonBackgroundColor: Colors.brown,
        height: 40,
        items: [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.bookmark_outline, color: Colors.white),
          Icon(Icons.settings_outlined, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            selectedNavBarItem = index;
            if (index == 2) {
        // Pindah ke halaman pengaturan
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
          );
        }
        });
        }
      )
    ),
    
  );
}
}
class SettingsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pengaturan',
          style: TextStyle(
            color: Colors.white,
          ),
          ),
        backgroundColor: Colors.brown,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
             color: Colors.brown,
              ),
        ),
        toolbarHeight: 100.0,
      ),
       body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Umum',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: () {
                // Tambahkan logika untuk menangani klik pada tombol "Akun"
              },
              child: Row(
                children: [
                  Icon(Icons.person_outline, color: Colors.black), // Ganti warna sesuai kebutuhan
                  SizedBox(width: 8),
                  Text(
                    'Akun',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      // Tambahkan logika untuk menangani klik pada tombol "Back"
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text(
              'Notifikasi',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            trailing: Switch(
              value: false, // Ganti dengan logika sesuai pengaturan
              onChanged: (value) {
                // Tambahkan logika yang sesuai untuk mengelola perubahan switch
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: () {
                // Tambahkan logika untuk menangani klik pada tombol "Akun"
              },
              child: Row(
                children: [
                  Icon(Icons.delete_outline, color: Colors.black), // Ganti warna sesuai kebutuhan
                  SizedBox(width: 8),
                  Text(
                    'Hapus akun',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      // Tambahkan logika untuk menangani klik pada tombol "Back"
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.timer_outlined),
            title: Text(
              'Timer Quiz',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            trailing: Switch(
              value: false, // Ganti dengan logika sesuai pengaturan
              onChanged: (value) {
                // Tambahkan logika yang sesuai untuk mengelola perubahan switch
              },
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Masukan',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RatingPage()),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.star_outline, color: Colors.black), // Ganti warna sesuai kebutuhan
                  SizedBox(width: 8),
                  Text(
                    'Penilaian',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  List<bool> starPressed = [false, false, false, false, false];
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            'Umpan Balik',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
        leading: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.grey, 
            onPressed: () {
              Navigator.pop(context);
            }
          ),
        ),
        actions: [],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Divider(
              color: Colors.grey,
              thickness: 8.0,
            ),
          ),
          SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 300, left: 0),
                child: Text(
                  'Berikan',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 208, left: 0),
                    child: Text(
                      'Pengalamanmu',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ]
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // Toggle state ketika bintang ditekan
                      starPressed[index] = !starPressed[index];
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                    child: Stack(
                      children: [
                        // Icon bintang dengan outline (border)
                        Icon(
                          Icons.star_outline,
                          size: 50,
                          color: Colors.grey, // Warna outline yang diinginkan
                        ),
                        // Icon bintang yang diisi (filled) ketika ditekan
                        if (starPressed[index])
                          Icon(
                            Icons.star,
                            size: 50,
                            color:
                                Colors.yellow,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ),
         SizedBox(height: 20),
Container(
  width: 350,
  height: 298,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.brown, width: 2.0),
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.0),
  ),
  padding: EdgeInsets.all(16.0),
  child: TextField(
    controller: textEditingController,
    maxLines: null,
    decoration: InputDecoration(
      border: InputBorder.none,
    ),
  ),
),
SizedBox(height: 30),
Padding(
  padding: const EdgeInsets.only(top: 16.0),
  child: Container(
    width: MediaQuery.of(context).size.width * 0.8, // Lebar tombol 80% dari lebar layar
    child: ElevatedButton(
      onPressed: () {
        // Tambahkan logika untuk menangani tombol kirim
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.brown,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
        'Kirim',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        )
      ),
    ),
  ),
),
        ],
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late ImagePicker _imagePicker;
  late File _image;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _image = File('path/to/default_image.jpg'); // Ganti dengan path gambar default atau kosongkan jika tidak ada default
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });

        // Perbarui widget dengan pemilihan gambar
        _updateProfileImage();
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  
  void _updateProfileImage() {
    // Tambahkan efek transisi ketika gambar diubah
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Gambar Profil Telah Diperbarui'),
      duration: Duration(seconds: 2),
    ));

    // Setelah pemilihan gambar, perbarui widget dengan pemilihan gambar
    if (mounted) {
      setState(() {});
    }
  }

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
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text(
                        'Batal',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Logika untuk menyimpan perubahan profile
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text(
                        'Simpan',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(
                color: Colors.grey,
                thickness: 1.0,
                height: 20,
                indent: 0,
                endIndent: 0,
              ),
              SizedBox(height: 20),
              // GestureDetector for picking image
              GestureDetector(
                onTap: () {
                  _pickImage(); // Call the function to pick an image from the gallery
                },
                child: Container(
                  width: 188,
                  height: 188,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.brown,
                      width: 3.0,
                    ),
                    // ignore: unnecessary_null_comparison
                    image: _image != null
                        ? DecorationImage(
                            image: FileImage(_image),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
              ),
            // Teks Username di pinggir kiri
           SizedBox(height: 80),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Username',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            TextField(
            ),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Alamat Email',
                  style: TextStyle(
                    color: Colors.brown,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            TextField(
            ),
            SizedBox(height: 40),
            // Teks Alamat Email di pinggir kiri
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Kata Sandi',
                  style: TextStyle(
                    color: Colors.brown,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
             TextField(
            ),
            ],
          ),
        ),
      ),
    );
  }
}
class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 205),
            child: Text(
              'Semua Kategori',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child:  Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 5),
              child: Container(
                      width: MediaQuery.of(context).size.width - 5, // Adjusted width
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFF8F5A32),
                        borderRadius: BorderRadius.circular(21),
                        border: Border.all(color: Colors.brown),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 7),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                            child: Text(
                              'Ayo',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0,),
                            child: Text(
                              'Belajar',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 0.0),
                            child: Text(
                              'Bersama',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => QuizPage()), // Replace QuizPage() with the appropriate quiz page
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    minimumSize: Size(120, 0),
                                  ),
                                  child: Text(
                                    'Main',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      color: Colors.brown,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10), // Added space between text and image
                                    Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: Image.asset(
                                                                'images/orang.png',
                                                                width: 150,
                                                                height: 150,
                                                              ),
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 205),
            child: Text(
              'Semua Kategori',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
Stack(
  children: [
    AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 5),
        child: Container(
          width: MediaQuery.of(context).size.width - 25, // Adjusted width
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white, // Ganti warna menjadi putih
            borderRadius: BorderRadius.circular(21),
            border: Border.all(color: Colors.brown),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Text(
                      'Level 1',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 2.0),
                    child: Text(
                      'Aksara jawa',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 2.0),
                    child: Text(
                      'Pasangan',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 2.0),
                    child: Text(
                      'Sandhangan',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  // Add other text widgets as needed
                ],
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(top: 20), // Add margin at the bottom
                child: ElevatedButton(
                 onPressed: () {
               Navigator.push(
               context,
              MaterialPageRoute(builder: (context) => QuizPageLevel1()), // Corrected here
              );
              },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    minimumSize: Size(140, 0),
                  ),
                  child: Text(
                    'Main',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.brown,
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ],
),
Stack(
  children: [
    AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 5),
        child: Container(
          width: MediaQuery.of(context).size.width - 25, // Adjusted width
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white, // Ganti warna menjadi putih
            borderRadius: BorderRadius.circular(21),
            border: Border.all(color: Colors.brown),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Text(
                      'Level 2',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 2.0),
                    child: Text(
                      'Aksara wilangan',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 2.0),
                    child: Text(
                      'Aksara Rekan',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 2.0),
                    child: Text(
                      'Aksara Murda',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  // Add other text widgets as needed
                ],
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(top: 20), // Add margin at the bottom
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    minimumSize: Size(140, 0),
                  ),
                  child: Text(
                    'Main',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.brown,
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ],
),
        ],
      ),
    );
  }
}

class QuizPageLevel1 extends StatefulWidget {
  @override
  _QuizPageLevel1State createState() => _QuizPageLevel1State();
}

class _QuizPageLevel1State extends State<QuizPageLevel1> {
  double timerValue = 1.0;
  late Timer _timer;
  List<Map<String, dynamic>> questionsAndAnswers = [
    {
      'question': "Aksara apa yang digunakan untuk menulis 'ha'?",
      'answers': ['ꦲ', 'ꦕ', 'ꦫ', 'ꦭ'],
      'correctAnswer': 0,
    },
    {
      'question': "Aksara apa yang digunakan untuk menulis 'ka'?",
      'answers': ['ꦭ', 'ꦮ', 'ꦕ', 'ꦠ'],
      'correctAnswer': 2,
    },
    {
      'question': "Bagaimana cara menulis 'Dana' dalam aksara Jawa?",
      'answers': ['ꦢꦤ', 'ꦲꦶꦏꦸ', 'ꦢꦤꦶ', 'ꦢꦤꦺꦴ'],
      'correctAnswer': 2,
    },
    {
      'question': "Sandhangan apa yang digunakan agar 'r' mati",
      'answers': ['ꦲꦂ', 'ꦚꦺ', 'ꦭꦺ', 'ꦮ'],
      'correctAnswer': 3,
    },
  ];

  bool isAnsweredCorrectly = false;
   int currentQuestionIndex = 0;

  

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (timerValue < 0.1) {
            timer.cancel();
            showTimeIsUpDialog();
          } else {
            timerValue -= 0.1;
          }
        });
      },
    );
  }

  void showTimeIsUpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Waktu Anda Sudah Habis"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => QuizPage()),
              );
            },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void checkAnswer(bool isCorrect) {
    setState(() {
      isAnsweredCorrectly = isCorrect;
    });

    if (isCorrect) {
      // Logic untuk jawaban benar, misalnya pindah ke pertanyaan berikutnya
      // Dalam contoh ini, kita hanya menampilkan pesan untuk keperluan demonstrasi
      showCorrectAnswerDialog();
    } else {
      // Logic untuk jawaban salah, misalnya menampilkan pesan peringatan
      // Dalam contoh ini, kita hanya menampilkan pesan untuk keperluan demonstrasi
      showWrongAnswerDialog();
    }
  }

  void showCorrectAnswerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Selamat, jawaban Anda benar!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
               goToNextQuestion(); // Logic untuk pindah ke pertanyaan berikutnya
              },
              child: Text("Lanjutkan"),
            ),
          ],
        );
      },
    );
  }

  void showWrongAnswerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Wah, ayo coba lagi!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Logic untuk memberikan kesempatan mencoba lagi
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
 void goToNextQuestion() {
    setState(() {
      // Reset status jawaban
      isAnsweredCorrectly = false;

      // Pindah ke pertanyaan berikutnya (jika masih ada)
      if (currentQuestionIndex < questionsAndAnswers.length - 1) {
        currentQuestionIndex++;
        timerValue = 1.0; // Reset timer for the next question
        startTimer(); // Start the timer again for the next question
      } else {
        // Jika sudah sampai pertanyaan terakhir, tambahkan logika sesuai kebutuhan
        // Misalnya, tampilkan skor akhir atau kembali ke layar awal
      }
    });
  }



  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Quiz Level 1'),
    ),
    body: Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: LinearProgressIndicator(
              minHeight: 15,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),
              value: timerValue,
              semanticsLabel: 'Linear progress indicator',
            ),
          ),
          SizedBox(height: 20),
          Text(
            questionsAndAnswers[currentQuestionIndex]['question'],
            style: TextStyle(
              color: Colors.brown,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              checkAnswer(true); // Benar jika tombol ini ditekan
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isAnsweredCorrectly ? Colors.green : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.brown),
              ),
              child: Text(
                questionsAndAnswers[currentQuestionIndex]['answers'][0],
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              checkAnswer(false); // Salah jika tombol ini ditekan
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.brown),
              ),
              child: Text(
                questionsAndAnswers[currentQuestionIndex]['answers'][1],
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Tambahkan logic untuk jawaban 3
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.brown),
              ),
              child: Text(
                questionsAndAnswers[currentQuestionIndex]['answers'][2],
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Tambahkan logic untuk jawaban 4
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.brown),
              ),
              child: Text(
                questionsAndAnswers[currentQuestionIndex]['answers'][3],
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}