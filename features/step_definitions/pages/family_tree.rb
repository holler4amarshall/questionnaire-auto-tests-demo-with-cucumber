
module FAMILY_TREE

	class << self

		include PageObject

		# parental information

		def open_family_tree_quesionnaire
			$driver.navigate.to "http://zingtree.com/host.php?style=buttons&tree_id=578554002&persist_names=Restart&persist_node_ids=1"
		end


		def verify_family_tree_title
			title = $driver.find_element(:id, "title")
			fail "#{title} is incorrect" unless title == "parental information"
		end


		def verify_welcome_title
			$driver.find_element(:xpath, ".//span[@id='node-title'][text()='Welcome to Family Tree']")
		end
	end
end