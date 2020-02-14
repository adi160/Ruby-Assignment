module ResumeBuilder
  class Resume
    include ::ResumeBuilder::Validation
    require "csv"

    attr_accessor  :first_name, :last_name, :gender, :age

    def saveInfo
      CSV.open("generalInfo.csv","a+") do |csv|
        #csv << ["First_Name", "Last_Name", "Gender", "Age"]
        csv <<  [first_name, last_name, gender, age]
        #csv << @info_array
      end
    end

    def self.build
      flag = true
      loop do
        if flag == true
          object = self.new
          puts "Enter your basic details: "
          loop do
            puts "Enter your first name: "
            first_name = gets.chomp
            if object.is_blank(first_name) && object.is_valid_name(first_name)
              object.first_name = first_name
              break
            else
              next
            end
          end

          loop do
            puts "Enter your last name: "
            last_name = gets.chomp
            if (object.is_blank(last_name) && object.is_valid_name(last_name))
              object.last_name = last_name
              break
            else
              next
            end
          end
          
          loop do
            puts "Enter your gender: "
            gender = gets.chomp
            if object.valid_gender(gender)
              object.gender = gender
              break
            else
              next
            end
          end

          loop do
            puts "Enter your age: "
            age = gets.chomp
            if object.is_number(age)
              object.age = age
              break
            else
              next
            end
          end
          
          puts "want to save your information.[Y/N] "
          save = gets.chomp
          save.downcase!
          if save.include? "y"
            object.saveInfo
            puts "your info. is successfully saved.."
          else
            puts "Thanks, you save our memory.."
          end

        puts "Do you want to add one more Resume:[Y/N] "
        repeat = gets.chomp
        repeat.downcase!
          if repeat.include? "y"
            flag = true
          else
            flag = false
          end
        else
          puts "Thanks and welcome again.."
          break
        end
        
      end

    end

  end
end