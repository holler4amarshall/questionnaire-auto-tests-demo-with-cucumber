module Parental_Status

	class << self

		include PageObject

		# Are both parents still alive and married? 

		def initialize
			@screen_title = 'Parental status' 
			@question = 'parents still alive and married'
			@node_id = 'node-578554002-3'
			@yes_href = '#4'
			@no_href = '#3'
		end 

		def click_response(response)
			if response == 'No'
				$driver.find_element(:xpath, ".//a[@href='#5'][text()='No']").click
			elsif response == 'Yes'
				$driver.find_element(:xpath, ".//a[@href='#4'][text()='Yes']").click
			end
		end
	end
end
