import 'package:test/test.dart';
import '../bin/game.dart';

void main() {
  late Game game;

  // set up
  setUp(() {
    game = Game();
  });

  // Loop through multiple rolls
  void rollAll(List<int> rolls) {
    for (var pins in rolls) {
      game.roll(pins); // Call the roll method for each value in the list
    }
  }

  test('do no thing', () {
    expect(1, 1);
  });

  test('should get score is zero when roll is zero', () {
    // exercise
    game.roll(0);
    // verify
    expect(game.getScore(), 0);
  });

  test(' open frame and add  pins ', () {
    // exercise
    rollAll([2, 4]);
    // verify
    expect(game.getScore(), 6);
  });

  test(' when it is spare add next ball to score', () {
    // exercise
    rollAll([4, 6, 3, 0]);
    // verify
    expect(game.getScore(), 16);
  });

  test(' a ten in two frames is not a spare', () {
    // exercise
    rollAll([3, 6, 4, 2]);
    // verify
    expect(game.getScore(), 15);
  });

  test(' a Strike adds two next  balls ', () {
    // exercise
    rollAll([10, 3, 2]);
    // verify
    expect(game.getScore(), 20);
  });

  test('perfect game score is 300', () {
    for (int i = 0; i < 12; i++) {
      game.roll(10);
    }

    expect(game.getScore(), 300);
  });

  test('perfect game score is 300', () {
    game.roll(3);
    game.roll(4);
    game.roll(2);
    game.roll(3);
    game.roll(4);
    game.roll(1);
    game.roll(1);
    game.roll(2);
    game.roll(10);
    game.roll(2);
    game.roll(3);

    expect(game.getScore(), 40);
  });
}
