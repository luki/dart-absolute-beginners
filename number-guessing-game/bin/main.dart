import 'dart:math';
import 'dart:io';

void main() {
  int guess;

  Random rand = new Random(); // Random from dart:math
  int answer = rand.nextInt(100);
  do  {
    print("Enter your guess:");
    String temp = stdin.readLineSync(); // From dart:io
    guess = int.parse(temp); // convert String to Int
    if (guess < answer) {
      print("Too low!");
    } else if (guess > answer) {
      print("Too big!");
    }
  } while (guess != answer);
  print("You got it!");
}
