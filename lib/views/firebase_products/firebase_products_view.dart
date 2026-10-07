import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseProductsView extends StatefulWidget {
  const FirebaseProductsView({super.key});

  @override
  State<FirebaseProductsView> createState() => _FirebaseProductsViewState();
}

class _FirebaseProductsViewState extends State<FirebaseProductsView> {
  final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
      .collection('products')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _productsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: const Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.docs
                .map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return ListTile(
                    leading: data['hasDiscount'] == true
                        ? Icon(Icons.discount)
                        : Icon(Icons.circle),
                    title: Text(data['name']),
                    subtitle: Text(data['brand']),
                    trailing: Text(data['price']),
                  );
                })
                .toList()
                .cast(),
          );
        },
      ),
    );
    ;
  }
}
