import 'package:flutter/material.dart';
import '../models/katalog.dart';

class FormPage extends StatefulWidget {
  final Katalog? katalog;

  const FormPage({super.key, this.katalog});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final namaController = TextEditingController();
  final hargaController = TextEditingController();
  final tahunController = TextEditingController();
  final gambarController = TextEditingController();
  final spesifikasiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.katalog != null) {
      namaController.text = widget.katalog!.nama;
      hargaController.text = widget.katalog!.harga;
      tahunController.text = widget.katalog!.tahun;
      gambarController.text = widget.katalog!.gambar;
      spesifikasiController.text = widget.katalog!.spesifikasi;
    }
  }

  @override
  void dispose() {
    namaController.dispose();
    hargaController.dispose();
    tahunController.dispose();
    gambarController.dispose();
    spesifikasiController.dispose();
    super.dispose();
  }

  void saveData() {
    if (namaController.text.isEmpty ||
        hargaController.text.isEmpty ||
        tahunController.text.isEmpty ||
        gambarController.text.isEmpty ||
        spesifikasiController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua field wajib diisi')),
      );
      return;
    }

    final katalog = Katalog(
      nama: namaController.text,
      harga: hargaController.text,
      tahun: tahunController.text,
      gambar: gambarController.text,
      spesifikasi: spesifikasiController.text,
    );

    Navigator.pop(context, katalog);
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.katalog != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Katalog' : 'Tambah Katalog', style: const TextStyle(color: Colors.white),),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Samsung',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: hargaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Harga',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: tahunController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tahun',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: gambarController,
              decoration: const InputDecoration(
                labelText: 'URL Gambar',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: spesifikasiController,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Spesifikasi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveData,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1428A0),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                isEdit ? 'Update' : 'Simpan',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
