nodemailer = require 'nodemailer'

module.exports = (BasePlugin) ->

	class ContactifyPlugin extends BasePlugin
		name: 'contactify'

		config = docpad.getConfig().plugins.contactify
		smtp = nodemailer.createTransport('SMTP', config.transport)

		serverExtend: (opts) ->
			{server} = opts

			_addRoute = (path, params) ->

				server.post path, (req, res) ->
					receivers = []
					inquiry = req.body
					message = ""

					config = params if params?

					if config.honeypot? and inquiry[config.honeypot].length > 0 
						return res.redirect if inquiry.redirect? and inquiry.redirect.indexOf('/') == 0 then inquiry.redirect else config.redirect


					fields = config.fields ? ["message"]

					for field in fields
						if inquiry[field]
							message += "#{field}: #{inquiry[field]}\n\r"

					receivers.push(inquiry.email, config.to)

					mailOptions = {
						to: receivers.join(","),
						from: config.from or inquiry.email,
						subject: config.subject or "Inquiry from #{inquiry.name} <'#{inquiry.email}'>",
						text: message or "",
						html: "<p>#{message or ''}</p>"
					}

					smtp.sendMail mailOptions, (err, resp) ->
						if(err)
							console.log err
						else
							console.log("Message sent: " + resp.message);

					res.redirect if inquiry.redirect? and inquiry.redirect.indexOf('/') == 0 then inquiry.redirect else config.redirect

			defaults = ['path', 'fields', 'from', 'redirect', 'to', 'honeypot']

			for key of config
				if key in defaults
					_addRoute config.path
					break

				else if key isnt "transport"
					_addRoute config[key]['path'], config[key] 

			@
