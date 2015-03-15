describe User do

  before(:each) { @user = build(:user) }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:name)}

  # it "#email returns a string" do
  #   expect(@user.email).to match 'test@example.com'
  # end

  # it "#name returns a string" do
  #   expect(@user.name).to match 'Test User'
  # end

  it "should have many projects" do 
    expect(User.reflect_on_association(:projects).macro).to eq(:has_many)
  end

  it "should have many commits" do 
    expect(User.reflect_on_association(:commits).macro).to eq(:has_many)
  end

  it "should have many project people" do 
    expect(User.reflect_on_association(:project_people).macro).to eq(:has_many)
  end

end
