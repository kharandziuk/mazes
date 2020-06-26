describe "Mazes" do
  it "produce a maze" do
    expected = 
'*--*--*--*--*
|  |  |  |  |
*--*--*--*--*
|  |  |  |  |
*--*--*--*--*
|  |  |  |  |
*--*--*--*--*
|  |  |  |  |
*--*--*--*--*
'
    expect(`ruby binary-tree.rb`).to eq expected
  end
end

