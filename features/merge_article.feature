Feature: Merge articles
   As an admin
   In order to avoid redundency 
   I want to merge articles with similar content

   Background:
     Given the blog is set up

     Given the following users exist:
        | profile_id | login | name | password | email           | state  |
        |  2         | num_2 | User2| 123456   | user2@gmail.com | active |
        |  3         | num_3 | User3| abcdef   | user3@gmail.com | active |

     Given the following articles exist:
        | id | title | author | user_id | body | allow_comments| published |published_at         |state      | type    |
        | 3  | One   | num_2  |  2      | blah |  true         |  true     | 2015-14-03 22:30:00 | published | Article |
        | 4  | Two   | num_3  |  3      | bler |  true         |  true     | 2015-14-03 22:30:00 | published | Article |

     Given the following comments exist:
        | id | type    | author | body | article_id | user_id | created_at          |
        | 1  | Comment | num_2  | abcd |  3         |  2      | 2015-14-03 22:30:00 |
        | 2  | Comment | num_3  | 1234 |  4         |  3      | 2015-14-03 22:30:00 |


   Scenario: Non-admin cannot merge
      Given I am logged in as "num_2" with pass "123456"
      And I am on the Edit Page of Article with id 3
      Then I should not see "Merge Articles" 

   Scenario: Merged article should contain text from both authors
      Given the articles with ids "3" and "4" were merged
      And I am on the home page
      Then I should see "One"
      When I follow "One"
      Then I should see "blah"
      And I should see "bler"     


   Scenario: Merged article should have one of the previous authors
      Given the articles with ids "3" and "4" were merged
      And I am on the home page
      Then the author of "3" should be "num_2"


   Scenario: Commments from both articles should be shown
      Given the articles with ids "3" and "4" were merged
      And I am on the home page
      Then I should see "One"
      When I follow "One"
      Then I should see "abcd"
      And I should see "1234"


   Scenario: The title of the merged article should be one of the previous titles
      Given the articles with ids "3" and "4" were merged
      And I am on the home page
      Then I should see "One"
      And I should not see "Two"