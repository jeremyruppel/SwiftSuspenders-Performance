#!/usr/bin/env ruby -wKU

require 'socket'
require 'fileutils'

class Target
  attr_reader :name, :repo, :src, :swf
  def initialize( opts )
    @name = opts[ :name ]
    @repo = opts[ :repo ]
    @src  = opts[ :src  ]
    @swf  = opts[ :swf  ]
  end
end

TARGETS = 
{
  :head => Target.new(
  {
    :name => 'SwiftSuspenders HEAD',
    :repo => 'git://github.com/tschneidereit/SwiftSuspenders.git',
    :src  => 'test/head',
    :swf  => 'deploy/SwiftSuspendersPerformanceTestRunner.swf'
  } ),
  :fork => Target.new(
  {
    :name => 'SwiftSuspenders FORK',
    :repo => 'git://github.com/jeremyruppel/SwiftSuspenders.git',
    :src  => 'test/fork',
    :swf  => 'deploy/SwiftSuspendersPerformanceTestRunner.swf'
  } )
}

def target_from( args )
  raise "No target found named '#{args[ :target ]}'. Available targets are #{TARGETS.keys.join ', '}" unless TARGETS.has_key? args[ :target ].to_sym
  yield TARGETS[ args[ :target ].to_sym ]
end

desc "Cleans target files from the test directory"
task :clean, :target do |t, args|
  target_from args do |target|
    FileUtils.rm_rf target.src
  end
end

desc "Clones the target repo from github"
task :clone, :target, :needs => :clean do |t, args|
  target_from args do |target|
    puts `git clone #{target.repo} #{target.src}`
  end
end

desc "Compiles the target test suite"
task :compile, :target do |t, args|
  target_from args do |target|
    # compile the test runner
    `mxmlc \
    -define=SUITE::NAME,"'#{target.name}'" \
    -define=SUITE::REPO,"'#{target.repo}'" \
    -debug=true \
    -source-path+=src,#{target.src} \
    -output=#{target.swf} \
    src/SwiftSuspendersPerformanceTestRunner.as`
    # delete the cache file if it was created
    File.delete "#{target.swf}.cache" if File.exist? "#{target.swf}.cache"
    # start a quick socket server to talk to the flash runner
    server = TCPServer.new 'localhost', 8989
    # open the test runner in the local player so we can connect to our server
    `open #{target.swf}`
    # wait for the test runner's response
    socket = server.accept
    # profit?
    puts 'RESULTS:'
    puts socket.gets
  end
end