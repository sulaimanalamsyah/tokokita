import 'package:flutter/material.dart';
import 'package:tokoKitaIman/model/produk.dart';
import 'package:tokoKitaIman/ui/produk_detail.dart';
import 'package:tokoKitaIman/ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);
  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Produk Sulaiman'),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  child: const Icon(Icons.add, size: 26.0),
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProdukForm()));
                  },
                ))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: const Text('Logout'),
                trailing: const Icon(Icons.logout),
                onTap: () async {},
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            ItemProduk(
                produk: Produk(
                    id: 1,
                    kodeProduk: 'A-0001',
                    namaProduk: 'Iphone 15',
                    hargaProduk: 20000000)),
            ItemProduk(
                produk: Produk(
                    id: 2,
                    kodeProduk: 'A-0002',
                    namaProduk: 'Charger 33W',
                    hargaProduk: 500000)),
            ItemProduk(
                produk: Produk(
                    id: 3,
                    kodeProduk: 'A-0003',
                    namaProduk: 'USB Lightning',
                    hargaProduk: 100000)),
          ],
        ));
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;

  const ItemProduk({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdukDetail(
                      produk: produk,
                    )));
      },
      child: Card(
        child: ListTile(
          title: Text(produk.namaProduk!),
          subtitle: Text(produk.hargaProduk.toString()),
        ),
      ),
    );
  }
}
