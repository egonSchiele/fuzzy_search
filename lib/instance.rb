Instance = Struct.new(:file, :line)

class Instance
  def to_hash
    {"file": file, "line": line}
  end
end
