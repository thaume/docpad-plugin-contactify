nodemailer = require 'nodemailer'

module.exports = (BasePlugin) ->

	class ContactifyPlugin extends BasePlugin
		name: 'contactify'

		config = docpad.getConfig().plugins.contactify
		smtp = nodemailer.createTransport('SMTP', config.transport)

		serverExtend: (opts) ->
			{server} = opts

			server.post config.path, (req, res) ->
				enquiry = req.body

				receivers = [].push(enquiry.email, config.to)

				mailOptions = {
					to: receivers,
					subject: 'Enquiry from ' + enquiry.name + ' <' + enquiry.email + '>',
					text: enquiry.message,
					html: '<p>' + enquiry.message + '</p>'
				}

				smtp.sendMail mailOptions, (err, resp) ->
					if(err)
						console.log err
					else
						console.log("Message sent: " + resp.message);

				res.redirect enquiry.redirect or '/'

			@