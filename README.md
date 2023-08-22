Installation:
1.	Install Ruby && Devkit
	a.	http://rubyinstaller.org/downloads (Ruby+Devkit 3.2.2-1 (x64))
	b.	select option 3 (i.e. MYS2 & MINGW Developmenttoolchain) for devkit installation when prompted.
2.	Install Firefox/chrome/edge
3.  Copy from lib folder or install - Gekodriver.exe/chromedriver.exe/msedgedriver.exe and place in c:/users/<user>/.webdriver 
	- If any issue is faced, add Environemnt variable "path" for webdriver location
5   Go to any drive and download repo from github https://github.com/dipitigahlot/sauce_demo
6.	open cmd/gitbash and go to repo for sauce_demo_master and run below command
	a.	bundle install
7.	open project <sauce_demo_master> in editor (Preferably RubyMine)

Execution command:

Firefox:
bundle exec cucumber -t '@buy_product' user_name=standard_user password=secret_sauce

chrome:
bundle exec cucumber -t '@buy_product' user_name=standard_user password=secret_sauce browser=chrome

Execution + Report:
bundle exec cucumber -t '@buy_product' user_name=standard_user password=secret_sauce browser=chrome --format html --out=report.html -f pretty --color