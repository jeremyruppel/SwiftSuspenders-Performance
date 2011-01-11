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
	import com.gskinner.performance.PerformanceTest;
	import com.gskinner.performance.XMLLog;
	import org.swiftsuspenders.performance.InstantiateTestSuite;

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
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 * @constructor
		 */
		public function SwiftSuspendersPerformanceTestRunner( )
		{
			super( );
			
			trace( "SwiftSuspendersPerformanceTestRunner::initialize()" );

			log;
			//log.out = trace;
			
			runner.addEventListener( Event.CLOSE, onTestsCompleted );
			
			runner.queueTestSuite( new InstantiateTestSuite( ) );
		}
		
		//--------------------------------------
		//  GETTER / SETTERS
		//--------------------------------------
		
		/**
		 * @private
		 */
		public function get suite( ) : String
		{
			return "TODO SUITE";
			/*return SUITE::NAME;*/
		}
		
		/**
		 * @private
		 */
		public function get repo( ) : String
		{
			return "TODO REPO";
			/*return SUITE::REPO;*/
		}
		
		/**
		 * @private
		 */
		public function get socket( ) : XMLSocket
		{
			return _socket || ( _socket = new XMLSocket( ) );
		}
		
		/**
		 * @private
		 */
		public function get runner( ) : PerformanceTest
		{
			return PerformanceTest.getInstance( );
		}
		
		/**
		 * @private
		 */
		public function get log( ) : XMLLog
		{
			return _log || ( _log = new XMLLog( runner, suite ) );
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
	
		/**
		 * @private
		 */
		private var _socket : XMLSocket;
	
		/**
		 * @private
		 */
		private var _log : XMLLog;
		
		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		/**
		 * @param event Event
		 * @private
		 */
		private function onTestsCompleted( event : Event ) : void
		{
			socket.addEventListener( Event.CONNECT, onSocketConnected );

			socket.connect( 'localhost', 8989 );
		}
	
		/**
		 * @param event Event
		 * @private
		 */
		private function onSocketConnected( event : Event ) : void
		{
			trace( 'sending:' );
			trace( log.xml.toXMLString( ) );
			
			socket.send( log.xml.toXMLString( ) );
		
			socket.close( );
		}
	
	}

}