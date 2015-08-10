require "index"
RSpec.describe "Index:" do
  describe "initialize" do
    before :all do
      @files = Dir[File.join(FIXTURES_DIR, "*.txt")].to_a
      @i = Index.new @files
    end

    it "should have loaded files correctly" do
      loaded = @files.map { |f| File.basename(f) }
      expect(loaded).to eq(["one.txt", "two.txt"])
    end

    it "should make an inverted index correctly" do
      expected = {
        "hello" => [ins("one.txt", 1), ins("two.txt", 1), ins("two.txt", 2)],
        "there" => [ins("one.txt", 1)],
        "adit"  => [ins("one.txt", 2), ins("two.txt", 3)]
      }
      expect(@i.index).to eq(expected)
    end

    it "should find hello in both files, with more occurrences in two.txt" do
      expected = res([["two.txt", 2], ["one.txt", 1]])
      expect(@i.find("hello")).to eq(expected)
    end

    it "should find there in one.txt but not two.txt" do
      expected = res([["one.txt", 1]])
      expect(@i.find("there")).to eq(expected)
    end
  end
end
