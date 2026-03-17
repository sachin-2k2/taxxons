import 'package:flutter/material.dart';
import 'package:taxxons/core/theme/app_theme.dart';

/// A single VAT summary card showing a title, amount, and footer info.
class VatSummaryCard extends StatelessWidget {
  final String title;
  final String amount;
  final String footerLabel;
  final String footerValue;
  final Color bg;
  final Color amountColor;

  const VatSummaryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.footerLabel,
    required this.footerValue,
    required this.bg,
    required this.amountColor,
  });

  double _scale(BuildContext context, double base) {
    final w = MediaQuery.of(context).size.width;
    return base * (w / 390).clamp(0.8, 1.3);
  }

  double _scaleH(BuildContext context, double base) {
    final h = MediaQuery.of(context).size.height;
    return base * (h / 844).clamp(0.8, 1.3);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _scale(context, 10),
          vertical: _scaleH(context, 12),
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: _scale(context, 10),
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: _scaleH(context, 4)),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                amount,
                style: TextStyle(
                  fontSize: _scale(context, 18),
                  fontWeight: FontWeight.bold,
                  color: amountColor,
                ),
              ),
            ),
            SizedBox(height: _scaleH(context, 10)),
            Text(
              footerLabel,
              style: TextStyle(
                fontSize: _scale(context, 8),
                color: Colors.black54,
              ),
            ),
            Text(
              footerValue,
              style: TextStyle(
                fontSize: _scale(context, 8),
                fontWeight: FontWeight.bold,
                color: amountColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A row of three VAT summary cards displayed side by side.
class VatSummaryCards extends StatelessWidget {
  const VatSummaryCards({super.key});

  double _scale(BuildContext context, double base) {
    final w = MediaQuery.of(context).size.width;
    return base * (w / 390).clamp(0.8, 1.3);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VatSummaryCard(
          title: 'Input VAT',
          amount: 'AED 4000',
          footerLabel: 'Total purchase',
          footerValue: 'AED 505000',
          bg: AppColors.vatPink,
          amountColor: Colors.red,
        ),
        SizedBox(width: _scale(context, 12)),
        VatSummaryCard(
          title: 'Output VAT',
          amount: 'AED 10000',
          footerLabel: 'Total sales',
          footerValue: 'AED 625000',
          bg: AppColors.vatGreen,
          amountColor: Colors.green[700]!,
        ),
        SizedBox(width: _scale(context, 12)),
        VatSummaryCard(
          title: 'VAT Payable',
          amount: 'AED 6000',
          footerLabel: 'Due On',
          footerValue: '28-08-2025',
          bg: AppColors.vatCyan,
          amountColor: AppColors.brandBlue,
        ),
      ],
    );
  }
}
