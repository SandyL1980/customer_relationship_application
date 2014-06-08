=begin

Implement the Runner

TO DO


As a user, if 'add' is typed, I am prompted to give my 'first name', 'last name', 'email' and 'notes'.
As a user, if 'modify' is typed, I am prompted to enter a contact attribute to be modified.
As a user, when an attribute is entered, I am prompted to type 'yes' or 'no' to confirm my selection.
As a user, if 'yes' is typed, I am prompted to change 'id', 'firstname', 'lastname' and 'email'.
As a user, when an attribute is entered, I am prompted to enter a new value for the attribute.
As a user, if 'no' is typed, I am returned back to the main menu.
As a user, if 'display all' is typed, I am shown all of the contacts that exist.
As a user, if 'display contact' is typed, I am shown a particular contact.
As a user, if 'display attribute' is typed, I am prompted to enter an attribute so that I can see all of the contacts according to that attribute.
As a user, if 'delete' is typed, I am prompted to enter an attribute value of the contact to be deleted.
As a user, if 'exit' is typed, I am exited out of the program and returned to the command line.



DOING

As a user, I am presented with a prompt to 'add', 'modify', 'display all', 'display contact', display attribute', 'delete' and 'exit'.

DONE

=end


#this is the user story 
#this includes all the methods that fall under the same CRM category 

class CRM 

	attr_reader :name, :first_name, :last_name, :email, :note

	#def to test instance var accessible outside of initialize
	def testing_instance_var 

		puts "Hi #{@name} is an instance variable"

	end

	def print_main_menu
	puts "Welcome to the #{name} CRM"
	  puts "[1] Add a new contact"
	  puts "[2] Modify an existing contact"
	  puts "[3] Delete a contact"
	  puts "[4] Display all the contacts"
	  puts "[5] Display an attribute"
	  puts "[6] Exit"
	  puts "Enter a number: "
	end

	def main_menu

	  #method print_main_menu called when the method main_menu is called
	  print_main_menu
	  user_selected = gets.to_i

	  #the variable user_selected collects the user's input, which is itsel passed as an arg in a method, which is yet to be defined
	  call_option(user_selected)
	end


	def call_option(user_selected)
	  # add_new_contact if user_selected == 1
	  # modify_existing_contact if user_selected == 2
	  # delete_existing_contact if user_selected == 3
	  # display_all_contacts if user_selected == 4
	  # display_attribute if user_selected == 5
	  # back_main_menu if user_selected == 6


		  case user_selected
		  when 1
		  	then add_new_contact 
		  when 2
		  	then modify_existing_contact
		  when 3
		  	then delete_existing_contact 
		  when 4
		  	then display_all_contacts 
		  when 5
		  	 then  display_attribute 
		  when 6
		  	then main_menu
		  		#exit and return do not work
		  else
		  		puts "Invalid Selection - Please try again"
		  		main_menu
		  end

	end


	#List of methods corresponding to user's selection from print_main_menu

	def add_new_contact
		  print "Enter First Name: "
		  first_name = gets.chomp.capitalize!


		  print "Enter Last Name: "
		  last_name = gets.chomp.capitalize!


		  print "Enter Email Address: "
		  email = gets.chomp
		  print "Enter a Note: "
		  note = gets.chomp

		  puts "You have entered: "
		  puts "#{first_name}"
		  puts "#{last_name}"
		  puts "#{email}"
		  puts "#{note}"

		  #instance of class Contact initialized each time a new contact is added
		  #local var converted into instance var inside class Contact?
		  #what about variable contact?

		  #inside CRM, we can access other class
		  contact = Contact.new(first_name, last_name, email, note)
		  @rolodex.add_contact(contact)

		  #do not forget to add the attr_reader inside Contact - so the method can b read
		  #finally, no need to repeat if we set the class Contact as a subclass of CRM. Thus, the attr_reader is inherited from CRM
		  puts contact.first_name
		  puts contact.last_name
		  puts contact.email
		  puts contact.note 
		  puts contact.id


		  #how a method can work outside of a class - Answer : create a subclass
		  #@rolodex.add_contact(contact)

		  #using the var contact to output the user's info


	
		  #extra - def a method to output a user's info nicely
	 
	end

	 # def user_data_output
		# 	#instance var set in the class Contact
  # 		  puts "You are #{@first_name} #{@last_name} ; your email is #{@email}"
  # 		  puts "Your note : #{@note}"
	 # end



	def initialize(name) 

		#converting the local var into an instance var in order to make it available outside of initialize 
		@name = name

		#below using name or @name is fine ; we are using the attr_accessor which allows to read the method
		#if the Welcome is added to initializer will happen just once
		#if u want it to happen all the time (when going back to main menu), add to main_menu method


		#new Rolodex instance upon initialization of a CRM instance - works in pairs
		@rolodex = Rolodex.new
		# main_menu
	end

	def self.run(name)
	    crm = CRM.new(name)
	    crm.main_menu
    end

end 



#we need to add an attr_reader to make the method name available outside of the class
#although, probably to keep things inside the class 
#not a good 




#new class to store user's info ; the parameters correspond to the 
class Contact < CRM

	#attr_accessor here to retrieve data
	attr_accessor :id, :name, :first_name, :last_name, :email, :note
	# attr_reader :name, :first_name, :last_name, :email, :note
	#needs to be inside the class Contact to allow the following methods to be read


	#we need setter/getter methods in order to set/get value of an attr.

	#getter - we can then read from it
	def email
		@email		
	end

	#setter - set a default to avoid error in the case the note is missing
	def note(note= "no notes")
	    @note = note
  	end


  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email 
    @note = note
  end


end


class Rolodex 


  def initialize
    @contacts = []
    @contact_id = 1000
  end

  

  def add_contact(contact)
  
  	#any new contact gets pushed into the @contact [] array
    @contacts << contact

    #creates a new object - a unique id #
    #then, we need to be able to read it, so we are adding an attr_accessor at the top
    contact.id = @contact_id

    #contact_id incremented each time a new contact is added
    @contact_id += 1

  end
end

#once the class CRM is created, we need to create an instance of a class.
#then, call the main_menu method on this new instance

#We want to add a greeting
#We are using the method .new to passed in an arg
#the greeting message will be rendered with method initialize using the argument "Bitmaker"



# crm = CRM.new


crm = CRM.run("Bitmaker")
puts crm

# puts crm.main_menu


#testing the instance variable on new instance


