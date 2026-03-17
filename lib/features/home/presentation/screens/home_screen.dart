import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/home_header.dart';
import '../widgets/quarter_selector.dart';
import '../widgets/vat_summary_card.dart';
import '../widgets/transaction_item.dart';
import '../widgets/home_bottom_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  double _hPad(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return w < 360 ? 12.0 : w < 480 ? 16.0 : 20.0;
  }

  double _scale(BuildContext context, double base) {
    final w = MediaQuery.of(context).size.width;
    return base * (w / 390).clamp(0.8, 1.3);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 0, elevation: 0),
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(),
            QuarterSelector(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: _hPad(context)),
                child: Column(
                  children: [
                    SizedBox(height: _scale(context, 16)),
                    VatSummaryCards(),
                    SizedBox(height: _scale(context, 16)),
                    TransactionList(),
                  ],
                ),
              ),
            ),
            HomeBottomBar(),
          ],
        ),
      ),
    );
  }
}
