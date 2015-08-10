require "index"
require "sinatra"
require "json"

class Server
  attr_accessor :server, :index
  def initialize glob, verbose = true
    files = Dir[glob].to_a
    @index = Index.new files
    return if verbose
    log "loaded files:"
    files.each do |file|
      log file
    end
  end

  def find word
    index.find(word).to_json
  end

  def log str
    puts str
  end
end

s = Server.new ARGV[0]

get "/find/:word" do
  word = params[:word]
  s.find word
end
