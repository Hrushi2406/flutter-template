import 'package:flutter/material.dart';

import 'core/utils/ui_helper.dart';
import 'core/widgets/custom_widgets.dart';
// import 'widgets/custom_widgets.dart';

class ScrollViewTest extends StatefulWidget {
  const ScrollViewTest();

  @override
  _ScrollViewTestState createState() => _ScrollViewTestState();
}

class _ScrollViewTestState extends State<ScrollViewTest> {
  late final ScrollController _scrollController;

  double scrollPosition = 100;
  double down = 100;

  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final offset = _scrollController.offset;
      final value = offset ~/ 80;

      if (_currentIndex != value) {
        _currentIndex = value;
        _scrollController.animateTo(
          value * 100,
          duration: const Duration(milliseconds: 1500),
          curve: Curves.easeInOut,
        );
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: space2x),
        child: Column(
          children: [
            CustomAppBar(
              title: 'Hrushi is most awesome persone I have met in my life',
              actions: [
                Buttons.icon(
                  context: context,
                  icon: Icons.add,
                  semanticLabel: 'add',
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                physics: const ClampingScrollPhysics(),
                controller: _scrollController,
                padding: const EdgeInsets.only(top: 100),
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: space5x);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    'Something $index : Current Index $_currentIndex',
                    style: Theme.of(context).textTheme.bodyText1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
