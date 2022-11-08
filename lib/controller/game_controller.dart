import 'package:get/get.dart';

import '../game_ai/game_ai.dart';
import '../game_ai/game_util.dart';

class GameController extends GetxController {
  var player1Win = 0.obs;
  var player2Win = 0.obs;
  var draw = 0.obs;

  RxList<int> board = List.generate(9, (index) => 0).obs;
  RxInt currentPlayer = GameUtil.Player1.obs;
  RxInt gameResult = GameUtil.NO_WINNER_YET.obs;
  RxBool isAiPlaying = false.obs;
  GameAI ai = GameAI();

  GameController();

  void reinitialize() {
    board.value = List.generate(9, (index) => 0);
    gameResult.value = GameUtil.NO_WINNER_YET;
    currentPlayer.value = GameUtil.Player1;
  }

  Future<void> move(int idx) async {
    board[idx] = currentPlayer.value;
    gameResult.value = GameUtil.checkIfWinnerFound(board);
    togglePlayer();
    if (gameResult.value == GameUtil.NO_WINNER_YET) {
      isAiPlaying.value = true;
      await Future.delayed(const Duration(milliseconds: 1800));
      final _aiMove = await Future(
        () => ai.play(
          board,
          currentPlayer.value,
        ),
      );
      board[_aiMove] = currentPlayer.value;
      isAiPlaying.value = false;
      gameResult.value = GameUtil.checkIfWinnerFound(board);
      togglePlayer();
    }
  }

  bool isEnable(int idx) => board[idx] == GameUtil.EMPTY;

  int getDataAt(int idx) => board[idx];

  void togglePlayer() {
    currentPlayer.value = GameUtil.togglePlayer(currentPlayer.value);
  }

  String? get currentPlayerMove {
    if (currentPlayer.value == GameUtil.Player1) {
      return "Player's move";
    } else if (currentPlayer.value == GameUtil.Player2) {
      return "AI's move";
    }
    return null;
  }

  String? get gameResultStatus {
    final _gameResult = gameResult.value;
    if (_gameResult != GameUtil.NO_WINNER_YET) {
      if (_gameResult == GameUtil.Player1) {
        return "Player  wins";
      } else if (_gameResult == GameUtil.Player2) {
        return "AI wins";
      } else if (_gameResult == GameUtil.DRAW) {
        return "It is a Draw !";
      }
    }
    return null;
  }
}
