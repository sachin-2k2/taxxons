import 'package:flutter/material.dart';
import 'package:taxxons/core/theme/app_theme.dart';

/// A single amount badge column (label + value).
class AmountColumn extends StatelessWidget {
  final String label;
  final String amount;
  final Color bg;
  final Color amountColor;

  const AmountColumn({
    super.key,
    required this.label,
    required this.amount,
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
    return Container(
      width: _scale(context, 68),
      padding: EdgeInsets.symmetric(
        vertical: _scaleH(context, 8),
        horizontal: _scale(context, 4),
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: _scale(context, 8),
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: _scaleH(context, 2)),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              amount,
              style: TextStyle(
                fontSize: _scale(context, 12),
                fontWeight: FontWeight.bold,
                color: amountColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A single transaction row with name, invoice number, date, and amount badges.
class TransactionItem extends StatelessWidget {
  final Map<String, String> transaction;

  const TransactionItem({super.key, required this.transaction});

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
    final bool isExpense = transaction['type'] == 'expense';
    final Color badgeBg = isExpense ? AppColors.vatPink : AppColors.vatGreen;
    final Color amountColor = isExpense ? Colors.red : Colors.green[700]!;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: _scaleH(context, 10)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _scale(context, 14),
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: _scaleH(context, 2)),
                Text(
                  'In NO: ${transaction['no']}',
                  style: TextStyle(
                    fontSize: _scale(context, 11),
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  transaction['date']!,
                  style: TextStyle(
                    fontSize: _scale(context, 11),
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          AmountColumn(
            label: 'Before Tax',
            amount: transaction['before']!,
            bg: badgeBg,
            amountColor: amountColor,
          ),
          SizedBox(width: _scale(context, 4)),
          AmountColumn(
            label: 'After Tax',
            amount: transaction['after']!,
            bg: badgeBg,
            amountColor: amountColor,
          ),
          SizedBox(width: _scale(context, 4)),
          AmountColumn(
            label: 'Tax Amount',
            amount: transaction['tax']!,
            bg: badgeBg,
            amountColor: amountColor,
          ),
        ],
      ),
    );
  }
}

/// The full transaction list with all sample data.
class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  static const List<Map<String, String>> _transactions = [
    {'name': 'SKN Suppliers', 'no': '45982345', 'date': '23-02-2026', 'before': '4560.50', 'after': '6560.50', 'tax': '2000.00', 'type': 'expense'},
    {'name': 'Abu Suppliers', 'no': '58965424', 'date': '20-02-2026', 'before': '5050.50', 'after': '6000.50', 'tax': '950.00', 'type': 'expense'},
    {'name': 'ADP Enterprises', 'no': '87982310', 'date': '19-02-2026', 'before': '3570.50', 'after': '4580.50', 'tax': '1010.00', 'type': 'income'},
    {'name': 'Alhan Suppliers', 'no': '78956556', 'date': '14-02-2026', 'before': '4560.50', 'after': '6560.50', 'tax': '2000.00', 'type': 'expense'},
    {'name': 'ADP Enterprises', 'no': '87982310', 'date': '12-02-2026', 'before': '3570.50', 'after': '4580.50', 'tax': '1010.00', 'type': 'income'},
    {'name': 'PNK Suppliers', 'no': '89585853', 'date': '10-02-2026', 'before': '3570.50', 'after': '4580.50', 'tax': '1010.00', 'type': 'income'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _transactions
          .map((t) => TransactionItem(transaction: t))
          .toList(),
    );
  }
}
