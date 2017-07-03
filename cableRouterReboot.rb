#!/usr/bin/ruby

# Selenium使用可能
require 'selenium-webdriver'

# Seleniumを使用する(chrome)
driver = Selenium::WebDriver.for :chrome

# URLを指定する
driver.get "https://ctu.fletsnet.com/CtuC101/init.do"

## ログインボタン押下
formSubmit = driver.find_element(:name => "btnLogin")
formSubmit.click

driver.manage.window.maximize;
#wait = Selenium::WebDriver::Wait.new(:timeout => 0)
#wait.until { ( driver.find_element(:tag_name => "table").displayed ) }
#begin
#	element = wait.until{ driver.find_element(:tag_name => "table") }
#ensure
#	driver.quit
#end

driver.manage.timeouts.implicit_wait = 5

driver.save_screenshot("./screen.png")




driver.quit()

