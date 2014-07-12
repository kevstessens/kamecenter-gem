# Kamecenter

This gem allows RoR-developed games to publish achievements for their users into Kamecenter, with two simple methods.


## Installation

Add this line to your application's Gemfile:

	gem 'kamecenter', github: 'kevstessens/kamecenter-gem'

And then execute:

    $ bundle install

## Usage

###Posting an achievement

	Kamecenter.post_achievement("game_key","achievement_id","uid","secret_key")

	It returns a Response object, with a state and a message

####example
    response = Kamecenter.post_achievement("1efe33f3f3","20","223345","wej39fj39fj39jf")
    response.state => Returns the state of the operation
        - 10: SUCCESS
        - 20: INCORRECT SIGNATURE
        - 30: ALREADY ADDED
    response.message => Returns a message (like "Incorrect signature!")

###Getting data from a user

	Kamecenter.get_user_data("game_key","uid","secret_key")

	It returns a User object,with a uid, a name, and a list of achievements. Each achievement has points, id, and name

####example
    response = Kamecenter.get_user_data("1efe33f3f3","243343435","wej39fj39fj39jf")
    response.uid => Returns the Facebook UID
    response.name => Returns the user name
    response.achievements => Returns an array of achievements
       - response.achievements[0].name => Returns the achievement name
       - response.achievements[0].id => Returns the id of the achievement
       - response.achievement[0].points => Returns the points for the achievement


##Getting iframe URL for user

	Kamecenter.get_iframe_url("game_key","uid","secret_key")

	It returns a string, that must be used as Iframe src.

####example
<iframe src="<%= Kamecenter.get_iframe_url("1efe33f3f3","243343435","wej39fj39fj39jf") %>"></iframe>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Details

Created by Kevin Stessens for DPOI - Universidad Austral