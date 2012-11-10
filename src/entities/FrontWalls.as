package entities 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	/**
	 * ...
	 * @author noogberserk
	 */
	public class FrontWalls extends Actor 
	{
		public static var id:FrontWalls;
		private var _map:Tilemap;
		private var _grid:Grid;
		
		public function FrontWalls(width:uint, height:uint) 
		{
			id = this;
			type = "front_wall";
			setHitbox(width, height);
			
			_map = new Tilemap(new BitmapData(16,16, false, 0x000000), width, height, 16, 16);
			addGraphic(_map);
			
			mask = _grid = new Grid(width, height, 16, 16);
			super(0,0)
		}
		public function loadFromXML(data:XML):void
		{
			for each (var o:Object in data.FrontWalls.tile) {
				_map.setTile(o.@x, o.@y, 0);
				_grid.setTile(o.@x, o.@y, true);
			}
		}
		
		public function getTileAtPosition(xPos:Number, yPos:Number):Boolean {
			return _grid.getTile(xPos / _grid.tileWidth, yPos / _grid.tileWidth);
		}
	}

}