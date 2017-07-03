#!/usr/bin/ruby

# Selenium使用可能
require 'selenium-webdriver'

# Seleniumを使用する(chrome)
driver = Selenium::WebDriver.for :chrome
# URLを指定する
driver.get "http://192.168.10.1/login.asp"

# ブラウザサイズを指定する
driver.manage().window().maximize()

# パスワードを入力
inputPassword = driver.find_element(:id => "DummyPassword")
inputPassword.send_keys("admin")

# ログインボタン押下
formSubmit = driver.find_element(:id => "FoxLoginSubmit")
formSubmit.click

# フレーム切り替え(コンボボック等が別フレームに存在するため)
driver.switch_to.frame("view")

# selectタグの要素を取得
select = Selenium::WebDriver::Support::Select.new(driver.find_element(:tag_name, "select"))
# ５番目の要素を選択する(０始まり)
select.select_by(:index, 5)

# 再起動リンクを取得＆クリック
reload = driver.find_element(:id => "FoxSystemReboot")
reload.click

driv er.quit()
