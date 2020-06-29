describe "Mazes" do
  it "produce a sidewinder maze" do
    expected = '
*--*--*
   |  |
*--*--*
|  |  |
*--*--*
'[1..-1]
  expect(`ruby sidewinder.rb`).to eq expected
  end
end
