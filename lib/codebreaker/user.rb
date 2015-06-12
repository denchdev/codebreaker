module Codebreaker
	class User
		attr_accessor :name, :score, :attempts_total

		def initialize name
			@name = name
			@score = 200
			@attempts_total = 0
			@attempts = []
		end

		def to_s
			"Name: #{@name}  score : #{@score}  total_attempts : #{@attempts_total}  best_attempt : #{best_attempt}"
		end

		alias info to_s

		def save attempt
			@score += 100
			@attempts_total += attempt
			@attempts << attempt
		end

		def best_attempt
			@attempts.min
		end

	end
end
