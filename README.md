# Bowling Game Documentation

## Introduction

This project implements a simple bowling game in Dart. The game allows players to roll a ball and calculates the score based on standard bowling rules. It covers the basic bowling concepts like strikes, spares, and open frames. This document describes the game's structure, methods, and the corresponding test cases that verify its correctness.

## Game Rules Overview

A standard bowling game consists of 10 frames. In each frame:
- A player has two chances to knock down 10 pins unless a strike is rolled.
- A **strike** occurs when all 10 pins are knocked down in the first roll, granting the player 10 points plus the number of pins knocked down in the next two rolls.
- A **spare** occurs when all 10 pins are knocked down after two rolls, granting 10 points plus the pins knocked down in the next roll.
- An **open frame** is when fewer than 10 pins are knocked down after two rolls, and the player scores the total pins knocked down in the frame.

The maximum score for a perfect game is 300, which requires rolling 12 strikes (10 for the frames and 2 additional rolls for the final frame).

## Class and Methods

### `Game`

The `Game` class simulates a bowling game, keeping track of rolls and calculating the score.

### Properties:
- `List<int> rolled`: A list of size 22 that stores the number of pins knocked down in each roll. It accommodates a maximum of 21 rolls (including bonus rolls for strikes in the 10th frame).
- `int currentBall`: Keeps track of the current ball/roll in the game.

### Methods:

#### `void roll(int pins)`
- Records the number of pins knocked down in each roll.
- **Parameters**:
  - `pins`: Number of pins knocked down in the current roll.

#### `int getScore()`
- Calculates and returns the cumulative score of the game.
- **Returns**: The total score after all frames.

#### `int addNextBallToScore(int score, int currentBall)`
- Adds the score for a spare, including the next roll after the spare.
- **Parameters**:
  - `score`: The current score.
  - `currentBall`: The index of the current frame’s first roll.
- **Returns**: The updated score including the spare bonus.

#### `int addTwoNextBalls(int score, int currentBall)`
- Adds the score for a strike by including the next two rolls.
- **Parameters**:
  - `score`: The current score.
  - `currentBall`: The index of the current frame’s first roll.
- **Returns**: The updated score including the strike bonus.

#### `bool isSpare(int currentBall)`
- Checks if the current frame is a spare.
- **Parameters**:
  - `currentBall`: The index of the current frame’s first roll.
- **Returns**: `true` if the frame is a spare, `false` otherwise.

#### `bool isStrike(int currentBall)`
- Checks if the current frame is a strike.
- **Parameters**:
  - `currentBall`: The index of the current frame’s first roll.
- **Returns**: `true` if the frame is a strike, `false` otherwise.

### Example Usage

```dart
void main() {
  Game game = Game();
  game.roll(10); // Strike
  game.roll(3);
  game.roll(6);
  print(game.getScore()); // Outputs the current score
}
```

## Test Suite

The following test cases ensure that the bowling game logic works correctly under different scenarios.

### Test Structure

The test cases are written using the `package:test/test.dart` framework. Each test verifies that the `Game` class behaves as expected by checking the game's score after various rolls.

### Helper Function

#### `void rollAll(List<int> rolls)`
A helper function to loop through multiple rolls in the game.

```dart
void rollAll(List<int> rolls) {
  for (var pins in rolls) {
    game.roll(pins);
  }
}
```

### Test Cases

#### 1. **Test: Do Nothing**

```dart
test('do no thing', () {
  expect(1, 1);
});
```
- Verifies that the test setup works.

#### 2. **Test: Score is Zero When Roll is Zero**

```dart
test('should get score is zero when roll is zero', () {
  game.roll(0);
  expect(game.getScore(), 0);
});
```
- Verifies that the score remains 0 if no pins are knocked down.

#### 3. **Test: Open Frame Adds Pins**

```dart
test('open frame and add pins', () {
  rollAll([2, 4]);
  expect(game.getScore(), 6);
});
```
- Verifies that the score correctly adds the pins in an open frame.

#### 4. **Test: Spare Adds Next Roll to Score**

```dart
test('when it is spare add next ball to score', () {
  rollAll([4, 6, 3, 0]);
  expect(game.getScore(), 16);
});
```
- Verifies that the next roll’s pins are added after a spare.

#### 5. **Test: A Ten in Two Frames is Not a Spare**

```dart
test('a ten in two frames is not a spare', () {
  rollAll([3, 6, 4, 2]);
  expect(game.getScore(), 15);
});
```
- Verifies that scoring 10 pins over two frames doesn't count as a spare.

#### 6. **Test: Strike Adds Next Two Rolls**

```dart
test('a Strike adds two next balls', () {
  rollAll([10, 3, 2]);
  expect(game.getScore(), 20);
});
```
- Verifies that the next two rolls are added after a strike.

#### 7. **Test: Perfect Game Score is 300**

```dart
test('perfect game score is 300', () {
  for (int i = 0; i < 12; i++) {
    game.roll(10);
  }
  expect(game.getScore(), 300);
});
```
- Verifies the score for a perfect game (12 consecutive strikes).

#### 8. **Test: Random Rolls**

```dart
test('random rolls', () {
  rollAll([3, 4, 2, 3, 4, 1, 1, 2, 10, 2, 3]);
  expect(game.getScore(), 40);
});
```
- Verifies the score after a series of random rolls.

## Resources

For further details on this project and video tutorials, please refer to this [YouTube playlist](https://www.youtube.com/playlist?list=PLZPHP6RGS50NtpHLee-eInDbFqy3P303g).

---

This documentation should provide a clear understanding of how the bowling game is implemented, how to use the `Game` class, and how the test cases verify the logic.
