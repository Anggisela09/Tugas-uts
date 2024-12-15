import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil arguments dari navigasi
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(args['title']),
        backgroundColor: Colors.pink, // Warna AppBar pink
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar kotak full dengan warna
            Container(
              width: double.infinity, // Lebar penuh
              height: 250, // Tinggi gambar
              decoration: BoxDecoration(
                color: Colors.pinkAccent, // Warna kotak pink
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.image, // Ikon placeholder
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 20), // Spasi setelah gambar

            // Judul gambar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                args['title'], // Judul sesuai data arguments
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink, // Warna teks judul pink
                ),
              ),
            ),

            SizedBox(height: 10), // Spasi antara judul dan deskripsi

            // Deskripsi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                args['description'] ?? 'No description available.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700], // Warna teks deskripsi abu-abu
                ),
              ),
            ),

            SizedBox(height: 20), // Spasi sebelum harga

            // Keterangan harga
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Harga: ${args['price']}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink, // Warna harga pink
                ),
              ),
            ),

            SizedBox(height: 30), // Spasi sebelum tombol

            // Tombol Add to Cart
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Tindakan saat tombol diklik
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added to cart: ${args['title']}')),
                  );
                },
                child: Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink, // Warna tombol pink
                  foregroundColor: Colors.white, // Warna teks tombol putih
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
