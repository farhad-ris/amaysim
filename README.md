# amaysim-iOS

This project doesn’t have any external library as been asked on the test, therefore there is no podfile,
I have added one of Apple's open bundle identifier so you would be able to build it on your devices but still needs a team to be connected to do so.

## Changes in the test
 As I didn't want to spend a lot of time for this test as this is just to test my coding quality, I have decided limit some of the requirements just to one example. Instead I have spent time to write proper models and helpers.
+ As unlike web I needed to get the required information (collection.json) before the login page. Therefore I switch their position and you will see the Splash view first and when it receives the required information it transits to the login page
+ Although I have handled the null values not to causes crashes but to show them correctly I just handled includedData in products.
+ I just handled the includedDataBalance to be represent in GB instead of MB.
+ I just handled the product price to be presented in Dollar.


## Assumptions & ambiguities
As there were some ambiguities in this test case I have made some assumptions and programmed based on these assumptions
+ I have created my own API as requested the json file from it as I couldn't understand how should I exactly get the json in to my app base on this part of the question "Using our public collection.json as a source of customer data we want you to create an app that consumes data from the collection and does the following"
+ I couldn't understand "With that in mind we'd love for you to build a very simple app for us that our Product Manager wants to get up and running for some **User Testing**" did you expect me to write a UITest, UnitTest or ? (probably not a UserExperienceTest). 


## To run please note
+ Set the correct server "ServerUrl" for localhost and "ServerUrlFromMobile" for the build on your device
+ If you use "ServerUrlFromMobile" be sure you set the ip address to your computer's ip address 


### Parts added after submitting the test
+ a vertical unit test for AMTranslate as I've been expalined yesterday that you expected a unit test.

