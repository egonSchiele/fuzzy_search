require "server"
RSpec.describe "Server:" do
  describe "initialize" do
    before :all do
      @files = Dir[File.join(FIXTURES_DIR, "*.txt")].to_a
      @s = Server.new @files
    end

    it "should have loaded files correctly" do
      @files.map { |f| File.basename(f) }.should == ["one.txt", "two.txt"]
    end

    it "should make an inverted index correctly" do
      @expected = {
        "hello" => [ins("one.txt", 1), ins("two.txt", 1), ins("two.txt", 2)],
        "there" => [ins("one.txt", 1)],
        "adit"  => [ins("one.txt", 2), ins("two.txt", 3)]
      }
      @s.index.should == @expected
    end
  end
end
