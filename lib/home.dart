import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/animations/animations.dart';
import 'core/animations/page_transition.dart';
import 'core/theme/theme_provider.dart';
import 'core/utils/utils.dart';
import 'core/widgets/custom_widgets.dart';
import 'scroll_view_test.dart';
import 'typography.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void toggleSheet(BuildContext context) {
    openBottomSheet(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Something',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  Future<void> toggleDatePicker(BuildContext context) async {
    await openDatePicker(
      context: context,
      initalDate: DateTime.now(),
      startDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
  }

  final List<PageTransitionType> _transitionTypes = const [
    PageTransitionType.fadeIn,
    PageTransitionType.scaleUp,
    PageTransitionType.scaleDown,
    PageTransitionType.scaleUpWithFadeIn,
    PageTransitionType.scaleDownWithFadeIn,
    PageTransitionType.fromTop,
    PageTransitionType.fromLeft,
    PageTransitionType.fromRight,
    PageTransitionType.fromBottom,
    PageTransitionType.none,
  ];

  Widget _generateButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _transitionTypes.map((type) {
        return Buttons.text(
          context: context,
          text: '${enumToString(type)} Navigation',
          onPressed: () => Navigation.push(
            context,
            customPageTransition:
                PageTransition(child: const ScrollViewTest(), type: type),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(banana.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CustomAppBar(
                title: 'Flutter-Template',
              ),
              SizedBox(height: rh(space2x)),
              Text(
                'Animations',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: rh(space2x)),
              const FadeAnimation(
                child: Text('FadeIn Animation'),
              ),
              SizedBox(height: rh(space1x)),
              const ScaleAnimation(
                child: Text('Scale Animation'),
              ),
              SizedBox(height: rh(space1x)),
              const SlideAnimation(
                child: Text('Slide Animation'),
              ),
              SizedBox(height: rh(space1x)),
              const FadeAnimation(
                child: SlideAnimation(
                  intervalStart: 0.2,
                  duration: Duration(milliseconds: 800),
                  child: Text('FadeIn with Slide Animation'),
                ),
              ),
              SizedBox(height: rh(space4x)),
              Text(
                'Page Transitions',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: rh(space2x)),
              _generateButtons(),
              SizedBox(height: rh(space4x)),
              Text(
                'Theme Mode',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: rh(space2x)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Buttons.flexible(
                      context: context,
                      text: 'Light',
                      onPressed: () =>
                          Provider.of<ThemeProvider>(context, listen: false)
                              .useLightTheme(),
                    ),
                  ),
                  SizedBox(width: rw(space1x)),
                  Expanded(
                    child: Buttons.flexible(
                      context: context,
                      text: 'Dark',
                      onPressed: () =>
                          Provider.of<ThemeProvider>(context, listen: false)
                              .useDarkTheme(),
                    ),
                  ),
                  SizedBox(width: rw(space1x)),
                  Expanded(
                    child: Buttons.flexible(
                      context: context,
                      text: 'System',
                      onPressed: () =>
                          Provider.of<ThemeProvider>(context, listen: false)
                              .useSystemTheme(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: rh(space4x)),
              Text(
                'Buttons',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: rh(space2x)),
              Buttons.expanded(
                context: context,
                text: 'Open Bottom Sheet',
                onPressed: () => toggleSheet(context),
              ),
              SizedBox(height: rh(space1x)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Buttons.flexible(
                      context: context,
                      text: 'OPEN DATE PICKER',
                      onPressed: () => toggleDatePicker(context),
                    ),
                  ),
                  SizedBox(width: rw(space1x)),
                  Expanded(
                    child: Buttons.flexible(
                      context: context,
                      text: 'OPEN TIME PICKER',
                      onPressed: () => showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: rh(space1x)),
              Buttons.expandedWithIcon(
                context: context,
                text: 'Explore typography',
                icon: Icons.arrow_forward,
                onPressed: () =>
                    Navigation.push(context, screen: const TypographyScreen()),
              ),
              SizedBox(height: rh(space4x)),
              Text(
                'TextField',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: rh(space2x)),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: 'Email',
                validator: (e) => null,
              ),
              SizedBox(height: rh(space4x)),
              Text(
                'Widgets',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: rh(space2x)),
              const EmptyWidget(),
              SizedBox(height: rh(space4x)),
              const LoadingIndicator(),
              SizedBox(height: rh(space4x)),
              Text(
                'Icon Button',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: rh(space2x)),
              Buttons.icon(
                context: context,
                icon: Icons.star_rate_sharp,
                size: 24,
                semanticLabel: 'Star',
                onPressed: () {},
              ),
              SizedBox(height: rh(space4x)),
              SizedBox(height: rh(space5x)),
              SizedBox(height: rh(space5x)),
            ],
          ),
        ),
      ),
    );
  }
}
