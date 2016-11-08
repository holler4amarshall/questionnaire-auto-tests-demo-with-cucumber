
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

		def verify_question(question)
			sleep 3
			node_id(question)
			node_id = @node_id
			#puts "//div[@id='#{node_id}']//*/span[@id='node-question']"
			orphan_q = $driver.find_element(:xpath, "//div[@id='#{@node_id}']//*/span[@id='node-question']")
			fail "question not displayed" unless (orphan_q.text).include? "#{question}"
		end

		def click_response(answer)
			sleep 3
			#$driver.find_element(:xpath, "//a[contains(text(), '#{answer}')]").click
			$driver.find_element(:xpath, "//a[contains(@onclick, '#{answer}')]").click
			#response.click
		end

		def verify_screen(screen_title)
			sleep 3
			node_id(screen_title)
			#puts @node_id
			#puts "//div[@id='#{@node_id}']//*/span[@id='node-title']"
			heading = $driver.find_element(:xpath, "//div[@id='#{@node_id}']//*/span[@id='node-title']")
			puts heading.text
			fail "title text incorrect" unless (heading.text).include? "#{screen_title}"
		end

		def verify_response(response)
			sleep 3
			node_id(response)
			node_id = @node_id
			puts node_id
			answer = $driver.find_element(:xpath, "//div[@id='#{@node_id}']//*/div[@class='content-answer']")
			puts answer.text
			fail "response text incorrect" unless (answer.text).include? "#{response}"
		end
	end
end