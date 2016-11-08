require 'rspec'
require 'page-object'
require 'selenium-webdriver'
require 'pry'
#require 'pretty_face'

DEFAULT_TIMEOUT = 10
BROWSER = :safari

driver = Selenium::WebDriver.for BROWSER
$driver = driver
$driver.manage().window().maximize();
$driver.manage.timeouts.implicit_wait = DEFAULT_TIMEOUT