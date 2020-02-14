module ResumeBuilder
  module Validator

    NAME_REGX = /^([a-zA-Z]{3,16})$/
    NUMBER_REGX = /^([1-9])+([0-9])$/
    
    def is_valid_name(str)
      str.match(NAME_REGX).nil?
    end

    def is_number(value)
      value.match(NUMBER_REGX).nil?
    end

    def valid_gender(str)
      str.downcase!
      if (str == "male" || str == "female" || str == "other")
        true
      end
    end

  end
end
