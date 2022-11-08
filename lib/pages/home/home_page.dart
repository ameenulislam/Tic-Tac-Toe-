import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/circle_widget.dart';
import '../../widgets/cross_widget.dart';
import '../game/game_page_binding.dart';

part 'game_title_widget.dart';
part 'StartWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: const [
          Spacer(flex: 2),
          GameTitleWidget(),
          Spacer(),
          StartGame(),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
