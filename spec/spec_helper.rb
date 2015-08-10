FIXTURES_DIR = File.expand_path(File.join(File.dirname(__FILE__), "fixtures"))
def ins(file, line)
  Instance.new(File.join(FIXTURES_DIR, file), line)
end

def res arr
  arr.map do |file, count|
    [File.join(FIXTURES_DIR, file), count]
  end
end
