# RubyCellsynt

RubyCellsynt allows you to easily use Cellsynt's SMS API from within your Ruby / Rails app.

### Examples

```ruby
    RubyCellsynt.send_message(
        phone_numbers: ["00467357XXXX", ... more numbers here ],
        from_name: "MrSender",
        text: "Hello World!",
    )
```

### Configure

Make sure to set the ```CELLSYNT_USERNAME``` and ```CELLSYNT_PASSWORD``` environment variables to your API username and password OR you can pass the ```username``` or ```password``` parameter to ```send_message``` above.

### Detailed information

```send_message``` accepts all the following parameters:

* ```phone_numbers``` -- array of phone numbers in the 00 country code and then the rest of the number format.
* ```from_name``` -- textual from name, for example company name. only A-Z a-z and digits and up to 11 characters allowed here.
* ```text``` -- actual text string to send

... more to follow
