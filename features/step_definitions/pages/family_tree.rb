
require_relative 'parental_status'

module Family_Tree

	class << self

		include PageObject

		# parental information

		def node_id(hint)
			screen_title = hint
			question = hint
			response = hint

			if screen_title == 'Welcome to Family Tree' || question == 'Were you an orphan'
				@node_id = 'node-578554002-1' 
			elsif screen_title == 'Orphaned or state dependent' || response == 'answer our questions at step 4'
				@node_id = 'node-578554002-2'
			elsif screen_title == 'Parental status' || question == 'parents still alive and married'
				@node_id = 'node-578554002-3'
			elsif screen_title == 'Living married birth parents' || response == 'married birth mother and birth father'
				@node_id = 'node-578554002-4'
			elsif screen_title == 'Birth parents not married and alive'
				@node_id = 'node-578554002-5' 
			end 
		end







		def open_family_tree_quesionnaire
			$driver.navigate.to "http://zingtree.com/host.php?style=buttons&tree_id=578554002&persist_names=Restart&persist_node_ids=1"
		end


		def verify_family_tree_title
			sleep 1
			heading = $driver.find_element(:id, "title")
			fail "title text incorrect" unless (heading.text) == "parental information"
		end


		def verify_welcome_title
			sleep 1
			welcome = $driver.find_element(:xpath, "//span[text()='Welcome to Family Tree']")
			fail "welcome title incorrect" unless (welcome.text) == "Welcome to Family Tree"
			#@screen_title = 'welcome'
		end

		def get_node_id_from_active_block
			active_block = $driver.find_element(:xpath, "//div[contains(@id, 'node-578554002')][@style='display: block;']")
			@node_id = active_block.id
			puts @node_id
		end


		def click_response(response)
			#binding.pry
			#$driver.find_element(:xpath, "//div[@style='display: block;']//*/a[text()='#{response}']").click
			active_block = "//div[@id='nodes']/div[not(contains(@style, 'none'))]"
			$driver.find_element(:xpath, "#{active_block}//*/a[text()='#{response}']").click
		end


		def verify_question(question)
			sleep 3
			orphan_q = $driver.find_element(:xpath, "//div[not(contains(@style, 'none'))]//*/span[@id='node-question' and contains(text(), '#{question}')]") 
			puts orphan_q.text
			fail "question not displayed" unless (orphan_q.text).include? "#{question}"
		end

		
		def verify_screen(screen_title)
			sleep 3
			active_block = "//div[not(contains(@style, 'none'))]"
			heading = $driver.find_element(:xpath, "#{active_block}//*/span[@id='node-title' and contains(text(), '#{screen_title}')]")
			fail "title text incorrect" unless (heading.text).include? "#{screen_title}"
		end


		def verify_response(response)
			sleep 1
			answer = $driver.find_element(:xpath, "//div[@id='nodes']/div[not(contains(@style, 'none'))]//*/div[@class='content-answer']")
			puts answer.text
			fail "#{answer.text} response does not contain #{response}" unless answer.text.include? "#{response}"
		end


		def get_node_id_by_screen(screen)
			if screen == 'Welcome'
				@node_id = 'node-578554002-1'
			elsif screen == 'Parental status'
				@node_id == Parental_Status.node_id
			end
		end
	end
end
