import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/dimens.dart';
import '../screens/home_screen.dart';
import '../screens/practice_options_screen.dart';

/// A bottom navigation bar with animated selection: circles for unselected items,
/// and an expanding pill showing label for the selected item.
class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: 0.0, end: 1.0);
        return FadeTransition(
          opacity:
              animation.drive(tween.chain(CurveTween(curve: Curves.easeInOut))),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem(label: 'Home', icon: Icons.home_outlined),
      _NavItem(label: 'Courses', icon: Icons.school_outlined),
      _NavItem(label: 'Practice', icon: Icons.chrome_reader_mode_outlined),
    ];

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = index == currentIndex;
          return GestureDetector(
            onTap: () {
              onTap(index);
              // Navigate with fade transition
              if (index == 0) {
                Navigator.of(context).pushReplacement(
                  _createRoute(const HomeScreen()),
                );
              } else if (index == 2) {
                Navigator.of(context).pushReplacement(
                  _createRoute(const PracticeOptionsScreen()),
                );
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 50,
              width: isSelected
                  ? (item.label.isNotEmpty ? 80 + item.label.length * 6 : 50)
                  : 50,
              margin: const EdgeInsets.symmetric(
                horizontal: Dimens.smallPadding / 2,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 26, 25, 25),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    size: Dimens.iconNormal,
                    color: Colors.white,
                  ),
                  if (isSelected && item.label.isNotEmpty) ...[
                    const SizedBox(width: Dimens.smallPadding),
                    Text(
                      item.label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final IconData icon;
  const _NavItem({required this.label, required this.icon});
}
