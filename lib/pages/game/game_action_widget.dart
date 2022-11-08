part of 'game_page_binding.dart';

class GameActionWidget extends GetWidget<GameController> {
  const GameActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _GameActionButton(
          icon: Icons.refresh,
          onPressed: () {
            controller.reinitialize();
          },
        ),
      ],
    );
  }
}

class _GameActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const _GameActionButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.orange.withOpacity(0.8),
        padding: const EdgeInsets.all(10),
        elevation: 0.0,
      ),
      child: Icon(
        icon,
        size: 42.0,
      ),
    );
  }
}
