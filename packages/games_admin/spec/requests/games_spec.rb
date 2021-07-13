# typed: false
# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/games", type: :request do
  let(:team1) { create_team }
  let(:team2) { create_team }

  # Game. As you add validations to Game, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    game_params(first_team_id: team1.id, second_team_id: team2.id)
  }

  let(:invalid_attributes) {
    game_params(first_team_id: team1.id, second_team_id: team2.id, date: nil)
  }

  describe "GET /index" do
    it "renders a successful response" do
      Game.create! valid_attributes
      get games_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      game = Game.create! valid_attributes
      get game_url(game)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_game_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      game = Game.create! valid_attributes
      get edit_game_url(game)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Game" do
        expect {
          post games_url, params: { game: valid_attributes }
        }.to change(Game, :count).by(1)
      end

      it "redirects to the created game" do
        post games_url, params: { game: valid_attributes }
        expect(response).to redirect_to(game_url(Game.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Game" do
        expect {
          post games_url, params: { game: invalid_attributes }
        }.to change(Game, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post games_url, params: { game: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { location: 'test' }
      }

      it "updates the requested game" do
        game = Game.create! valid_attributes
        patch game_url(game), params: { game: new_attributes }
        game.reload
        expect(game.location).to eq('test')
      end

      it "redirects to the game" do
        game = Game.create! valid_attributes
        patch game_url(game), params: { game: new_attributes }
        game.reload
        expect(response).to redirect_to(game_url(game))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        game = Game.create! valid_attributes
        patch game_url(game), params: { game: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested game" do
      game = Game.create! valid_attributes
      expect {
        delete game_url(game)
      }.to change(Game, :count).by(-1)
    end

    it "redirects to the games list" do
      game = Game.create! valid_attributes
      delete game_url(game)
      expect(response).to redirect_to(games_url)
    end
  end
end
