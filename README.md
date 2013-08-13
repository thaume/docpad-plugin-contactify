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
					user: 'hello@myamazingstartup.com',
					pass: 'password'
				}
			}
			redirect: '/'
			to: 'me@site.name'
```

path: should match the POST action on your site's form.
transport: configures an SMTP transport instance using [nodemailer](http://www.nodemailer.com/)
redirect: options that will be overwritten by the hidden input called redirect in your form (if it exists)
to: may be a list of destination email addresses for sending form submissions


## License
Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://creativecommons.org/licenses/MIT/)
<br/>Copyright &copy; 2013+ [thaume](http://thau.me)