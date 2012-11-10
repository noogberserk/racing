package Tests 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.FP;
	import entities.SideWalls;
	import net.flashpunk.utils.*;
	/**
	 * ...
	 * @author noogberserk
	 */
	public class CollisionPlayer extends Entity 
	{
		private var img:Image;
		private var maskBmp:BitmapData;
		private var maskObj:Pixelmask;
		
		public function CollisionPlayer(x:Number, y:Number) 
		{
			img = new Image(GC.CAR_IMAGE);
			img.centerOrigin();
			img.smooth = true;
			
			var size:int = Math.ceil(Math.sqrt(img.width * img.width + img.height * img.height));
			maskBmp = new BitmapData(size, size, true, 0);
			
			var offset:Point = new Point(size / 2, size / 2);
			
			maskObj = new Pixelmask(maskBmp, -offset.x, -offset.y);
			img.render(maskBmp, offset, FP.zero);
			
			super(x, y, img, maskObj);
			
			collidable = true;
		}
		
		public function set angle(value:Number):void
		{
			img.angle = value;
			maskBmp.fillRect(maskBmp.rect, 0);
			FP.point.x = maskBmp.width / 2;
			FP.point.y = maskBmp.height / 2;
			img.render(maskBmp, FP.point, FP.zero);
		}
		
		public function get angle():Number {
			return img.angle;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.check(Key.RIGHT)) x++;
			if (Input.check(Key.LEFT)) x--;
			
			var l:SideWalls = collide("side_wall", x, y) as SideWalls;
			
			if (l) {
				var g:Grid = l.mask as Grid;
				
				var top:int 		= y			/ g.tileWidth;
				var bottom:int 	= y + height	/ g.tileWidth;
				var left:int 		= x			/ g.tileWidth;
				var right:int 		= x + width	/ g.tileWidth;
				
				for (var row:int = top; row <= bottom; row++) {
					for (var column:int = left; column <= right; column++) {
						if (g.getTile(column, row)) {
							img.color = 0x000000
							trace("x: " + column + " \y: " + row);
						}
					}
				}
			}
			
			if (Input.mousePressed) {
				g.getTile(FP.world.mouseX / g.tileWidth, FP.world.mouseY / g.tileWidth);
			}
		}
	}

}