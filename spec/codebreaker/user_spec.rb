require 'spec_helper'

module Codebreaker
	describe User do

		context "#info" do
			let(:user) {User.new "User"}
			before do
				user.instance_variable_set(:@attempts, [5, 7, 8])
			end
			it "return information about user" do
				expect(user.info).to eq("Name: User  score : 200  total_attempts : 0  best_attempt : 5")
			end

		end

		context "#save" do
			it "save score of the game" do
				user = User.new "User"
				expect{user.save 5}.to change{user.score}
			end
			it "save attempts of the game" do
				user = User.new "Den"
				expect{user.save 5}.to change{user.attempts_total}
			end
		end

		context "#best_attempt" do
			let(:user) {User.new "User"}
			before do
				user.instance_variable_set(:@attempts, [5, 7, 8])
			end
			it "return best try" do
				expect(user.best_attempt).to eq(5)
			end
		end

	end
end
