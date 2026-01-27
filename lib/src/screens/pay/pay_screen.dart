
import 'package:flutter/material.dart';
import 'package:consumer_app/src/screens/pay/widgets/bill_payment_grid.dart';
import 'package:consumer_app/src/screens/pay/widgets/upi_payment_section.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay & Transfer'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [
            UpiPaymentSection(),
            SizedBox(height: 32),
            BillPaymentGrid(),
          ],
        ),
      ),
    );
  }
}
