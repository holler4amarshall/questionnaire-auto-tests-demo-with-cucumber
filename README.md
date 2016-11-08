# questionnaire-auto-tests-demo-with-cucumber
A brief demonstration of automated test cases using Cucumber, Selenium WebDriver and Ruby  

The tests are based on a simple 'Zingtree' decision tree to determine a set of questions to be answered by the user based on their parental situation.  

The application under test can be found at: http://zingtree.com/host.php?style=buttons&tree_id=578554002&persist_names=Restart&persist_node_ids=1#1  

##Execute tests
####Pre-requisites:

* Clone test repository to your computer  
* Ensure Ruby, Cucumber, Selenium-WebDriver, ChromeDriver, Page-Objects are installed

####Run the tests
In the root folder of your local copy of the test project, execute the command "cucumber" >> See the test results displayed in the terminal >> See that test results are updated in the report.html file. 

##Test Reports
The last successful run report has been uploaded on GitHub and is available at: /report.html, to view in your browser of choice.

## Test coverage
Testing could be carried out using automated and exploratory techniques

### Automated tests: 
The automated tests are created with cucumber feature files with corresponding step definitions in Ruby.  

The demonstrated tests cover only the vanilla workflow to test the decision tree.  

The tests do not cover: navigation, errors, server-side testing, web-service testing, security testing, performance testing etc. The tests are intended to be a brief demo only. 

### Exploratory tests: 
Exploratory tests could cover the following additional items:   

* Manipulate URL directly to try to access questions (views/screens) without answering the pre-requisite questions
* Test navigation buttons: Back, Reset, Header, Footer etc. 
* Server-side testing: use a proxy tool or a browser add on to manipulate the responses being sent to the server to ensure that an error is returned if non valid responses are entered. (NOTE: for this type of form, this type of testing may not be required, unless the data were very important, such as a census form etc)
* Cross platform/browser tests (mobile, pc, mac, chrome, firefox, safari etc)

## Issues encountered: 
1) Due to using cucumber, the automation tests are focussed on matching as many test steps as possible to each Gherkin statement.  
 
An alternative approach could have been taken, where cucumber was not used, in order to make greater use of OOP/Page Objects design techniques. This type of approach would have resulted in less lines of code. This approach could have also made use of mapping each page object to the corresponding node-id in the code, in order to identify elements with greater efficiency.  

2) I chose to demonstrate the workflow using a free online tool: 'Zingtree'. In the tests, I made use of *long and cumbersome xPath identifiers* because the code did not contain many unique IDs, and the elements were duplicated across active and inactive views. If I were to be working on this project, I would try to improve my tests, by working with programmers to allow some elements to be identified by ID.    
         
3) The tests are designed to be executed against Chrome browser only. When executing against other browsers, some elements may not be found, due to discrepancies with xPaths across browsers, and the lack of Ids in the code base.  Further work could be done to improve the cross platform/browser test coverage. 

4) My Zingtree solution focusses on the various definitions of a parent, but does not, however, present the options at a single "step 4". I would build this differently if doing this project again. Especially, I would focus on improving the usability, design and workflow of the questions/form. Ideally, this would be presented as a Single Page Application, and the fields to be populated for the required parents should appear dynamically at Step 4. 

