require "instance"
RSpec.describe "Instance:" do
  describe "initialize" do
    before :all do
      @i = Instance.new("foo.txt", 10)
    end

    it "basic attributes" do
      expect(@i.file).to eq("foo.txt")
      expect(@i.line).to eq(10)
    end

    it "to_hash" do
      expected = { "file": "foo.txt", "line": 10 }
      expect(@i.to_hash).to eq(expected)
    end
  end
end
