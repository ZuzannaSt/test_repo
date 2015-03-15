describe Project do

  before(:each) { @project = build(:project) }

  subject { @project }

  it { should respond_to(:name) }

  # it "checks if project name is Test Project" do
  #   expect(@project.name).to eq("Test Project")
  # end

  it "should have many users" do 
    expect(Project.reflect_on_association(:users).macro).to eq(:has_many)
  end

  it "should have many branches" do
    expect(Project.reflect_on_association(:branches).macro).to eq(:has_many)
  end

  it "should have many commits" do 
    expect(Project.reflect_on_association(:commits).macro).to eq(:has_many)
  end

end
