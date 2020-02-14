module ResumeBuilder
  module Validation
    def is_blank(str)
      if str.length == 0
        puts "Please provide your name.."
        return false
      else
        return true
      end
    end
    
    def is_valid_name(str)
      if str.match(/^([a-zA-Z]{3,16})$/) == nil
        puts "Please enter valid name.(must contains only character of length between 3 to 16)..
        "
        return false
      else
        return true
      end
    end

    def is_number(num1)
      if num1.match(/^([0-9])/) == nil
        puts "Please Enter number only.."
        return false
      else
        return true
      end
    end

    def valid_gender(str)
      str.downcase!
      if !(str == "male" || str == "female" || str == "other")
        puts "Enter your gender either male, female or other.."
        return false
      else
        return true
      end
    end

  end
 
end