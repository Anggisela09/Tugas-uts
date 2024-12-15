import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _currentIndex = 0;

  final List<Map<String, String>> items = [
    {
      'title': 'Skincare - Facial Cleanser',
      'description':
          'Pembersih wajah yang lembut dan efektif membersihkan kotoran tanpa mengeringkan kulit.',
      'price': 'Rp 150,000',
    },
    {
      'title': 'Skincare - Moisturizer',
      'description':
          'Pelembab wajah dengan kandungan hyaluronic acid untuk menjaga kelembaban kulit sepanjang hari.',
      'price': 'Rp 200,000',
    },
    {
      'title': 'Body Care - Body Lotion',
      'description':
          'Lotion tubuh dengan kandungan shea butter untuk kulit lembut dan terhidrasi.',
      'price': 'Rp 120,000',
    },
    {
      'title': 'Body Care - Shower Gel',
      'description':
          'Gel mandi dengan aroma segar dan formula lembut untuk membersihkan tubuh tanpa mengeringkan kulit.',
      'price': 'Rp 100,000',
    },
    {
      'title': 'Bedak - Compact Powder',
      'description':
          'Bedak padat yang memberikan hasil matte dan meratakan warna kulit.',
      'price': 'Rp 80,000',
    },
    {
      'title': 'Shampoo - Anti-Dandruff',
      'description':
          'Shampoo anti ketombe dengan formula yang mengurangi gatal dan menjaga kesehatan kulit kepala.',
      'price': 'Rp 75,000',
    },
    {
      'title': 'Conditioner - Nourishing',
      'description':
          'Conditioner untuk rambut kering dan rusak, memberikan kelembutan dan kilau alami.',
      'price': 'Rp 85,000',
    },
    {
      'title': 'Lip Care - Lip Balm',
      'description':
          'Lip balm dengan kandungan vitamin E untuk menjaga kelembapan bibir sepanjang hari.',
      'price': 'Rp 45,000',
    },
    {
      'title': 'Hair Care - Hair Serum',
      'description':
          'Serum rambut dengan argan oil untuk rambut lebih halus, berkilau, dan bebas frizz.',
      'price': 'Rp 180,000',
    },
    {
      'title': 'Sunscreen - SPF 50',
      'description':
          'Tabir surya dengan perlindungan tinggi terhadap sinar UVA dan UVB untuk mencegah penuaan dini.',
      'price': 'Rp 200,000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kosmetik Page'),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: 'Back to Login',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.pink[50],
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 4,
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.add_shopping_cart,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      items[index]['title']!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    subtitle: Text(
                      items[index]['description']!,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    trailing: Icon(Icons.arrow_forward, color: Colors.pink),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: {
                          'title': items[index]['title'],
                          'description': items[index]['description'],
                          'price': items[index]['price'],
                        },
                      );
                    },
                  ),
                  // Tombol Like, Comment, dan Tambah Keranjang
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Tombol Like
                        IconButton(
                          icon: Icon(Icons.thumb_up, color: Colors.pink),
                          onPressed: () {
                            // Aksi ketika tombol like ditekan
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('You liked the product!')),
                            );
                          },
                        ),
                        // Tombol Comment
                        IconButton(
                          icon: Icon(Icons.comment, color: Colors.pink),
                          onPressed: () {
                            // Aksi ketika tombol comment ditekan
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Comment on this product')),
                            );
                          },
                        ),
                        // Tombol Tambah Keranjang
                        IconButton(
                          icon:
                              Icon(Icons.add_shopping_cart, color: Colors.pink),
                          onPressed: () {
                            // Aksi ketika tombol tambah keranjang ditekan
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Added to cart!')),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/');
        },
        icon: Icon(Icons.logout),
        label: Text('Back to Login'),
        backgroundColor: Colors.pink,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Pesan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifikasi'),
        ],
      ),
    );
  }
}
