describe Branch do

  before(:each) { @branch = build(:branch)}
  
  subject { @branch }

  it { should respond_to(:name) }

  it "#name should equal Test Branch" do
    expect(@branch.name).to eq("Test Branch")
  end

  it "should belong to user" do
    expect(Branch.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it "should have many commits" do
    expect(Branch.reflect_on_association(:commits).macro).to eq(:has_many)
  end

end
