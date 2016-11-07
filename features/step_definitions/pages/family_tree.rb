
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
	end
end