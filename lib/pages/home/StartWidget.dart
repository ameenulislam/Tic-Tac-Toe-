part of 'home_page.dart';

class StartGame extends StatelessWidget {
  const StartGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _GameButtonWidget(
          label: "Start",
          onPressed: () {
            Get.to(
              () => const GamePage(),
              binding: GamePageBinding(isMultiPlayer: true),
            );
          },
        ),
        const SizedBox(
          height: 18.0,
        ),
        const Text(
          "Developed with flutter",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}

class _GameButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const _GameButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(240.0),
        shape: const StadiumBorder(),
        elevation: 0.0,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(label),
      ),
    );
  }
}
