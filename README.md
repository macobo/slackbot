slackbot [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)
========

This is a repo showing how you can create your own slackbot and deploy it to heroku.

There are multiple steps involved:

1. Clone and install dependencies.
---

Look to the right, you should see a `clone URL` box.

To get this code locally, run `git clone THATURL` via the command line.

If that succeeded, you should be able to move to the cloned repo (`cd slackbot`).

Try running `bundle install` which installs all the dependencies you need for this.

2. Try out echobot
---

Run `ruby bot.rb` to run the bot locally within your command line shell.

3. Edit `bot.rb`
---

The current `bot.rb` contains code for a simple bot that echoes everything back that you say to it.

Make it do something else and test it!

4a. Deploy to heroku using the heroku button
---

You will need an account, slack webhook set up and slack credentials ready to do this. See the section on the very button on how to attain those.

Click on the purple button at the top and fill out the forms. Leave the `BUILDPACK_URL` fields as it currently is.

Copy down the url that slack gives you and change the webhook you created to use that url.

