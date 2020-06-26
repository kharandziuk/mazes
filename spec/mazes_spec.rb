describe "Mazes" do
  it "produce a maze" do
    expected = '
*--*--*
|  |  |
*--*--*
|  |  |
*--*--*
'[1..-1]
    expect(`ruby binary-tree.rb`).to eq expected
  end
end
