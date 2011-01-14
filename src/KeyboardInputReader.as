package  
{
	
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class KeyboardInputReader extends Entity
	{
		
		public var stringInput:String;
		public var first:Boolean = true;
		
		public function KeyboardInputReader() 
		{
			
		}
		
		public function getString():String {
			return stringInput;
		}
		
		override public function update():void {
			if (Input.pressed(Key.A)) {
				if (first == true) {
					stringInput = "A";
					first = false;
				}
				else {
					stringInput += "a";
				}
			}
			if (Input.pressed(Key.B)) {
				if (first == true) {
					stringInput = "B";
					first = false;
				}
				else {
					stringInput += "b";
				}
			}
			if (Input.pressed(Key.C)) {
				if (first == true) {
					stringInput = "C";
					first = false;
				}
				else {
					stringInput += "c";
				}
			}
			if (Input.pressed(Key.D)) {
				if (first == true) {
					stringInput = "D";
					first = false;
				}
				else {
					stringInput += "d";
				}
			}
			if (Input.pressed(Key.E)) {
				if (first == true) {
					stringInput = "E";
					first = false;
				}
				else {
					stringInput += "e";
				}
			}
			if (Input.pressed(Key.F)) {
				if (first == true) {
					stringInput = "F";
					first = false;
				}
				else {
					stringInput += "f";
				}
			}
			if (Input.pressed(Key.G)) {
				if (first == true) {
					stringInput = "G";
					first = false;
				}
				else {
					stringInput += "g";
				}
			}
			if (Input.pressed(Key.H)) {
				if (first == true) {
					stringInput = "H";
					first = false;
				}
				else {
					stringInput += "h";
				}
			}
			if (Input.pressed(Key.I)) {
				if (first == true) {
					stringInput = "I";
					first = false;
				}
				else {
					stringInput += "i";
				}
			}
			if (Input.pressed(Key.J)) {
				if (first == true) {
					stringInput = "J";
					first = false;
				}
				else {
					stringInput += "j";
				}
			}
			if (Input.pressed(Key.K)) {
				if (first == true) {
					stringInput = "K";
					first = false;
				}
				else {
					stringInput += "k";
				}
			}
			if (Input.pressed(Key.L)) {
				if (first == true) {
					stringInput = "L";
					first = false;
				}
				else {
					stringInput += "l";
				}
			}
			if (Input.pressed(Key.M)) {
				if (first == true) {
					stringInput = "M";
					first = false;
				}
				else {
					stringInput += "m";
				}
			}
			if (Input.pressed(Key.N)) {
				if (first == true) {
					stringInput = "N";
					first = false;
				}
				else {
					stringInput += "n";
				}
			}
			if (Input.pressed(Key.O)) {
				if (first == true) {
					stringInput = "O";
					first = false;
				}
				else {
					stringInput += "o";
				}
			}
			if (Input.pressed(Key.P)) {
				if (first == true) {
					stringInput = "P";
					first = false;
				}
				else {
					stringInput += "P";
				}
			}
			if (Input.pressed(Key.Q)) {
				if (first == true) {
					stringInput = "Q";
					first = false;
				}
				else {
					stringInput += "q";
				}
			}
			if (Input.pressed(Key.R)) {
				if (first == true) {
					stringInput = "R";
					first = false;
				}
				else {
					stringInput += "r";
				}
			}
			if (Input.pressed(Key.S)) {
				if (first == true) {
					stringInput = "S";
					first = false;
				}
				else {
					stringInput += "s";
				}
			}
			if (Input.pressed(Key.T)) {
				if (first == true) {
					stringInput = "T";
					first = false;
				}
				else {
					stringInput += "t";
				}
			}
			if (Input.pressed(Key.U)) {
				if (first == true) {
					stringInput = "U";
					first = false;
				}
				else {
					stringInput += "u";
				}
			}
			if (Input.pressed(Key.V)) {
				if (first == true) {
					stringInput = "V";
					first = false;
				}
				else {
					stringInput += "v";
				}
			}
			if (Input.pressed(Key.W)) {
				if (first == true) {
					stringInput = "W";
					first = false;
				}
				else {
					stringInput += "w";
				}
			}
			if (Input.pressed(Key.X)) {
				if (first == true) {
					stringInput = "X";
					first = false;
				}
				else {
					stringInput += "x";
				}
			}
			if (Input.pressed(Key.Y)) {
				if (first == true) {
					stringInput = "Y";
					first = false;
				}
				else {
					stringInput += "y";
				}
			}
			if (Input.pressed(Key.Z)) {
				if (first == true) {
					stringInput = "Z";
					first = false;
				}
				else {
					stringInput += "z";
				}
			}
		}
		
	}

}