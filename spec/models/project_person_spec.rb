describe ProjectPerson do

  before(:each) { @project_person = build(:project_person) }

  subject { @project_person }

  it "should belong to user" do 
    expect(ProjectPerson.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it "should belong to project" do 
    expect(ProjectPerson.reflect_on_association(:project).macro).to eq(:belongs_to)
  end

end
