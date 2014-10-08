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

Run `bundle exec ruby bot.rb` to run the bot locally within your command line shell.


3. Edit `bot.rb`
---

The current `bot.rb` contains code for a simple bot that echoes everything back that you say to it.

Make it do something else and test it! You'll probably want to change the name from `echobot`. Find everywhere that `echobot` shows up in bot.rb and change them all to your new name.


4. Create a slack webhook
----

Slack uses a technology called webhooks to notify your bot of new messages in chat. More specifically, once you set up your bot, each time a new message is posted in the channels that the bot frequents, slack requests a web page we specify and sends us some data about the message.

Go [here](https://slack.com/services/new/outgoing-webhook) and click "Add Outgoing Webhook." Leave this open for now; you'll have to come back and fill it out in a few minutes.


5. Get a slack API token
----

If you want your bot to be able to send direct messages to people, you'll need an API token. Go to the [Slack API page](https://api.slack.com/#auth), create one, and leave this page open for now.


6a. Deploy to heroku using the heroku button
---

You will need a heroku account, which you can sign up for at www.heroku.com.

Click on the purple button at the top and fill out the forms. Leave the `BUILDPACK_URL` fields as it currently is.

Copy down the url that slack gives you.


6b. Deploy to heroku using the command line
---

This will allow you to comfortably redeploy and make future enhancements to your bot.

You will need a heroku account, which you can sign up for at www.heroku.com. You'll need to add your ssh *public* key to your heroku account.

You will also need the [heroku toolbelt](https://toolbelt.heroku.com), though I would suggest avoiding piping commands like the page is suggesting you to.

After that is set up, navigate on the command line to the cloned repository and:
* `heroku login`
* `heroku create myawesomeslackbot` - create a heroku app. You can replace `myawesomeslackbot` with anything. The name of your bot is a good choice, but if the command says that name is take, chose anything. Copy the url that the command outputs (something like http://yourbot.herokuapp.com/).
* `heroku config:set SLACK_API_TOKEN=XXXXXXXX` - from step 5, in the left sidebar.
* (optional) `heroku config:set SLACK_WEBHOOK_TOKEN=XXXXXX` - from step 4. This makes it hard if not impossible for parties other than slack to query your bot.
* `git push heroku master` deploys your bot.


7. Finish setting up the webhook
----

Now go back to the page from step 4 and fill out the form.

For channel, pick a channel that isn't full of people. For example, `#bot-testing` will do perfectly.

*Very important!* For trigger words, pick `yourbotname:` - this way only messages containing the bots name will be sent to the server. If you leave this out, the bot will get all messages in any channel it's in, and if it's in a serious channel this might send sensitive info to a 3rd party.

For the URL, paste the one heroku gave you when you launched the instance. It'll look like `http://yourbot.herokuapp.com/`. Make sure to include the protocol (http://) and the slash after .com.

Fill in the label using the name of your bot.

Finally, save the integration.

*Congratulations!* Now you can talk to your bot on slack!!


8. Improve your bot
----

* Make some changes.
* Test on your computer with `bundle exec ruby bot.rb`.
* Save them to git. If you're a total git beginner, this should get you started:
** `git add .`
** `git commit -am "description of what you changed"` (this description is private)
* Deploy your changes with `git push heroku master`.
* For debugging, you can look at the logs: `heroku logs -t`


# Addendum

If you run into issues, feel free to create an issue on this repository and I'll do my best to help. Good luck!
