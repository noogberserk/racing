package entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import flash.display.BitmapData;
	import net.flashpunk.utils.*;
	
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Coin extends Actor 
	{
		private var g:Image;
		private var _em:Emitter;
		private var hit:Boolean = false;
		private var explosion_size:uint;
		
		public function Coin(x:Number, y:Number) 
		{
			super(x, y);
			g = new Image(GC.COIN_IMAGE);
			g.centerOrigin();
			setHitbox(12, 14, 6, 8);
			
			_em = new Emitter(new BitmapData(1, 1, false, 0xF7E118), 8, 8);
			_em.newType("explode", [0]);
			_em.setAlpha("explode", 1, 0);
			_em.setMotion("explode", 0, 8, 10, 360, -20, -0.5, Ease.quadOut);
			explosion_size = 50;
			
			graphic = new Graphiclist(g, _em);
			layer = -2;
		}
		override public function update():void 
		{
			super.update();
			
			if (collidable && collide(GC.TYPE_PLAYER, x, y)) {
				g.visible = false;
				hit = true;
				for (var i:uint = 0; i < explosion_size; i++) {
					_em.emit("explode", 0, 0);
				}
				collidable = false;
			}
			
			if (hit && _em.particleCount == 0) {
				FP.world.remove(this);
			}
		}
	}

}