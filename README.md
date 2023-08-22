
1.	Install Ruby && Devkit
a.	http://rubyinstaller.org/downloads
b.	IF added Ruby without devkit then you need to download devkit separately Development Kit²⁹ https://rubyinstaller.org/add-ond/devkit/
c.	Run these commands
i.	ruby dk.rb init 
ii.	ruby dk.rb install
2.	Install Firefox/chrome/edge
3.	Go to any drive (I used c:)
4.	Go to Git bash and use command below
a.	Gem install testgen
b.	Gem install bundler
c.	testgen project sauce_demo
5.	open project <sauce_demo> in editor (I used RubyMine)

Execution command:
bundle exec cucumber -t '@buy_product' user_name=standard_user password=secret_sauce browser=edge

