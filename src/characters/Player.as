package characters 
{
	import flash.utils.*;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Masklist;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.Sfx;
	
	import worlds.*;
	import goods.Good;
	
	public class Player extends Entity
	{		
		[Embed(source = '../graphics/player_shoppingcart.png')] private var PLAYER:Class;
		[Embed(source = '../sounds/changedirection.mp3')] private var CHANGEDIRECTION:Class;
		
		public var sprPlayer:Spritemap = new Spritemap(PLAYER, 70, 70);
		
		// Movement speed (pixel / sekunde)
		public var speed:Number = 100;
		public var direction:String = 'none';
		
		// Timer für Speed Up
		public var time:Number = 0;
		public var count:Number = 0;
		
		// Camera Movement
		public var cameraOffset:int = Util.TILE_SIZE * 3;
		
		//TODO: das muss an die Map angepasst werden
		public var mapWidth:int = 15 * Util.TILE_SIZE;
		public var mapHeight:int = 12 * Util.TILE_SIZE;
		
		public var grabX:int;
		public var grabY:int;
		
		public var level:LevelOne;
		
		public var highscore:int = 0;	
		
		private var changeDirection:Sfx = new Sfx(CHANGEDIRECTION);

		
		public function Player() {
			//Animationen
			sprPlayer.add("left", [3], 5, true); 
			sprPlayer.add("right", [0], 5, true); 
			sprPlayer.add("up", [9], 5, true); 
			sprPlayer.add("down", [6], 5, true);
			sprPlayer.add("left_grab_right", [5,3], 5, false);
			sprPlayer.add("left_grab_left", [4,3], 5, false);
			sprPlayer.add("right_grab_right", [2,0], 5, false);
			sprPlayer.add("right_grab_left", [1,0], 5, false);
			sprPlayer.add("up_grab_right", [11,9], 5, false);
			sprPlayer.add("up_grab_left", [10,9], 5, false);
			sprPlayer.add("down_grab_right", [8,6], 5, false);
			sprPlayer.add("down_grab_left", [7,6], 5, false);
			
			super((3 * Util.TILE_SIZE) / 2, (4 * Util.TILE_SIZE) / 2, sprPlayer);
			
			//Typ und Hitbox für Kollisionen
			type = "player";
			setHitbox(Util.TILE_SIZE, Util.TILE_SIZE, 0, 0);
		}
		
		override public function update():void 
		{
			followPlayer();
			
			if (collide("walls",x,y) != null) {
				direction = 'none';
				var exp:Explosion = new Explosion(x + Util.TILE_SIZE / 2, y + Util.TILE_SIZE / 2);
				FP.world.remove(this);  // delete player after crash
				FP.world.add(exp);
				exp.destroyThis();
				setTimeout(killPlayer, 3000); //killPlayer is executed after 3 seconds that exploasion can be seen
			}

			time += FP.elapsed;
			if (time >= 5) {
				speedUp();
			}

			if (Input.check(Key.RIGHT)) {
				changeDirection.play();
				if (direction == 'left') {
					//direktes umdrehen verhindern
				}
				else {
					direction = 'right';
					sprPlayer.play(direction);
				}
			}
			if (Input.check(Key.LEFT)) {
				changeDirection.play();
				if (direction == 'right') {
					//direktes umdrehen verhindern
				}
				else {
					direction = 'left';
					sprPlayer.play(direction);
				}
			}
			if (Input.check(Key.UP)){
				changeDirection.play();
				if (direction == 'down') {
					//direktes umdrehen verhindern
				}
				else {
					direction = 'up';
					sprPlayer.play(direction);
				}
			}
			if (Input.check(Key.DOWN)) {
				changeDirection.play();
				if (direction == 'up') {
					//direktes umdrehen verhindern
				}
				else {
					direction = 'down';
					sprPlayer.play(direction);
				}
			}
			
			//TODO: entfernen
			if (Input.pressed(Key.SPACE)) {
				direction = "none";
			}
			
			if (Input.pressed(Key.Q)) {
				sprPlayer.play(direction);	// set animation to defaul driving, so a click changes to grab animation
				if (direction == "left") {
					sprPlayer.play("left_grab_left");
					grabX = Math.round(x / Util.TILE_SIZE);
					grabY = Math.round(y / Util.TILE_SIZE) + 1;
					grabGood(grabX, grabY);
				}
				if (direction == "right") {
					sprPlayer.play("right_grab_left");
					grabX = Math.round(x / Util.TILE_SIZE);
					grabY = Math.round(y / Util.TILE_SIZE) - 1;
					grabGood(grabX, grabY);
				}
				if (direction == "up") {
					sprPlayer.play("up_grab_left");
					grabX = Math.round(x / Util.TILE_SIZE) + 1;
					grabY = Math.round(y / Util.TILE_SIZE);
					grabGood(grabX, grabY);
				}
				if (direction == "down") {
					sprPlayer.play("down_grab_left");
					grabX = Math.round(x / Util.TILE_SIZE) - 1;
					grabY = Math.round(y / Util.TILE_SIZE);
					grabGood(grabX, grabY);
				}
			}
			
			if (Input.pressed(Key.E)) {
				sprPlayer.play(direction);
				if (direction == "left") {
					sprPlayer.play("left_grab_right");
					grabX = Math.round(x / Util.TILE_SIZE);
					grabY = Math.round(y / Util.TILE_SIZE) - 1;
					grabGood(grabX, grabY);
				}
				if (direction == "right") {
					sprPlayer.play("right_grab_right");
					grabX = Math.round(x / Util.TILE_SIZE);
					grabY = Math.round(y / Util.TILE_SIZE) + 1;
					grabGood(grabX, grabY);
				}
				if (direction == "up") {
					sprPlayer.play("up_grab_right");
					grabX = Math.round(x / Util.TILE_SIZE) + 1;
					grabY = Math.round(y / Util.TILE_SIZE);
					grabGood(grabX, grabY);
				}
				if (direction == "down") {
					sprPlayer.play("down_grab_right");
					grabX = Math.round(x / Util.TILE_SIZE) - 1;
					grabY = Math.round(y / Util.TILE_SIZE);
					grabGood(grabX, grabY);
				}
			}
			
			if (direction == 'right') {
				x += speed * FP.elapsed;
			}
			else if (direction == 'left') {
				x -= speed * FP.elapsed;
			}
			else if (direction == 'up') {
				y -= speed * FP.elapsed;
			}
			else if (direction == 'down') {
				y += speed * FP.elapsed;
			}
			
		}
		
		// Camera Movement function
		public function followPlayer():void
		{
			if (x - FP.camera.x < cameraOffset) {
				if (FP.camera.x > 0) {
					FP.camera.x -= speed * FP.elapsed;
					this.level.highscore.x -= speed * FP.elapsed;
				}
			}
			else if ((FP.camera.x + FP.width) - (x + Util.TILE_SIZE) < cameraOffset) {
				if (FP.camera.x + FP.width < mapWidth) {
					FP.camera.x += speed * FP.elapsed;
					this.level.highscore.x += speed * FP.elapsed;
				}
			}
			if (y - FP.camera.y < cameraOffset) {
				if (FP.camera.y > 0) {
					FP.camera.y -= speed * FP.elapsed;
					this.level.highscore.y -= speed * FP.elapsed;
				}
			}
			else if ((FP.camera.y + FP.width) - (y + Util.TILE_SIZE * 2) < cameraOffset) {
				if (FP.camera.y + FP.width < mapHeight) {
					FP.camera.y += speed * FP.elapsed;
					this.level.highscore.y += speed * FP.elapsed;
				}
			}
		}

		public function grabGood(xPos:int, yPos:int):void {
			//grabGood calls grab function in level
			this.level.grab(xPos, yPos);
		}
		
		private function speedUp():void {
			speed += 10;
			time = 0;
		}
		
		private function killPlayer():void {
			
			FP.world.remove(this);
			level.stopSound();
			FP.world = new MainWrapper(new MainMenu());
		}
		
		public function setLevel(level:LevelOne):void {
			this.level = level;
		}
	}
}