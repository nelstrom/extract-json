# Convert CSV to JSON

This repo contains a script that converts a data source in CSV format to JSON.

Clone the repository, then switch to the directory containing this source code and run:

    bundle install

That will install the `smarter_csv` gem.

Now you can generate the JSON files by running:

    bundle exect ruby convert.rb

Now you should find `00N.json` files in the `data/` directory.
