require "instance"

class Index
  attr_reader :files
  # initialize with a list of files.
  def initialize files
    @files = files
  end

  def index
    return @index if @index
    @index = {}
    @files.each do |file|
      index_words(file, @index)
    end
    @index
  end

  protected

  def index_words file, idx
    lines = File.readlines(file).map(&:chomp)
    lines.each_with_index do |line, i|
      words = line.split(/\s+/)
      words.each do |word|
        idx[word] ||= []
        idx[word] << Instance.new(file, i+1)
      end
    end
  end
end
