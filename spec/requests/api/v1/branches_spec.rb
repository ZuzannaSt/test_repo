describe "Branches API" do

  let(:user) { create :user }
  
  describe "#index" do
    it 'list of branches' do
      create_list(:branch, 2, user: user)
      get "/api/branches", {}, set_auth_token(user)
      expect(json['branches'].length).to eq(2)
      expect(json['private_attr']).to eq(nil)
    end
  end
  
  describe "#show" do
    it 'one branch' do
      branch = create(:branch, user: user)
      get "/api/branches/#{branch.id}", {}, set_auth_token(user)
      expect(json['branch'].length).to_not eq(nil)
    end
  end
  
  describe "#destroy" do
    let(:branch) { create(:branch, user: user) }
    context 'when object is not owned' do
      let(:fake_user) { create :user }
      it 'responds with 404' do
        delete "/api/branches/#{branch.id}", {}, set_auth_token(fake_user)
        expect(json['error']).to eq(nil)
      end
    end
  end
end

