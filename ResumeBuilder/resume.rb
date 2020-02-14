module ResumeBuilder
  class Resume
    include ::ResumeBuilder::Validator
    require "csv"

    attr_accessor  :first_name, :last_name, :gender, :age

    def saveInfo
      CSV.open("generalInfo.csv","a+") do |csv|
        csv <<  [first_name, last_name, gender, age]
      end
    end

    def self.build
      object = self.new
      puts "Enter your basic details: "
      object.firstName
      puts "want to save your information.[Y/N] "
      save = gets.chomp
      save.downcase!
      if save.eql? "y"
        object.saveInfo
        puts "your info. is successfully saved.."
	object.multiInput
      else
	object.multiInput
      end
    end

    def firstName
      puts "Enter your first name: "
      first_name = gets.chomp
      if !is_valid_name(first_name)
        @first_name = first_name
	lastName
      else
        firstName
      end
    end

    def lastName
      puts "Enter your last name: "
      last_name = gets.chomp
      if !is_valid_name(last_name)
        @last_name = last_name
	personGender
      else
        lastName
      end
    end

    def personGender
      puts "Enter your gender: "
      gender = gets.chomp
      if valid_gender(gender)
        @gender = gender
	personAge
      else
        personGender
      end
    end

    def personAge
      puts "Enter your age: "
      age = gets.chomp
      if !self.is_number(age)
        self.age = age
      else
        self.personAge
      end
    end

    def multiInput
      puts "Do you want to add one more Resume:[Y/N] "
      repeat = gets.chomp
      repeat.downcase!
      if repeat.eql? "y"
        self.class.build
      end
    end

  end
end
