import 'package:bookstore/components/my_quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/models/cart_item.dart';
import 'package:bookstore/models/store.dart';
import 'package:provider/provider.dart';
class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(
        builder: (context, store, child) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)
          ),
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(cartItem.book.imagePath, height: 130)),
                    SizedBox(width: 10,),
                    //name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartItem.book.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                        SizedBox(height: 8,),
                        Text('Rs. '+ cartItem.book.price.toString()),
                        SizedBox(height: 20,),
                        // increment or decrement quantity
                        QuantitySelector(quantity: cartItem.quantity, book: cartItem.book,
                          onDecrement: () {
                            store.removeFromCart(cartItem);
                          },
                          onIncrement: () {
                            store.addToCart(cartItem.book);
                          },
                        ),
                      ],

                    ),
                  ],
                ),
              ),
            ],
          )
        )
    );
  }
}
