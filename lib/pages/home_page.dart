import 'package:flutter/material.dart';
import '../models/katalog.dart';
import 'form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Katalog> data = [];

  void addData(Katalog katalog) {
    setState(() => data.add(katalog));
  }

  void updateData(int index, Katalog katalog) {
    setState(() => data[index] = katalog);
  }

  void deleteData(int index) {
    setState(() => data.removeAt(index));
  }

  void openForm({Katalog? katalog, int? index}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => FormPage(katalog: katalog)),
    );

    if (result != null && result is Katalog) {
      if (katalog == null) {
        addData(result);
      } else {
        updateData(index!, result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
  centerTitle: true,
  elevation: 0,
  title: Image.network('data:image/png;base64,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',
  width: 120,
  fit: BoxFit.contain,
  ),
  flexibleSpace: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF1428A0), Colors.blue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),  
  ),
),
      body: data.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone_android_rounded, size: 70, color: Colors.grey),
                  SizedBox(height: 8),
                  Text('Tambah Dulu', style: TextStyle(fontSize: 17, color: Colors.grey, fontFamily: 'Helvetica')),
                ],
              ),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(
                      item.gambar,
                      width: 60,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item.nama),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rp ${item.harga} • ${item.tahun}'),
                        const SizedBox(height: 20),
                        Text(
                          item.spesifikasi,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.orange),
                          onPressed: () =>
                              openForm(katalog: item, index: index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteData(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => openForm(),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Tambah', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
