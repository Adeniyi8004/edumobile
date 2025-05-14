import 'package:edumobile/widgets/header.dart';
import 'package:edumobile/widgets/score_card.dart';
import 'package:flutter/material.dart';
import '../widgets/stats_tile.dart';
import '../widgets/bottom_nav_bar.dart';
import '../theme/app_colors.dart';
import '../theme/dimens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // start on Home

  @override
  Widget build(BuildContext context) {
    const double navBarHeight = 66;
    return Scaffold(
      backgroundColor: AppColors.lightGreen,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1) HEADER ROW
            Header(screenType: 'home'),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
              child: RichText(
                textAlign: TextAlign.start, // ← add this
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: Dimens.heading1,
                    height: 1.1,
                    color: AppColors.textOnLight,
                  ),
                  children: [
                    TextSpan(
                      text: 'Social Studies\n',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Exam Preparation',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: Dimens.largePadding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '58',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: Dimens.heading1,
                            fontWeight: FontWeight.w700,
                            height: 0.5, // lock line-height so children align
                            color: AppColors.textOnLight,
                            // fontFamily is inherited from ThemeData
                          ),
                          children: [
                            // Smaller medium “ / 100”
                            TextSpan(
                              text: ' /100',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: Dimens.heading2,
                                fontWeight: FontWeight.w500,
                                height: 0.5,
                                color: AppColors.secondaryText,
                              ),
                            ),
                            TextSpan(
                              text: '\nYour recent score',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: Dimens.heading4,
                                fontWeight: FontWeight.w500,
                                height: 1.0,
                                color: AppColors.textOnLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: Dimens.padding),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimens.borderRadius),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: Dimens.padding,
                          horizontal: Dimens.padding,
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'More Details',
                            style: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: Dimens.bodyText,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textOnDark),
                          ),
                          SizedBox(
                            child: Image.asset(
                              'assets/images/arrow_right.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 3) TOP-STATS TILES
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.mediumPadding,
                  vertical: Dimens.mediumPadding),
              child: Row(
                children: const [
                  Expanded(
                    child: StatsTile(
                      icon: Icons.school_outlined,
                      label: ' topics',
                      value: '3 / 5',
                    ),
                  ),
                  SizedBox(width: Dimens.mediumPadding),
                  Expanded(
                    child: StatsTile(
                      icon: Icons.chrome_reader_mode_outlined,
                      label: ' questions',
                      value: '8 / 16',
                    ),
                  ),
                ],
              ),
            ),

            // 4) CATEGORY SELECTOR
            CategoryStatsCard(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: Dimens.smallPadding),
          child: SizedBox(
            height: navBarHeight,
            width: double.infinity,
            child: BottomNavBar(
              currentIndex: _selectedIndex,
              onTap: (i) => setState(() => _selectedIndex = i),
            ),
          ),
        ),
      ),
    );
  }
}
