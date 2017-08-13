#!/usr/bin/ruby

# Selenium使用可能
require 'selenium-webdriver'

# Seleniumを使用する(chrome)
driver = Selenium::WebDriver.for :chrome

# URLを指定する
driver.get "https://ctu.fletsnet.com/CtuC101/init.do"

# 待ち時間指定
driver.manage.timeouts.implicit_wait = 15

# ウィンドウを最大サイズにする
driver.manage().window().maximize()


def accessEnd(driver)
	# headderフレーム切り替え
	pageFrame = driver.find_element(:xpath, "//html/frameset/frame")
	driver.switch_to.frame( pageFrame )
	
	# リンククリック
	driver.find_element(:xpath, "/html/body/form/table/tbody/tr[2]/td/table/tbody/tr/td[2]/a[1]").click
	
	#プロンプトOKクリック
	alert = driver.switch_to.alert
	alert.accept
end

def changeBodyFrame(driver)
	# ボディフレームに切り替え
	bodyFrame = driver.find_element(:xpath, "/html/frameset/frameset/frame[2]")
	driver.switch_to.frame( bodyFrame )
end

puts "ログインボタン押下前"

## ログインボタン押下
formSubmit = driver.find_element(:xpath, "//input[@name='btnLogin']")
formSubmit.click

puts "ログインボタン押下後"
puts "フレーム切り替え前(1)"

changeBodyFrame(driver)

puts "フレーム切り替え後(1)"
puts "切断ボタン押下前(1)"
# 切断ボタン押下
driver.find_element(:xpath, "/html/body/form/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td/div/table[3]/tbody/tr[2]/td[4]/input").click

puts "切断ボタン押下前(1)"
puts "フレーム切り替え前(2)"

changeBodyFrame(driver)

puts "フレーム切り替え後(2)"
puts "切断ボタン押下前(2)"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
begin
	puts "begin節"
	element = wait.until { driver.find_element(:xpath, "/html/body/form/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td/div/table[3]/tbody/tr[2]/td[4]/input") }
rescue => e
	puts "ensure節"
	accessEnd(driver)
	driver.quit()
	exit
end
	
# 切断ボタン押下
driver.find_element(:xpath, "/html/body/form/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td/div/table[3]/tbody/tr[2]/td[4]/input").click

puts "切断ボタン押下前(2)"
puts "ログアウト前"
accessEnd(driver)
puts "ログアウト後"
driver.save_screenshot("./screen.png")

driver.quit()
