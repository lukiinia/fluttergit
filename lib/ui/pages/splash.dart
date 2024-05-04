import 'package:flutter/material.dart';
import 'package:sijawa/ui/pages/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigasi ke halaman berikutnya setelah selesai animasi
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Welcome()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Center(
            child: ClipPath(
              clipper: HalfCircleClipper(_animationController.value),
              child: child,
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ganti widget ini dengan logo atau gambar splash screen Anda
           Image.asset(
              'images/logoku2.png', // Ganti dengan path gambar Anda
              width: 400,
              height: 400,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final double animationValue;

  HalfCircleClipper(this.animationValue);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.addArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height), radius: size.height),
      0,
      -animationValue * 3.14,
    );
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
