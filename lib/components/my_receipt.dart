import 'package:bookstore/models/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookstore/components/my_button.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Thank you for your order!", style: TextStyle(color: Colors.black),),
              SizedBox(height: 25,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(25),
                child: Consumer<Store> (
                  builder: (context,store,child)  => Text(store.displayCartReceipt(),),
                ),
              ),
              const SizedBox(height: 25,),
              Text("Your order will be delivered within 2 days"),
              const SizedBox(height: 25,),
              MyButton(text: "Go to home", onTap:  () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
              },
        ),

            ],
          ),
        ),
    );
  }
}
