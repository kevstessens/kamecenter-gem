# Kamecenter

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

	gem 'kamecenter', github: 'kevstessens/kamecenter-gem'

And then execute:

    $ bundle install

## Usage

###Posting an achievement

	Kamecenter.post_achievement("game_id","achievement_id","uid","secret_key")

	It returns a Response object, with a state and a message

	example
		response = Kamecenter.post_achievement("1","20","223345","wej39fj39fj39jf")
		response.state => Returns the state of the operation
			- 10: SUCCESS
			- 20: INCORRECT SIGNATURE
			- 30: ALREADY ADDED
		response.message => Returns a message (like "Incorrect signature!")

###Getting data from a user

	Kamecenter.get_user_data("game_id","uid","secret_key")

	It returns a User object,with a uid, a name, and a list of achievements. Each achievement has points, id, and name

	example
		response = Kamecenter.get_user_data("1","243343435","3f34g4hg4h4eg4")
		response.uid => Returns the Facebook UID
		response.name => Returns the user name
		response.achievements => Returns an array of achievements
			response.achievements[0].name => Returns the achievement name
			response.achievements[0].id => Returns the id of the achievement
			response.achievement[0].points => Returns the points for the achievement

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
