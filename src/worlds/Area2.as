package worlds 
{
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Area2 extends Area 
	{
		[Embed(source = "../assets/levels/level_2.oel", mimeType = "application/octet-stream")] 
		public static const DATA:Class;
		
		public function Area2() 
		{
			super(DATA);
		}
		
	}

}