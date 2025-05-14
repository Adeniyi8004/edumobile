import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/dimens.dart';

/// A tappable tile that animates its background / scale on hover & selection.
class OptionTile extends StatefulWidget {
  final IconData? icon; // pass one of icon or bigText
  final String? bigText;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const OptionTile({
    Key? key,
    this.icon,
    this.bigText,
    required this.label,
    required this.isActive,
    required this.onTap,
  })  : assert((icon != null) ^ (bigText != null),
            'Provide exactly one of icon or bigText'),
        super(key: key);

  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    // Colors & weights based on active state
    final bgColor =
        widget.isActive ? AppColors.lightGreen : const Color(0xFF242424);
    final fgColor = widget.isActive ? Colors.black : AppColors.lightGreen;
    final textColor = widget.isActive ? Colors.black : AppColors.textOnDark;
    final textWeight = widget.isActive ? FontWeight.bold : FontWeight.w500;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          // scale up slightly when hovering
          transform: Matrix4.identity()..scale(_hovering ? 1.05 : 1.0),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(Dimens.borderRadius),
            boxShadow: _hovering
                ? [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 8,
                    )
                  ]
                : null,
          ),
          padding: const EdgeInsets.all(Dimens.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // icon or bigText
              if (widget.bigText != null)
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: Dimens.heading2,
                    fontWeight: FontWeight.w700,
                    color: fgColor,
                  ),
                  child: Text(widget.bigText!),
                )
              else
                Icon(widget.icon, size: Dimens.iconLarge, color: fgColor),
              const SizedBox(height: Dimens.padding),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: Dimens.bodyText,
                  fontWeight: textWeight,
                  color: textColor,
                ),
                child: Text(widget.label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
