class Game {
  List<int> rolled = List.filled(22, 0);
  int currentBall = 0;

  void roll(int pins) {
    rolled[currentBall] = pins;
    currentBall++;
  }

  int getScore() {
    int score = 0;
    int thisBall = 0;

    for (int i = 0; i < 10; i++) {
      if (isStrike(thisBall)) {
        score += addTwoNextBalls(score, thisBall);
        thisBall += 1;
      } else if (isSpare(thisBall)) {
        score = addNextBallToScore(score, thisBall);
        thisBall += 2;
      } else {
        score += rolled[thisBall] + rolled[thisBall + 1];
        thisBall += 2;
      }
    }
    return score;
  }

  int addNextBallToScore(int score, int currentBall) {
    score += 10 + rolled[currentBall + 2];
    return score;
  }

  int addTwoNextBalls(int score, int currentBall) {
    score += 10 + rolled[currentBall + 1] + rolled[currentBall + 2];
    return score;
  }

  bool isSpare(int currentBall) => rolled[currentBall] + rolled[currentBall + 1] == 10;

  bool isStrike(int currentBall) => rolled[currentBall] == 10;
}
