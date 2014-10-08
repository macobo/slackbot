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

Make it do something else and test it!

4a. Deploy to heroku using the heroku button
---

You will need an account, slack webhook set up and slack credentials ready to do this. See the section on the very button on how to attain those.

Click on the purple button at the top and fill out the forms. Leave the `BUILDPACK_URL` fields as it currently is.

Copy down the url that slack gives you and change the webhook you created to use that url.

4b. Deploy to heroku using the command line
---

This will allow you to comfortably redeploy and make future enhancements to your bot.

You will need an account, slack webhook set up and slack credentials ready to do this. See the section on the very button on how to attain those. You will also need [heroku toolbelt](https://toolbelt.heroku.com), though I would suggest avoiding piping commands like the page is suggesting you to.

After that is set up, navigate on the command line to the cloned repository:
* `heroku login`
* `heroku create myawesomeslackbot` - create an heroku app. You can replace the `myawesomeslackbot` with the website name you need. Mark down the url the command outputs and set the slack webhook to point to that url.
* `heroku config:set SLACK_API_TOKEN=XXXXXXXX` - see last section for a guide how to attain this.
* (optional) `heroku config:set SLACK_WEBHOOK_TOKEN=XXXXXX` - see last section for a guide how to attain this. This makes it hard if not impossible for parties other than slack to query your bot.
* After doing your changes, `git commit -am "your commit message"` and `git push heroku master` deploys your bot.
* For debugging, you can also look at the logs: `heroku logs -t`

5. Creating webhooks
----

Slack uses a technology called webhooks to notify your bot of new messages in chat. More specifically, once you set up your bot, each time a new message is posted in the channels that the bot frequents, slack requests a web page we specify and sends us some data about the message.

To set up the web hook, go [here](https://slack.com/services/new/outgoing-webhook) and fill out the form.

For channel, pick a channel that isn't full of people. For example, `#bot-testing` will do perfectly.

For trigger words, pick `yourbotname:` - this way only messages containing the bots name will be sent to the server.

For URL(s), paste in the url heroku gave you (with the protocol and trailing slash) when you launched the instance. You can initially register the webhook without one, but you want to fill it out later.

6. API token
----

Due to the use of webhooks, it is not possible for the bot to normally private message users. However, slack has a separate API which enables doing exactly that.

To be able to send private messages to people, go to [Slack API page](https://api.slack.com/#auth), create a API token if you didn't have one before and use that when creating your bot.

# Addendum

If you run into issues, feel free to create an issue on this repository and I'll do my best to help. Good luck!
