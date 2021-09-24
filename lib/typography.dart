import 'package:flutter/material.dart';
import 'core/widgets/custom_widgets.dart';

import 'core/utils/ui_helper.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: space2x),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(title: 'Typography'),
              SizedBox(height: rh(space2x)),
              Text(
                'This is headline1',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: rh(space2x)),
              Text(
                'This is headline2',
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: rh(space2x)),
              Text(
                'This is headline3',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: rh(space2x)),
              Text(
                'This is headline4',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: rh(space2x)),
              Text(
                'This is headline5',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: rh(space2x)),
              Text(
                'This is headline6',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: rh(space2x)),
              Text(
                'This is subtitle1',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: rh(space2x)),
              Text(
                'This is subtitle2',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              SizedBox(height: rh(space2x)),
              Text(
                'This is caption',
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(height: rh(space2x)),
              Text(
                'This is body Text 1',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: rh(space2x)),
              Text(
                'This is body text 2',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: rh(space2x)),
            ],
          ),
        ),
      ),
    );
  }
}
