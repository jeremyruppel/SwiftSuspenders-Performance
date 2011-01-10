//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 
// 
////////////////////////////////////////////////////////////////////////////////

package
{

import flash.events.Event;
import flash.display.Sprite;

/**
 * Application entry point for SwiftSuspendersPerformanceTestRunner.
 * 
 * @langversion ActionScript 3.0
 * @playerversion Flash 9.0
 * 
 * @author Jeremy Ruppel
 * @since 10.01.2011
 */
public class SwiftSuspendersPerformanceTestRunner extends Sprite
{
	
	/**
	 * @constructor
	 */
	public function SwiftSuspendersPerformanceTestRunner()
	{
		super();
		stage.addEventListener( Event.ENTER_FRAME, initialize );
	}

	/**
	 * Initialize stub.
	 */
	private function initialize(event:Event):void
	{
		stage.removeEventListener( Event.ENTER_FRAME, initialize );
		trace( "SwiftSuspendersPerformanceTestRunner::initialize()" );
	}
	
}

}
