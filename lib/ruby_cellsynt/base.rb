class MockResponse 
	def body 
		"ff961dc5e8da688fa78540651160b223 OK" 
	end
	def status 
		200 
	end
end

class RubyCellsynt
	VERSION = "0.1.2"

	def self.send_message(phone_numbers:, from_name:, text:, invoice_reference: nil, username: nil, password: nil, mock: false)
		# simple validation to make sure numbers are in the right format
		# TODO

		# some fatal errors

		# validate phone numbers
		if phone_numbers.length > 25000
			raise "Too many phone numbers at once! Max for Cellsynt is 25k in one batch."
		elsif phone_numbers.length == 0
			raise "No phone number specified"
		else
			# validate each number
			phone_numbers.each do |number|
				# TODO
			end
		end

		# validate SMS text
		# TODO: support unicode
		if not text
			raise "No SMS message text specified!"
		elsif text.length > 5 * 153
			raise "SMS text is too long. Max length is #{5*153} characters"
		end

		# validate from name
		# TODO: support other things than ascii from (phone number, short number)
		if not from_name
			raise "No from_name specified! This needs to be a name the organization can legally use."
		elsif from_name !~ /^[a-zA-Z0-9]{1,11}$/
			raise "Forbidden from name. Needs to be 1-11 characters, a-z A-Z and 0-9 characters allowed only."
		end

		# validate auth settings
		username = username or ENV['CELLSYNT_USERNAME']
		password = password or ENV['CELLSYNT_PASSWORD']

		if username.nil? or password.nil?
			raise "No Cellsynt username or password specified!"
		end

		# join all phone numbers into one parameter
		phone_numbers = phone_numbers.join(",")

		params = { 
			:username => username,
			:password => password,
			:destination => phone_numbers,  
			:text => text.encode(Encoding::ISO_8859_1),
			:originatortype => 'alpha',
			:originator => from_name,
			:allow_concat => 6
		}

		# TODO: invoice ref

		puts "HTTP request params = #{params}"

		# execute post!
		if not mock
			response = Faraday.post 'https://se-1.cellsynt.net/sms.php', params
		else
			# just for testing
			response = MockResponse.new
		end

		puts "HTTP status = #{response.status}"
		puts "HTTP response body: #{response.body}"

	end
end
