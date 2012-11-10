package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.*;
	import net.flashpunk.FP;
	import worlds.*;
	
	/**
	 * ...
	 * @author noogberserk
	 */
	public class ReadingInterface extends Entity 
	{	
		public static const X_PADDING:uint = 79;
		public static const Y_PADDING:uint = FP.camera.y + 220;
		public static var id:ReadingInterface;
		
		public var background:Image;
		public var character:Image;
		public var instructions:Text;
		public var text:Text;
		public var isOpen:Boolean = false;
		public var characterText:CharacterText;
		
		public function ReadingInterface() 
		{
			super();
			id = this;
			Text.size = 8;
			
			background = new Image(GC.DIALOG_BOX);
			background.y = FP.camera.y;
			addGraphic(background);
			
			instructions = new Text("Press Z to close", X_PADDING + 50, FP.camera.y + 50);
			addGraphic(instructions);
			
			text = new Text("content of help \nsome text below", X_PADDING, FP.camera.y + 5);
			text.color = 0x695A3B;
			addGraphic(text);
			
			character = new Image(GC.RIDER_FACE);
			character.x = 5;
			character.y = FP.camera.y - 10;
			addGraphic(character);
			
			visible = false;
			
			layer = -3
		}
		
		public function get area():Area {
			return world as Area;
		}
		
		override public function update():void 
		{
			if (Input.pressed(Key.Z)) close();
			/*trace("paused: " + area.paused);
			trace("isOpen: " + isOpen);
			trace(visible);*/
		}
		
		public function open(str:String, charTextObj:CharacterText):void
		{
			if (isOpen) return;
			
			this.characterText = charTextObj;
			visible = true;
			isOpen = true;
			area.paused = true;
			text.text = str.replace(/\\n/g, "\n");
			character.y = FP.camera.y + 25;
			instructions.y = FP.camera.y + 85;
			background.y = FP.camera.y + 35;
			text.y = FP.camera.y + 40;
		}
		
		public function close():void
		{
			if (!isOpen) return;
			
			visible = false;
			isOpen = false;
			area.paused = false;
		}
	}

}