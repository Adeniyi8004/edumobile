import 'package:edumobile/theme/app_colors.dart';
import 'package:edumobile/theme/dimens.dart';
import 'package:edumobile/widgets/bottom_nav_bar.dart';
import 'package:edumobile/widgets/header.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _selectedIndex = 2; // default to "Practice" tab
  int? _selectedAnswer;

  @override
  Widget build(BuildContext context) {
    const double navBarHeight = 66;
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Header ──────────────────────────────────────────
            Header(screenType: 'question'),
            SizedBox(
              height: Dimens.largePadding,
            ),
            // ─── Title & Counter ────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
              child: Row(
                children: [
                  Text(
                    'Economics',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.lightGreen,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '#6',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.lightGreen,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
              child: Text(
                'Select the correct judgment about the\nglobal economy from the list below.',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textOnDark,
                  height: 1.4,
                ),
              ),
            ),

            SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
                children: List.generate(_options.length, (i) {
                  final option = _options[i];
                  final selected = _selectedAnswer == i;
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: Dimens.mediumPadding),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () => setState(() => _selectedAnswer = i),
                      child: Container(
                        padding: const EdgeInsets.all(Dimens.padding),
                        decoration: BoxDecoration(
                          color: AppColors.cardColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              selected
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_unchecked,
                              color: selected
                                  ? AppColors.lightGreen
                                  : AppColors.textOnDark,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                option,
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textOnDark,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // ─── Check Answer Button ─────────────────────────────
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // your check answer logic here
                    },
                    child: Text(
                      'Check The Answer',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textOnLight,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),
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

  // dummy list of option texts:
  final List<String> _options = [
    'The functioning of the world economy is based on the international division of labor',
    'The trade balance is the difference between imports and exports for a certain period',
    'State regulation of foreign trade is carried out exclusively by tariff methods',
    'International economic relations are carried out in the form of monetary and credit relations',
  ];
}
