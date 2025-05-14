import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/dimens.dart';
import '../theme/app_colors.dart';

class Header extends StatelessWidget {
  /// e.g. 'home', 'practice', 'question', etc.
  final String screenType;

  const Header({
    Key? key,
    required this.screenType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1) leading widget based on screenType
    Widget leading;
    if (screenType == 'practice') {
      leading = Text(
        'Practice',
        style: TextStyle(
          fontFamily: 'Outfit',
          fontSize: Dimens.heading2,
          fontWeight: FontWeight.bold,
          color: AppColors.lightGrey,
        ),
      );
    } else if (screenType == 'question') {
      leading = _CircleIcon(
        child: Icon(
          CupertinoIcons.back,
          color: AppColors.textOnDark,
          size: 30,
        ),
      );
    } else {
      leading = Text(
        'Hello,\nAlexandra!',
        style: TextStyle(
          fontFamily: 'Outfit',
          fontSize: Dimens.heading3,
          fontWeight: FontWeight.w500,
          height: 1.2,
          color: AppColors.textOnLight,
        ),
      );
    }

    // 2) right circle background color
    final bool isHome = screenType == 'home';
    final rightBgColor = AppColors.textOnDark;
    final rightBorderColor =
        isHome ? AppColors.lightGreen : AppColors.lightGrey;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.smallPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── LEFT ─────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.padding,
              vertical: Dimens.smallPadding,
            ),
            child: leading,
          ),

          // ── RIGHT ────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.padding,
              vertical: Dimens.smallPadding,
            ),
            child: SizedBox(
              height: Dimens.iconLarge * 2,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // user avatar remains the same
                  Positioned(
                    right: Dimens.iconLarge * 1.5,
                    top: 0,
                    child: CircleAvatar(
                      radius: Dimens.iconLarge,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=12',
                      ),
                    ),
                  ),

                  // grid/menu or other icon container
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: Dimens.iconLarge * 2,
                      height: Dimens.iconLarge * 2,
                      decoration: BoxDecoration(
                        color: rightBgColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: rightBorderColor,
                          width: 2,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.grid_view_outlined,
                        size: Dimens.iconLarge,
                        color: AppColors.textOnLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A little round container for icons (used for the back arrow)
class _CircleIcon extends StatelessWidget {
  final Widget child;
  const _CircleIcon({required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Navigator.of(context).pop,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF1E1E1E),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(8),
        child: child,
      ),
    );
  }
}
