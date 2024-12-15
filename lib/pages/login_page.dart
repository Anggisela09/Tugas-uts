import 'package:flutter/material.dart';
import 'list_page.dart'; // Import ListPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Tentukan halaman awal
      routes: {
        '/': (context) => LoginPage(), // Halaman Login
        '/list': (context) => ListPage(), // Halaman ListPage
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.pinkAccent, // Warna appBar pink
      ),
      body: Container(
        // Background dengan warna pink lembut
        color: Color.fromRGBO(255, 216, 222, 1), // Soft pink background
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Gambar logo dan tulisan AS di dalam lingkaran
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Lingkaran dengan gambar logo
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(
                          'assets/images/logo.png'), // Menampilkan logo di dalam lingkaran
                      backgroundColor: const Color.fromARGB(255, 255, 63, 153),
                    ),
                    // Teks AS di atas logo dengan font kosmetik
                    Text(
                      'AS', // Teks yang ditampilkan
                      style: TextStyle(
                        fontFamily:
                            'DancingScript', // Gaya font yang lebih elegan
                        fontSize: 40, // Ukuran font
                        fontWeight: FontWeight.bold, // Ketebalan font
                        color: Colors.white, // Warna teks
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30), // Spasi antara lingkaran dan input
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      // Username Input
                      TextField(
                        controller:
                            usernameController, // Menggunakan controller
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            fontFamily:
                                'DancingScript', // Font yang lebih feminin
                          ),
                          border: OutlineInputBorder(),
                          fillColor: Colors
                              .white, // Mengubah warna kolom menjadi putih
                          filled: true, // Menyebabkan kolom diisi dengan warna
                        ),
                      ),
                      SizedBox(height: 20),
                      // Password Input
                      TextField(
                        controller:
                            passwordController, // Menggunakan controller
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontFamily:
                                'DancingScript', // Font yang lebih feminin
                          ),
                          border: OutlineInputBorder(),
                          fillColor: Colors
                              .white, // Mengubah warna kolom menjadi putih
                          filled: true, // Menyebabkan kolom diisi dengan warna
                        ),
                        obscureText: true, // Menyembunyikan teks password
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Ambil username dan password yang dimasukkan
                    String username = usernameController.text;
                    String password = passwordController.text;

                    // Cek jika username dan password sesuai
                    if (username == 'admin' && password == 'admin') {
                      // Jika login berhasil, navigasi ke ListPage
                      Navigator.pushReplacementNamed(context, '/list');
                    } else {
                      // Jika login gagal, tampilkan snackbar dengan pesan error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid username or password')),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 255, 211,
                            225)), // Menetapkan warna latar belakang tombol
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        horizontal: 150, vertical: 15)), // Padding tombol
                    textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: 18)), // Ukuran font
                  ),
                  child: Text('Login', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
