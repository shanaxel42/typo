Feature: Fix bug with catergories link
	As a blog admin
	In order to group articles 
	I want to create and manage categories for articles


	Background: 
		Given the blog is set up
		And I am logged into the admin panel
		When I follow "Categories"

	Scenario: I should be on the Categories page
		Then I should see "Categories"
		And I should see "Name"

	Scenario: Create a new category
		When I fill in "Name" with "Shannon"
		And I press "Save"
		Then I should see "Shannon"

	Scenario: Edit existing feature
		When I follow "General" 
		And I fill in "Description" with "Coolest person ever"
		And I press "Save"
		Then I should see "Coolest person ever"

