import 'package:bookstore/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:bookstore/pages/delivery_progress_page.dart';
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '' ;
  bool isCvvFocused = false;

  //user wants to pay
  void userTappedPay() {
    if(formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) =>  AlertDialog(
            title:Text("Confirm payment"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Card Number: $cardNumber"),
                  Text("Expiry Date: $expiryDate"),
                  Text("Card Holder Name: $cardHolderName"),
                  Text("CVV: $cvvCode")
                ],
              ),
            ),
            actions: [
              //cancel btn
              TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
              //yes btn
              TextButton(onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryProgressPage(),
                  ),
                  );
                  },
                child: Text("Yes")),
            ],
          ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //credit card
            CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange: (p) {},
            ),
            CreditCardForm(cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                  });
                },
                formKey: formKey,
            ),
            //Spacer(),
            const SizedBox(height: 180,),
            MyButton(text: "Pay now", onTap:userTappedPay),
            const SizedBox(height: 25,),
        
          ],
        ),
      ),
    );
  }
}
