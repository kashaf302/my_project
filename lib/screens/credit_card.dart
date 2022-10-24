
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';

class CreditCard extends StatefulWidget {
  CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  String cardNumber = '';

  String expiryDate = '';

  String cardHolderName = '';

  String cvvCode = '';
  //String onCreditCardWidgetChange='';

  bool isCvvFocused = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // get onCreditCardWidgetChange => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Make Payment',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            obscureCardNumber: true,
            obscureCardCvv: true,
            height: 200,
            width: MediaQuery.of(context).size.width,
            animationDuration: const Duration(milliseconds: 1000),
            onCreditCardWidgetChange: (CreditCardBrand) {},
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CreditCardForm(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    onCreditCardModelChange: onCreditCardModelChange,
                    themeColor: Colors.orangeAccent,
                    formKey: formKey,
                    //input decoration
                    expiryDateDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expired Date',
                        hintText: 'xx/xx'),
                    cvvCodeDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'xxx'),
                    cardHolderDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder',
                      hintText: 'card holder',
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        primary: Colors.orangeAccent,
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: const Text('Validate',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'halter',
                              package: 'flutter_credit_card',
                            )),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print('valid');
                        } else {
                          print('Invalid');
                        }
                      }),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber:
      creditCardModel.cardNumber;
      expiryDate:
      creditCardModel.expiryDate;
      cardHolderName:
      creditCardModel.cardHolderName;
      cvvCode:
      creditCardModel.cvvCode;
      isCVVFocused:
      creditCardModel.isCvvFocused;
    });
  }
}
