package Tests 
{
	import entities.SideWalls;
	import net.flashpunk.World;
	import net.flashpunk.FP
	import net.flashpunk.utils.*;
	import net.flashpunk.graphics.Text
	/**
	 * ...
	 * @author noogberserk
	 */
	public class TestWorld extends World 
	{
		private var thingies:Vector.<CollisionPlayer> = new Vector.<CollisionPlayer>();
		private var control:uint = 1;
		private var txtStatus:Text = new Text("Hello", 0, 0, FP.width);
		[Embed(source = "../assets/levels/Unsaved Level.oel", mimeType = "application/octet-stream")] 
		public static const LEVEL_DATA:Class;
		
		public function TestWorld() 
		{
			//thingies.push(new CollisionPlayer(FP.screen.width / 2, FP.screen.height / 2), new CollisionPlayer(100, 100));
			//addList(new CollisionPlayer(0, FP.screen.height / 2));
			
			//addGraphic(txtStatus, -1, 0, 20);
			
			//addGraphic(new Text("Arrow keys to move, space to rotate, enter to switch control"), -1, 0, 50);
			
			var xml:XML = FP.getXML(LEVEL_DATA);
			add(new SideWalls(xml.@width, xml.@height));
			SideWalls.id.loadFromXML(xml);
		}
	}

}