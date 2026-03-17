import 'package:flutter/material.dart';
import 'package:taxxons/core/theme/app_theme.dart';

class QuarterSelector extends StatelessWidget {
  const QuarterSelector({super.key});

  double _hPad(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return w < 360 ? 12.0 : w < 480 ? 16.0 : 20.0;
  }

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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _hPad(context),
        vertical: _scaleH(context, 12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: _scale(context, 18),
                color: Colors.black,
              ),
              SizedBox(width: _scale(context, 8)),
              Text(
                '3rd Quarter 2025',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: _scale(context, 14),
                ),
              ),
              Icon(Icons.keyboard_arrow_down, size: _scale(context, 20)),
            ],
          ),
          Row(
            children: [
              Text(
                'Download',
                style: TextStyle(
                  color: AppColors.headerBg,
                  fontWeight: FontWeight.w600,
                  fontSize: _scale(context, 14),
                ),
              ),
              SizedBox(width: _scale(context, 4)),
              Image.asset(
                'assets/icons/tray-arrow-down.png',
                width: _scale(context, 18),
                height: _scale(context, 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
