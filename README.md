# Contactify Plugin for [DocPad](http://docpad.org)

A fully customizable DocPad contact form plugin.


## Install

```
npm install --save docpad-plugin-contactify
```

Or add it to your package.json file


## Usage (more coming soon)

### Setup

Configure the path to be intercepted on your server and the email details for sending out form data in the DocPad
configuration file:

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
			redirect: '/'
			to: 'me@site.name'
```

API:
- path: should match the POST action on your site's form.
- transport: configures an SMTP transport instance using [nodemailer](http://www.nodemailer.com/) (any email account should do, it is where the mail is sent from)
- redirect: options that will be overwritten by the hidden input called redirect in your form (if it exists)
- to: may be a list of destination email addresses for sending form submissions

Then create your contact form

```HTML
<form action="/contact-form" method="POST">
	<fieldset>
		<legend>Contact form</legend>
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

## License
Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://creativecommons.org/licenses/MIT/)
<br/>Copyright &copy; 2013+ [thaume](http://thau.me)
