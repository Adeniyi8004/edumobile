import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/dimens.dart';

/// A card widget displaying exam title, current score, and a details button
class CategoryStatsCard extends StatefulWidget {
  const CategoryStatsCard({super.key});

  @override
  _CategoryStatsCardState createState() => _CategoryStatsCardState();
}

/// The State for CategoryStatsCard
class _CategoryStatsCardState extends State<CategoryStatsCard> {
  // 6 categories now
  final List<String> categories = [
    'Social and society',
    'Economics',
    'Law',
    'Social rel.',
    'Civic Education',
    'Government',
  ];

  // One StatsColumn per category
  final List<Widget> statsPerCategory = [
    StatsColumn(), // Social and society
    StatsColumn(), // Economics
    StatsColumn(), // Law
    StatsColumn(), // Social rel.
    StatsColumn(), // Civic Education
    StatsColumn(), // Government
  ];

  int selectedIndex = 0;
  final ScrollController _scrollCtl = ScrollController();
  late final List<GlobalKey> _pillKeys;

  @override
  void initState() {
    super.initState();
    _pillKeys = List.generate(categories.length, (_) => GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.mediumPadding),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimens.borderRadius),
        ),
        padding: const EdgeInsets.only(
          top: Dimens.smallPadding,
          bottom: Dimens.padding,
          left: Dimens.smallPadding,
          right: Dimens.smallPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // category tabs
            Container(
              decoration: BoxDecoration(
                color: AppColors.textOnDark,
                borderRadius: BorderRadius.circular(Dimens.borderRadius),
              ),
              height: 36,
              child: SingleChildScrollView(
                controller: _scrollCtl,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(categories.length, (i) {
                    final isSelected = i == selectedIndex;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.smallPadding),
                      child: GestureDetector(
                        key: _pillKeys[i],
                        onTap: () {
                          setState(() => selectedIndex = i);
                          Scrollable.ensureVisible(
                            _pillKeys[i].currentContext!,
                            duration: const Duration(milliseconds: 300),
                            alignment: 0.5, // center it
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimens.smallPadding,
                            vertical: Dimens.smallPadding,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.white
                                : AppColors.textOnDark,
                            borderRadius:
                                BorderRadius.circular(Dimens.borderRadius),
                          ),
                          child: Text(
                            categories[i],
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: Dimens.bodyText,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: isSelected
                                  ? AppColors.textOnLight
                                  : AppColors.secondarylightText,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            const SizedBox(height: Dimens.smallPadding),

            // ─── stats below for the selected category ───────────────
            statsPerCategory[selectedIndex],
          ],
        ),
      ),
    );
  }
}

/// Put your three rows of stats into one widget so it can be reused
/// for each category.
class StatsColumn extends StatelessWidget {
  const StatsColumn({super.key});

  Widget _statRow({required Widget leading, required String label}) {
    return Row(
      children: [
        leading,
        const Spacer(),
        Text(
          label,
          style: TextStyle(
            fontSize: Dimens.bodyText,
            fontWeight: FontWeight.w400,
            color: AppColors.textOnLight,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.mediumPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _statRow(
            leading: RichText(
              text: TextSpan(
                // “3h 17” large + bold
                text: '3',
                style: TextStyle(
                  fontSize: Dimens.heading2,
                  fontWeight: FontWeight.w700,
                  height: 1.0, // lock line‑height so unit aligns
                  color: AppColors.textOnLight,
                ),
                children: [
                  TextSpan(
                    text: 'h',
                    style: TextStyle(
                      fontSize: Dimens.heading3,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      color: AppColors.secondaryText,
                    ),
                  ),
                  TextSpan(
                    // “3h 17” large + bold
                    text: ' 17',
                    style: TextStyle(
                      fontSize: Dimens.heading2,
                      fontWeight: FontWeight.w700,
                      height: 1.0, // lock line‑height so unit aligns
                      color: AppColors.textOnLight,
                    ),
                  ),
                  // “ min” smaller + medium
                  TextSpan(
                    text: 'min',
                    style: TextStyle(
                      fontSize: Dimens.heading3,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            label: 'Overall Time Spent',
          ),

          const SizedBox(height: Dimens.smallPadding),

          // 2) Variants Solved
          _statRow(
            leading: RichText(
              text: TextSpan(
                // “6” large + bold
                text: '6',
                style: TextStyle(
                  fontSize: Dimens.heading2,
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                  color: AppColors.textOnLight,
                ),
                children: [
                  // “/20” medium
                  TextSpan(
                    text: '/20',
                    style: TextStyle(
                      fontSize: Dimens.heading3,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            label: 'Variants Solved',
          ),

          const SizedBox(height: Dimens.smallPadding),

          // 3) Mistakes Made
          _statRow(
            leading: Text(
              '28',
              style: TextStyle(
                fontSize: Dimens.heading2,
                fontWeight: FontWeight.w700,
                height: 1.0,
                color: AppColors.textOnLight,
              ),
            ),
            label: 'Mistakes Made',
          ),
        ],
      ),
    );
  }
}
