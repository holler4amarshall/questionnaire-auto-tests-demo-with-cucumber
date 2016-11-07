
module Family_Tree

	class << self

		include PageObject

		# parental information

		def open_family_tree_quesionnaire
			$driver.navigate.to "http://zingtree.com/host.php?style=buttons&tree_id=578554002&persist_names=Restart&persist_node_ids=1"
		end


		def verify_family_tree_title
			sleep 2
			heading = $driver.find_element(:id, "title")
			fail "title text incorrect" unless (heading.text) == "parental information"
		end


		def verify_welcome_title
			sleep 2
			welcome = $driver.find_element(:xpath, "//span[text()='Welcome to Family Tree']")
			fail "welcome title incorrect" unless (welcome.text) == "Welcome to Family Tree"
		end

		def verify_question(question)
			sleep 2
			orphan_q = $driver.find_element(:xpath, "//div[@id='node-578554002-1']//*/span[@id='node-question']")
			fail "question not displayed" unless (orphan_q.text).include? "#{question}"
		end

		def click_response(answer)
			sleep 2
			response = $driver.find_element(:xpath, "//a[contains(text(), '#{answer}')]")
			response.click
		end

		def verify_screen(screen_title)
			sleep 5
			heading = $driver.find_element(:xpath, "//div[@id='node-578554002-2']//*/span[@id='node-title']")
			puts heading.text
			fail "title text incorrect" unless (heading.text).include? "#{screen_title}"
		end
	end
end