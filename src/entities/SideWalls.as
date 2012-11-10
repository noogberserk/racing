package entities 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.utils.*;
	import net.flashpunk.FP
	/**
	 * ...
	 * @author noogberserk
	 */
	public class SideWalls extends Actor 
	{
		public static var id:SideWalls;
		private var _map:Tilemap;
		private var _grid:Grid;
		
		public function SideWalls(width:uint, height:uint) 
		{
			id = this;
			type = "side_wall";
			setHitbox(width, height);
			
			_map = new Tilemap(GC.TILE_MAP, width, height, 16, 16);
			addGraphic(_map);
			
			mask = _grid = new Grid(width, height, 16, 16);
			super(0, 0)
		}
		public function loadFromXML(data:XML):void
		{
			for each (var o:Object in data.SideWalls.tile) {
				_map.setTile(o.@x, o.@y, o.@id);
				_grid.setTile(o.@x, o.@y, true);
			}
		}
		
		override public function update():void 
		{
			super.update();
			if (Input.mousePressed) {
				trace("mouse xPosition: " + FP.world.mouseX)// / _grid.tileWidth)
				trace("mouse yPosition: " + FP.world.mouseY)// / _grid.tileWidth)
				trace("tile at mouse? " + getTileAtPosition(FP.world.mouseX, FP.world.mouseY))
				trace();
			}
		}
		
		public function getTileAtPosition(xPos:Number, yPos:Number):Boolean {
			return _grid.getTile(xPos / _grid.tileWidth, yPos / _grid.tileWidth);
		}
	}

}