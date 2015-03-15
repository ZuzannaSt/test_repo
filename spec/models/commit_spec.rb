describe Commit do

  before(:each) { @commit = build(:commit)}
  
  subject { @commit }

  it { should respond_to(:name) }

  # it "checks if commit name is Test Commit" do
  #   expect(@commit.name).to eq("Test Commit")
  # end

  it "should belong to user" do
    expect(Commit.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it "should belong to project" do 
    expect(Commit.reflect_on_association(:project).macro).to eq(:belongs_to)
  end

  it "should belong to branch" do
    expect(Commit.reflect_on_association(:branch).macro).to eq(:belongs_to)
  end
 
end
