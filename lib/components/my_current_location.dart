import 'package:flutter/material.dart';
import 'package:bookstore/models/store.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  final textController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(
      title:  Text("Your Location"),
      content:  TextField(
        controller: textController,
        decoration: InputDecoration(hintText: "Enter address.."),
      ),
      actions: [
        // cancel btn
        MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
            child: Text("Cancel"),),
        //save btn
        MaterialButton(
          onPressed: () {
            //update delivery address
            String newAddress = textController.text;
            context.read<Store>().updateDeliveryAddress(newAddress);
            Navigator.pop(context);
            textController.clear();
          },
          child: Text("Save"),)
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver Now",
          style: TextStyle(color: Colors.grey[680],fontSize: 15),),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //address
                Consumer<Store>(
                    builder: (context,store,child) => Text(
                      store.deliveryAddress,
                      style: TextStyle(color: Colors.grey[850],
                          fontWeight: FontWeight.bold,
                          fontSize: 17),),
                ),
                //drop down menu
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
