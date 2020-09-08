# Home Library

Library Logbook is a web application for keeping track of what books you own, which ones you've read, and for taking notes on them.

You can visit the public version of this app [here](insertlink)

## Installation

To install this app locally, clone this repo and run 

```bash
$ rake db:migrate
```
and
```bash
$ rake db:seed
```

You will need to set up a SESSION_SECRET. You can do this by opening IRB and running...

```bash
$ require 'securerandom'
$ SecureRandom.hex(64)
```
## Contributing
Feel free to submit pull requests as you see fit.

## License
[MIT](https://choosealicense.com/licenses/mit/)
