package  
{
	/**
	 * ...
	 * @author noogberserk
	 */
	public class GC 
	{
		//ASSETS
		[Embed(source = "assets/cactus.png")] public static const CACTUS_IMAGE:Class;
		[Embed(source = "assets/rocks.png")] public static const ROCKS_IMAGE:Class;
		[Embed(source = "assets/car.png")] public static const CAR_IMAGE:Class;
		[Embed(source = "assets/background.png")] public static const BACKGROUND_IMAGE:Class;
		[Embed(source = "assets/coin.png")] public static const COIN_IMAGE:Class;
		[Embed(source = "assets/eye.png")] public static const EYE_SPRITE:Class;
		[Embed(source = "assets/drivers_face.png")] public static const RIDER_FACE:Class;
		[Embed(source = "assets/dialogBox.png")] public static const DIALOG_BOX:Class;
		
		[Embed(source = "assets/tiles.png")] public static const TILE_MAP:Class;
		
		//PLAYER SPEED
		public static var PLAYER_Y_SPEED:Number = 160;
		public static var PLAYER_Y_ACCELERATION:Number = 80;
		public static const MAX_ANGLE:Number = 360;
		
		
		//TYPE
		public static const TYPE_DECORATION:String = "decoration";
		public static const TYPE_PLAYER:String = "player";
		public static const TYPE_COINS:String = "coins";
	}

}