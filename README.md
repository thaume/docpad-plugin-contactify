# Contactify Plugin for [DocPad](http://docpad.org)

A fully customizable DocPad contact form plugin.


## Install

```
npm install --save docpad-plugin-contactify
```

Or add it to your package.json file


## Usage (more coming soon)

### Setup

Configure the path to be intercepted on your server and the email details for sending out form data in the DocPad configuration file (aka docpad.coffee):

```coffeescript
	plugins:
		contactify:
			path: '/contact-form'
			transport: {
				service: 'Gmail',
				auth: {
					user: 'contact@me.com',
					pass: 'password'
				}
			}
			from: me@site.name,
			redirect: '/'
			to: 'me@site.name'
```

API:
- path: should match the POST action on your site's form.

- transport: configures an SMTP transport instance using [nodemailer](http://www.nodemailer.com/) (any email account should do, it is where the mail is sent from)

- from: you can here force a value to put in the 'from' field in the sent email. By default the from value is the email of the person who send the contact form.

- redirect: options that will be overwritten by the hidden input called redirect in your form (if it exists)

- to: list of destination email addresses for sending form submissions (comma separated)

Then create your contact form:

```HTML
<form action="/contact-form" method="POST">
	<fieldset>
		<legend>Contact form</legend>
		<input type="hidden" name="redirect" value="<%- @document.url %>?formSent=1">
		<p>
			<label for="name">Name/company</label>
			<input type="text" id="name" name="name" placeholder="Name/company" />
		</p>
		<p>
			<label for="email">Your email adress</label>
			<input type="email" id="email" name="email" placeholder="contact@me.com" />
		</p>
		<p>
			<label for="message">My message</label>
			<textarea id="message" name="message" cols="10" rows="10" placeholder="Your message..."></textarea>
		</p>
		<p>
			<button type="submit" value="Send" name="contact-send" id="contact-send">Send</button>
		</p>
	</fieldset>
</form>
```

Note that here the hidden input 'redirect' will redirect to the page where the form was sent from, you can hard-code any other url you want in there

## License
Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://creativecommons.org/licenses/MIT/)
<br/>Copyright &copy; 2013+ [thaume](http://thau.me)
