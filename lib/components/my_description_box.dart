import 'package:flutter/material.dart';
class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    //textStyle
    var  myPrimaryTextStyle = TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var  mySecondaryTextStyle = TextStyle(color: Theme.of(context).colorScheme.primary);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color:Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      padding:  EdgeInsets.all(25),
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery fee
          Column(
            children: [
              Text("Rs. 100", style: TextStyle(color: Colors.grey[690], fontSize: 15)),
              Text("Delivery fee",  style: TextStyle(color: Colors.grey[850], fontSize: 16,fontWeight: FontWeight.bold,)),
            ],
          ),
          //Delivery time
          Column(
            children: [
              Text("1 - 2 Days", style: TextStyle(color: Colors.grey[690], fontSize: 15)),
              Text("Delivery time", style: TextStyle(color: Colors.grey[850], fontSize: 16,fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
