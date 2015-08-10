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

  def find word
    instances = index[word]
    return [] unless instances

    files = Hash.new(0)
    instances.each do |i|
      files[i.file] += 1
    end

    # sort by # of occurrences
    sorted = files.to_a.sort do |a, b|
      b[1] <=> a[1]
    end

    sorted
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
