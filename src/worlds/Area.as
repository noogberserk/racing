package worlds
{
	/*
	layers
	0 background
	-1 car
	-2 tiles
	-3 interface	
	*/
	import entities.* ;
	import entities.background.*;
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.*;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.*;
	
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Area extends World 
	{
		public static const LIST:Array = [];
		public static var current:Area;
		
		public var index:uint;
		public var width:uint;
		public var height:uint;
		public var paused:Boolean = false;
		
		
		private var xSpeedText:Text;
		private var ySpeedText:Text;
		private var totalSpeed:Text;
		
		public static function init():void
		{
			LIST.push(Area1);
			LIST.push(Area2);
			LIST.push(Area3);
		}
		
		public static function load(index:uint):void
		{
			if (!LIST[index]) {
				throw new Error("Not an area in index " + index);
			}
			FP.world = current = new LIST[index]();
		}
		
		
		public function Area(data:Class) 
		{
			var xml:XML = FP.getXML(data);
			
			width = xml.@width;
			height = xml.@height;
			trace(height)
			
			loadObjects(xml);
			add(new ReadingInterface);
			add(new SideWalls(width, height));
			add(new FrontWalls(width, height));
			SideWalls.id.loadFromXML(xml);
			FrontWalls.id.loadFromXML(xml);
			//add(new PlayerCar(0,0))
			
			//add(new CharacterText(0, 0, "Oh please, please make it happen! \n - He kept crying."));
			
			/*FP.camera.y = player.y - FP.screen.height * 4/5;
			
			Text.size = 8;
			xSpeedText = new Text("", 10, FP.camera.y + 20);
			ySpeedText = new Text("", 10, FP.camera.y + 40);
			totalSpeed = new Text("", 10, FP.camera.y + 60);
			
			
			addGraphic(xSpeedText);
			addGraphic(ySpeedText);
			addGraphic(totalSpeed);
			
			
			add(player);*/
			
		}
		
		private function loadObjects(data:XML):void
		{
			//trace(data)
			//add(new LeftCar(data.Objects.PlayerCar.@x, data.Objects.PlayerCar.@y));
			add(new PlayerCar(data.Objects.PlayerCar.@x, data.Objects.PlayerCar.@y));
			for each (var o:Object in data.Objects.Cactus) add(new Cactus(o.@x, o.@y));
			for each (o in data.Objects.Rocks) add(new Rocks(o.@x, o.@y));
			for each (o in data.Objects.Coin) add(new Coin(o.@x, o.@y));
			for each (o in data.Objects.CharacterText) add(new CharacterText(o.@x, o.@y, o.@text));
		}
		
		override public function begin():void 
		{
			//addGraphic(PlayerCar.dirtEmitter);
			super.begin();
		}
		override public function update():void 
		{
			super.update();
			
			FP.camera.y = PlayerCar.id.y - FP.screen.height * 7/9;
			FP.camera.x = PlayerCar.id.x - FP.screen.width / 2;
			
			//trace("car " + PlayerCar.id.y)
			//trace("RInterface " + ReadingInterface.id.y);
			/*xSpeedText.text = "xSpeed: " + PlayerCar.v.x.toString();
			ySpeedText.text = "ySpeed: " + PlayerCar.v.y.toString();
			totalSpeed.text = "totalSpeed: " + PlayerCar.playerSpeed.toString();*/
			//if (Input.pressed(Key.SPACE)) ReadingInterface.id.open("another content of help \nwith some text below");
		}
		override public function render():void 
		{
			super.render();
			/*Draw.line(FP.screen.width / 4, FP.screen.height / 4, FP.screen.width / 4, height);
			Draw.line(FP.screen.width * 3 / 4, FP.screen.height / 4, FP.screen.width * 3 / 4, height);*/
		}
	}

}