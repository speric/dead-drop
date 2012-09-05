dead-drop
=========

dead-drop is Sinatra-based Ruby app used for Q&A sessions at Trinity Church.  Participants send an email to an address we provide them.  The `mail.rb` script runs via cron on our server every 10 minutes, grabbing emails from that inbox, and parsing only the body of the email, which is saved to the database.  The email is then deleted.  No record of the sender is ever read or kept.

Whoever is running the Q&A can then see all the questions, anonymously, through the web UI. A great way to use an app like this would be to hook a laptop up to a projector or large TV screen, and run the app in a browser in full-screen mode.

**TODO**

* Use Backbone.js for more dynamic UI
* Automatically refresh list of messages
* Add "Mark as Read" functionality