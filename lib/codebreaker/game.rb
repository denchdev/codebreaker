module Codebreaker
  class Game
    attr_reader :user, :saver, :attemp
    CODESIZE = 4
    MAXATTEMPS = 10

    def initialize name
      @secret_code = ""
      @saver = Saver.new
      if @saver.users[name].nil?  
        @user = User.new name
        @saver.users[name] = @user
      else
        @user = @saver.users[name]
      end       
    end

    def start 
      @secret_code = ""
      @attemp = MAXATTEMPS 
      @result = ""   
      CODESIZE.times { @secret_code += rand(1..6).to_s }            
    end

    def check_up answer_
      code = @secret_code.dup
      answer = answer_.dup
      @result = ""
      i = 0
      answer.each_char do |c|
        if c == code[i]
          @result << "+"
          code[i], answer[i] = "0", "0"
        end
        i += 1
      end
      answer.each_char do |c|        
        unless c == "0"
          if code.include? c
            @result << "-" 
            i = code.index c
            code[i] = "0"
          end
        end
      end
      @attemp -= 1
      @result
    end

    def hint index
      if @user.score > 300
        @user.score -= 300
        @secret_code[index]
      else
        "You do not have score("
      end
    end   
    
    def lose?
      if @attemp == 0
        @user.attempts_total += MAXATTEMPS
        save
        true
      else
        false
      end
    end
    
    def win?
      if @result == "++++"
        @user.save (MAXATTEMPS - @attemp)
        save
        true
      else
        false 
      end
    end
    
    def save
      @saver.save
    end
  end
end
