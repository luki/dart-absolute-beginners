import 'dart:io';
import 'dart:math';

String getPlayerMove() {
	print("Would you like (R)ock, (P)aper, (S)cissors:");
	String selection = stdin.readLineSync().toUpperCase();

	switch (selection) {
		case "R":
			return "Rock";
			break;
		case "S":
			return "Scissors";
			break;
		case "P":
			return "Paper";
			break;
		default:
			return "Quit";
			break;
	}
}

String getComputerMove() {
	Random rand = new Random();
	int move = rand.nextInt(3);

	switch(move) {
		case 0:
			return "Rock";
			break;
		case 1:
			return "Scissors";
			break;
		case 2:
			return "Paper";
			break;
		default:
			break;
	}
}

	String whoWon(String playerMove, String computerMove) {

			if (playerMove == computerMove) {
				return "Tie";
			} else if (playerMove == "Rock" && computerMove == "Scissors") {
				return "You win";
			} else if (playerMove == "Scissors" && computerMove == "Paper") {
				return "You win";
			} else if (playerMove == "Paper" && computerMove == "Rock") {
				return "You win";
			} else {
				return "Computer wins";
			}

	}

void main() {

	while(true) {
		print("Rock, Paper, Scissors Shoot!");
		String playerMove = getPlayerMove();

		if (playerMove == "Quit") {
			return ;
		}

		print("You played $playerMove");
		String computerMove = getComputerMove();
		print("Computer played $computerMove");
		print(whoWon(playerMove, computerMove));

	}

}
