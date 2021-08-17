# ser

a simple http server as replacement of python -m http.server

## Installation

## Usage

```
$ ser -h
ser is a simple http server.

    -v, --version                    Show version
    -h, --help                       Show help
    -p PORT, --port=PORT             On port
    -a ADDR, --address=ADDR          On ip address

examples:
ser
ser .
serve . directory using port 8080
ser -p 8088
serve . directory using port 8088
ser ..
serve .. directory using port 8080
ser -p 8088 ..
serve .. directory using port 8088
ser -addr 0.0.0.0 -p 9999
serve . directory using address 0.0.0.0:9999
```

## Contributing

1. Fork it (<https://github.com/your-github-user/ser/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [zhuzhenfeng.code](https://github.com/your-github-user) - creator and maintainer
