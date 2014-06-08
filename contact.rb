class Contact 

  attr_accessor :id, :name, :first_name, :last_name, :email, :note

  #All attributes are available inside the entire CRM program with instance variables
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email 
    @note = note
    @id = id
  end

  # def display_all_values
  # 	puts "#{@first_name}"
  # 	puts "#{@last_name}"
  # 	puts "#{@email}"
  # 	puts "#{@note}"
  # end


end
