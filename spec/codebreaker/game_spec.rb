require 'spec_helper'

module Codebreaker
	describe Game do
		context "#start" do 
			let(:game) {Game.new "User"}
			let(:secret_code) {game.instance_variable_get(:@secret_code)}

			before do
				game.start
			end

			it "generates secret code" do
				expect(secret_code).not_to be_empty
			end

			it "saves 4 number secret code" do
				expect(secret_code).to have(4).items
			end

			it "save secret code with nurbers from 1 to 6" do
				expect(secret_code).to match(/[1-6]+/)
			end

		end

		context "#check_up" do
			let(:game) {Game.new "User"}
			let(:secret_code) {game.instance_variable_get(:@secret_code)}

			before do
				game.start
				game.instance_variable_set(:@secret_code, "1233")
			end

			it "checks result size at most 4" do
				expect(game.check_up("1323")).to have_at_most(4).items
			end

			it "checks result is a combination of + and -" do
				expect(game.check_up("1534")).to match(/[\+\-]+/)
			end

			it "full match gives ++++" do
				expect(game.check_up("1233")).to eq("++++")
			end

			it "mismatch gives ''" do
				expect(game.check_up("5678")).to eq("")
			end

			it "checks with repetition in answer" do
				expect(game.check_up("1111")).to eq("+")
			end

			it "checks with repetition in code" do
				expect(game.check_up("3555")).to eq("-")
			end

		end

		context "#hint" do
			let(:game) {Game.new "User"}
			let(:secret_code) {game.instance_variable_get(:@secret_code)}

			before do
				game.start
				game.instance_variable_set(:@secret_code, "1233")
			end

			it "show number of secret code" do
				expect(game.hint(0)).to eq("1")
			end

			it "deprives 30 score points" do
				expect{game.hint(0)}.to change {game.user.score}
			end
		end

		context "#save" do
			let(:game) {Game.new "User"}
			before do
				game.start
			end
			xit "save info about user score and attempts" do
				
			end
		end

		context "#game" do
			let(:game) {Game.new "User"}
			before do
				game.start
			end
			it "" do
					
			end
		end

	end
end



