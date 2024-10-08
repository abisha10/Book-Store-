import 'package:bookstore/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/models/store.dart';
import 'package:provider/provider.dart';
import 'package:bookstore/components/my_cart_tile.dart';
import 'package:bookstore/pages/payment_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(
        builder: (context,store,child){
          final userCart = store.cart;

          return Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              title: Text("Cart"),
              actions: [
                //clear cart btn
                IconButton(onPressed: (){
                 showDialog(
                     context: context,
                     builder: (context) => AlertDialog(
                       title: Text("Are you sure you want to clear the cart?"),
                       actions: [
                         //cancel btn
                         TextButton(onPressed: () => Navigator.pop(context), child:  Text("Cancel", style: TextStyle(color: Colors.grey[800],),)),
                         //yes btn
                         TextButton(onPressed: (){
                           Navigator.pop(context);
                           store.clearCart();
                         },
                         child:  Text("Yes",style: TextStyle(color: Colors.grey[800]),)),
                       ],
                     ),
                  );
                },
                icon: const Icon(Icons.delete),
                ),
              ],
            ),
            body: Column(
              children: [
                //list of cart
                Expanded(
                  child: Column(
                    children: [
                      userCart.isEmpty
                        ? Expanded(
                          child: Center(child: Text("Cart is empty..",style: TextStyle(fontSize: 18),)))
                        :Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context,index)  {
                                //get individual cart item
                                final cartItem = userCart[index];
                                return MyCartTile(cartItem:cartItem);
                              },
                          ),
                      ),
                    ],
                  ),
                ),
                //btn to pay
                MyButton(text: "Go to checkout", onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()));
                }),
                SizedBox(height: 25,)
              ],
            ),
          );
        },
     );
  }
}
