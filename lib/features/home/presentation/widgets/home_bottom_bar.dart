import 'package:flutter/material.dart';
import 'package:taxxons/core/theme/app_theme.dart';

/// A single action button (Purchase / Sales) in the bottom bar.
class BottomActionButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const BottomActionButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
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
        height: _scaleH(context, 60),
        padding: EdgeInsets.symmetric(horizontal: _scale(context, 16)),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: _scale(context, 16),
                  ),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: _scale(context, 10),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
              ],
            ),
            Icon(Icons.add, color: Colors.white, size: _scale(context, 24)),
          ],
        ),
      ),
    );
  }
}

/// The full bottom bar with Purchase/Sales buttons and Home/Profile navigation.
class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

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
      padding: EdgeInsets.all(_scale(context, 16)),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              BottomActionButton(
                title: 'Purchase',
                subtitle: 'Expense',
                color: AppColors.purchaseRed,
              ),
              SizedBox(width: _scale(context, 16)),
              BottomActionButton(
                title: 'Sales',
                subtitle: '',
                color: AppColors.salesGreen,
              ),
            ],
          ),
          SizedBox(height: _scaleH(context, 16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/icons/home.png',
                    width: _scale(context, 28),
                    height: _scale(context, 28),
                    color: AppColors.headerBg,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: _scale(context, 10),
                      color: AppColors.headerBg,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/icons/account-circle-outline.png',
                    width: _scale(context, 28),
                    height: _scale(context, 28),
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: _scale(context, 10),
                      color: AppColors.secondaryGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
