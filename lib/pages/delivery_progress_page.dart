import 'package:flutter/material.dart';
import 'package:bookstore/components/my_receipt.dart';
import 'package:bookstore/services/database/firestore.dart';
import 'package:provider/provider.dart';
import 'package:bookstore/models/store.dart';
class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  //get access to db
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    //if we get to this page, submit order to database
    String receipt = context.read<Store>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: Text("  ", ), centerTitle: true,),
      //bottomNavigationBar: _buildBottomNavBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyReceipt(),
          ],
        ),
      ),
    );
  }
}
