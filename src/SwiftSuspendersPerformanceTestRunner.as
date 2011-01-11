//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 
// 
////////////////////////////////////////////////////////////////////////////////

package
{

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.XMLSocket;

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
		public function SwiftSuspendersPerformanceTestRunner( )
		{
			super( );
			
			trace( "SwiftSuspendersPerformanceTestRunner::initialize()" );
			trace( SUITE::NAME );
			trace( SUITE::REPO );
			
			socket.addEventListener( Event.CONNECT, onSocketConnected );

			socket.connect( 'localhost', 8989 );
		}
	
		/**
		 * @private
		 */
		private var _socket : XMLSocket;
	
		/**
		 * @private
		 */
		public function get socket( ) : XMLSocket
		{
			return _socket || ( _socket = new XMLSocket( ) );
		}
	
		/**
		 * @param event Event
		 * @private
		 */
		private function onSocketConnected( event : Event ) : void
		{
			socket.send( <holy_crap/> );
		
			socket.close( );
		}
	
	}

}