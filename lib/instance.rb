Instance = Struct.new(:file, :line)

class Instance
  def to_json
    {"file": file, "line": line}
  end
end
