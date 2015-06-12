require 'yaml'

module Codebreaker
	class Saver
		attr_accessor :users
		SAVEFILE = "./data/data"
		def initialize
		  @users = {}	
		  if read_from_file(SAVEFILE)
		    @users = read_from_file(SAVEFILE)
		  end
		end

		def save
			raise "File not found" unless File.exist? SAVEFILE
			save_to_file SAVEFILE
		end

		def save_to_file(file_name)
			File.open(file_name, 'w') do |users|
				 users.puts YAML.dump(@users)
			end
		end
		
		def save_to_file_(file_name)
			File.open(file_name, 'a') do |users|
				 users.puts YAML.dump(@users)
			end
		end

		def read_from_file(file_name)			
			YAML.load(File.read(file_name)) if File.exist? file_name
		end
		
		def read
		  @users = read_from_file(SAVEFILE) if File.exist? SAVEFILE
		end

	end
end
