import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taxxons/core/theme/app_theme.dart';
import 'package:taxxons/features/auth/presentation/providers/auth_providers.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

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
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        _hPad(context),
        _scaleH(context, 20),
        _hPad(context),
        _scaleH(context, 16),
      ),
      color: AppColors.headerBg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: _scale(context, 16),
              vertical: _scaleH(context, 8),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withAlpha(51)),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Text(
                  'Syfton Innovations',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: _scale(context, 15),
                  ),
                ),
                SizedBox(width: _scale(context, 4)),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: _scale(context, 20),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: _scale(context, 28),
            ),
            onPressed: () => ref.read(authRepositoryProvider).signOut(),
          ),
        ],
      ),
    );
  }
}
