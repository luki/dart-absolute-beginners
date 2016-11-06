import 'dart:math';

void main() {

	const int trials = 1000000;
	int correct = 0;
	Random rand = new Random();
	for (int i = 0; i < trials; i++) {
		int randDoor = rand.nextInt(3) + 1;
		int guess = 1; // We guess door one
		int eliminated;

		if (randDoor == 2) {
			eliminated = 3; // door 3 eliminated
		} else if (randDoor == 3) {
			eliminated = 2; // door 2 eliminated
		} else {
			eliminated = rand.nextInt(2) + 2;
		}

		if (eliminated == 2) {
			guess = 3;
		} else if (eliminated == 3) {
			guess = 2;
		}

		if (guess == randDoor ) {
			correct++;
		}
	}

	print("The percentage of correct guesses was ${(correct / trials) * 100}%");

}
