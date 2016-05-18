describe "#search" do

  context "When querying for an artist that is present in the collection" do
    it "should return the name of the artists" do
      expect(search("Drake")).to eq(["Drake"])
    end
  end


  context "When querying for an artist suggests recommended artist incase of mispelling" do
    it "should return an array of artists with similiar names" do
    expect(search("Rianna")).to eq(["Rihanna"])
    expect(search("The Week")).to eq(["The Weekend"])
    end
  end

  context "When querying for an artist that is NOT present in the collection" do
    it "should return error" do
      expect(search("Spice Girls")).to_not eq(["Spice Girls"])
      expect(search("Spice Girls")).to eq(["Artist does not exist in the collection"])
    end
  end

end
