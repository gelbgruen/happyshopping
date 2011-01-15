package characters 
{
	import flash.text.TextField;
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
		[Embed(source = '../sounds/changedirection.mp3')] private var CHANGEDIRECTION:Class;
		
		[Embed(source = '../graphics/cart_new.png')] private var CART:Class;
		[Embed(source = '../graphics/cart_collision_map.png')] private var CART_COLLISION:Class;
		[Embed(source = '../graphics/cart_collision_down.png')] private var CART_COLLISION_DOWN:Class;
		
		public var sprCart:Spritemap = new Spritemap(CART, 70, 70);
		
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
		private var mainMenu:MainMenu;
		
		public function Player() {
			sprCart.add("drive", [0], 5, true);
			sprCart.add("grab_left", [1,0], 5, false);
			sprCart.add("grab_right", [2,0], 5, false);
			sprCart.centerOrigin();
			
			super((3 * Util.TILE_SIZE) / 2, (4 * Util.TILE_SIZE) / 2, sprCart);
			
			//Typ und Hitbox für Kollisionen
			type = "player";
			//setHitbox(Util.TILE_SIZE, Util.TILE_SIZE, 0, 0);
			// pixelmask for better collision detection
			mask = new Pixelmask(CART_COLLISION, 0 , 0);
			// starting direction
			direction = "right";
		}
		
		override public function update():void 
		{
			followPlayer();
			
			if (collide("walls", x, y) != null) {
				direction = 'none';
				var exp:Explosion = new Explosion(x + Util.TILE_SIZE / 2, y + Util.TILE_SIZE / 2);
				FP.world.remove(this);  // delete player after crash
				FP.world.add(exp);
				exp.destroyThis();
				
				//display the highscore textfield to enter your name
				level.highscore.displayTextfield(level);
				//level.displayhighscore.addHighscore(level.highscore.getHighscore());
				//setTimeout(killPlayer, 3000); //killPlayer is executed after 3 seconds that exploasion can be seen
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
					mask = new Pixelmask(CART_COLLISION, 0 , 0);
					sprCart.angle = 0;
					sprCart.play('drive')
				}
			}
			if (Input.check(Key.LEFT)) {
				changeDirection.play();
				if (direction == 'right') {
					//direktes umdrehen verhindern
				}
				else {
					direction = 'left';
					mask = new Pixelmask(CART_COLLISION, 0 , 0);
					sprCart.angle = 180;
					sprCart.play('drive')
				}
			}
			if (Input.check(Key.UP)){
				changeDirection.play();
				if (direction == 'down') {
					//direktes umdrehen verhindern
				}
				else {
					direction = 'up';
					mask = new Pixelmask(CART_COLLISION_DOWN, 0 , 0);
					sprCart.angle = 90;
					sprCart.play('drive')
				}
			}
			if (Input.check(Key.DOWN)) {
				changeDirection.play();
				if (direction == 'up') {
					//direktes umdrehen verhindern
				}
				else {
					direction = 'down';
					mask = new Pixelmask(CART_COLLISION_DOWN, 0 , 0);
					sprCart.angle = 270;
					sprCart.play('drive')
				}
			}
			
			//TODO: entfernen
			if (Input.pressed(Key.SPACE)) {
				direction = "none";
			}
			
			if (Input.pressed(Key.Q)) {
				sprCart.play('drive');	// set animation to defaul driving, so a click changes to grab animation
				if (direction == "left") {
					sprCart.play("grab_left");
					grabX = Math.round(x / Util.TILE_SIZE);
					grabY = Math.round(y / Util.TILE_SIZE) + 1;
					grabGood(grabX, grabY);
				}
				if (direction == "right") {
					sprCart.play("grab_left");
					grabX = Math.round(x / Util.TILE_SIZE);
					grabY = Math.round(y / Util.TILE_SIZE) - 1;
					grabGood(grabX, grabY);
				}
				if (direction == "up") {
					sprCart.play("grab_left");
					grabX = Math.round(x / Util.TILE_SIZE) + 1;
					grabY = Math.round(y / Util.TILE_SIZE);
					grabGood(grabX, grabY);
				}
				if (direction == "down") {
					sprCart.play("grab_left");
					grabX = Math.round(x / Util.TILE_SIZE) - 1;
					grabY = Math.round(y / Util.TILE_SIZE);
					grabGood(grabX, grabY);
				}
			}
			
			if (Input.pressed(Key.E)) {
				sprCart.play('drive');
				if (direction == "left") {
					sprCart.play("grab_right");
					grabX = Math.round(x / Util.TILE_SIZE);
					grabY = Math.round(y / Util.TILE_SIZE) - 1;
					grabGood(grabX, grabY);
				}
				if (direction == "right") {
					sprCart.play("grab_right");
					grabX = Math.round(x / Util.TILE_SIZE);
					grabY = Math.round(y / Util.TILE_SIZE) + 1;
					grabGood(grabX, grabY);
				}
				if (direction == "up") {
					sprCart.play("grab_right");
					grabX = Math.round(x / Util.TILE_SIZE) + 1;
					grabY = Math.round(y / Util.TILE_SIZE);
					grabGood(grabX, grabY);
				}
				if (direction == "down") {
					sprCart.play("grab_right");
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
			//every grab increases the speed
			speedUp();
		}
		
		private function speedUp():void {
			speed += 10;
			time = 0;
		}
		
		private function killPlayer():void 
		{
			FP.world.remove(this);
			level.stopSound();
			
			var mm:MainMenu = new MainMenu();
			mm.setHighscore(level.displayhighscore);
			FP.world = new MainWrapper(mm);
		}
		
		public function setLevel(level:LevelOne):void {
			this.level = level;
		}
	}
}