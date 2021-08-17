# TODO: Write documentation for `Ser`
require "http/server"
require "option_parser"

def run_server(addr, port, dir)
  server = HTTP::Server.new([
    HTTP::ErrorHandler.new,
    HTTP::LogHandler.new,
    HTTP::CompressHandler.new,
    HTTP::StaticFileHandler.new(dir),
  ])

  puts "serve #{dir} directory using address #{addr}:#{port}"
  server.bind_tcp addr, port.to_i32
  server.listen
end

def usage
  "
examples:
ser
ser .
	serve .  directory using port 8080
ser -p 8088
	serve .  directory using port 8088
ser ..
	serve .. directory using port 8080
ser -p 8088 ..
	serve .. directory using port 8088
ser -addr 0.0.0.0 -p 9999
	serve .  directory using address 0.0.0.0:9999
  "
end

a = "127.0.0.1"
p = "8080"
d = "."

OptionParser.parse do |parser|
  parser.banner = "
ser is a simple http server.
  "

  parser.on "-v", "--version", "Show version" do
    puts "version 1.0"
    exit
  end
  parser.on "-h", "--help", "Show help" do
    puts parser
    puts usage()
    exit
  end
  parser.on "-p PORT", "--port=PORT", "On port" do |port|
    p = port
  end
  parser.on "-a ADDR", "--address=ADDR", "On ip address" do |addr|
    a = addr
  end
end

if ARGV.size > 0
  d = ARGV[0]
end

run_server(a, p, d)
