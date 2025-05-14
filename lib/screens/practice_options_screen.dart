import 'package:edumobile/screens/question_screen.dart';
import 'package:edumobile/widgets/header.dart';
import 'package:edumobile/widgets/option_button.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../theme/app_colors.dart';
import '../theme/dimens.dart';

class PracticeOptionsScreen extends StatefulWidget {
  const PracticeOptionsScreen({super.key});

  @override
  State<PracticeOptionsScreen> createState() => _PracticeOptionsScreenState();
}

class _PracticeOptionsScreenState extends State<PracticeOptionsScreen> {
  int _selectedIndex = 2; // default to "Practice" tab
  int _selectedMode = 0; // 0=random, 1=exam#, 2=topic, 3=in a row

  @override
  Widget build(BuildContext context) {
    const double navBarHeight = 66;

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Dimens.smallPadding),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Dimens.smallPadding),
              Header(screenType: 'practice'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
                child: Text(
                  'Challenge your\nknowledge',
                  style: TextStyle(
                    fontSize: Dimens.heading1,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textOnDark,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: Dimens.smallPadding / 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
                child: Row(
                  children: [
                    Text(
                      'type of question',
                      style: TextStyle(
                        fontSize: Dimens.heading2,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_drop_down, color: AppColors.lightGrey),
                  ],
                ),
              ),

              const SizedBox(height: Dimens.largePadding),

              // ─── 2×2 option grid ───────────────────────────────
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: Dimens.smallPadding,
                mainAxisSpacing: Dimens.smallPadding,
                childAspectRatio: 1.3,
                children: List.generate(4, (i) {
                  switch (i) {
                    case 0:
                      return OptionTile(
                        icon: Icons.shuffle,
                        label: 'Random',
                        isActive: _selectedMode == 0,
                        onTap: () => setState(() => _selectedMode = 0),
                      );
                    case 1:
                      return OptionTile(
                        bigText: '#',
                        label: 'Exam Number',
                        isActive: _selectedMode == 1,
                        onTap: () => setState(() => _selectedMode = 1),
                      );
                    case 2:
                      return OptionTile(
                        icon: Icons.topic,
                        label: 'Topic',
                        isActive: _selectedMode == 2,
                        onTap: () {
                          setState(() => _selectedMode = 2);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const QuestionScreen(),
                            ),
                          );
                        },
                      );
                    default:
                      return OptionTile(
                        icon: Icons.format_list_bulleted_sharp,
                        label: 'In a row',
                        isActive: _selectedMode == 3,
                        onTap: () => setState(() => _selectedMode = 3),
                      );
                  }
                }),
              ),

              const SizedBox(height: Dimens.smallPadding),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: Dimens.largePadding),
                padding: const EdgeInsets.all(Dimens.padding),
                decoration: BoxDecoration(
                  color: const Color(0xFF00ECFF),
                  borderRadius: BorderRadius.circular(Dimens.borderRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mistakes practice',
                      style: TextStyle(
                        fontSize: Dimens.heading3,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textOnLight,
                      ),
                    ),
                    const SizedBox(height: Dimens.smallPadding / 2),
                    Text(
                      "Practice more the very exam exercises which you're doing worse. You're gonna deal with it!",
                      style: TextStyle(
                        fontSize: Dimens.bodyText,
                        color: AppColors.textOnLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
