# Contactify Plugin for [DocPad](http://docpad.org)

A fully customizable DocPad contact form plugin.


## Install

```
npm install --save docpad-plugin-contactify
```

Or add it to your package.json file


## Usage (more coming soon)

### Setup for single contact form

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

### Setup for multiple contact forms

Configure the path to be intercepted on your server and the email details for sending out form data in the DocPad configuration file (aka docpad.coffee):

```coffeescript
	plugins:
		contactify:
			contact:
				path: '/contact-form'
				from: me@site.name,
				redirect: '/'
				to: 'me@site.name'
				subject: 'Inquiry' # OPTIONAL
				honeypot: 'honey' # OPTIONAL: honeypot input field name
				fields: ['message', 'phone-number', 'address']
			subscribe:
				path: '/subscribe-form'
				from: you@site.name,
				redirect: '/'
				to: 'you@site.name'
				subject: 'Subscribe to newsletter'
				honeypot: 'honey'
				fields: ['message', 'list']
			transport: {
				service: 'Gmail',
				auth: {
					user: 'contact@me.com',
					pass: 'password'
				}
			}
```

API:
- path: should match the POST action on your site's form.

- transport: configures an SMTP transport instance using [nodemailer](http://www.nodemailer.com/) (any email account should do, it is where the mail is sent from)

- from: you can here force a value to put in the 'from' field in the sent email. By default the from value is the email of the person who send the contact form.

- redirect: options that will be overwritten by the hidden input called redirect in your form (if it exists)

- to: list of destination email addresses for sending form submissions (comma separated)

- subject: OPTIONAL subject line of email

- honeypot:  OPTIONAL: honeypot input field name for spam prevention. If this field is filled out mail will not send

- fields: OPTIONAL: a list of input field names to include in email message. DEFAULT: ['message']


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
