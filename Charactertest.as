class Charactertest extends MovieClip
{
	var jumping;
	var moveSpeed;
	var vel_y;
	var fall;
	       function onLoad()
		   {
			   fall = true;
			   jumping = false;
			   moveSpeed = 10;
			   vel_y = 0;
		   }
		   function onEnterFrame()
		   {
			   if (Key.isDown(Key.RIGHT)) 
			   {
				   _root.groundtest._x -= moveSpeed;
				   this._xscale = 100;
			   } 
			   else if (Key.isDown(Key.UP))
			   {
				   this._y -= 0;    
			   }
			   else if (Key.isDown(Key.DOWN) && !fall) 
			   {
				   this._y += 0;    
			   } 
			   else if (Key.isDown(Key.LEFT)) 
			   {
				   _root.groundtest._x += moveSpeed;
				   this._xscale = -100;
			   }
			   if (Key.isDown(Key.SPACE) && !jumping)
			   {
				   vel_y = 20;
				   jumping = true;
				}
				if (jumping == true)
				{
					vel_y -= 2;
					if (vel_y<=-15)
					{
						vel_y = -15;
					} 
					this._y -= vel_y;
				}
				if (_root.groundtest.hitTest(this._x, this._y, true))
				{
					vel_y = 0;
					jumping = false;
				}
				if (fall == true)
				{
					this._y += 16;
				}
				if (_root.groundtest.hitTest(this._x, this._y, true))
				{
					this._y = _root.groundtest._y+1;
					fall = false;
				}
		   }
}