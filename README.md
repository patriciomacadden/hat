# HAT

[Hobbit](https://github.com/patriciomacadden/hobbit) Application Template.

## Installation

* Clone the repository:

```bash
$ git clone git@github.com:patriciomacadden/hat.git
```

* Create a git repository and change the `origin`:

```bash
$ git remote rm origin
$ git remote add origin <YOUR_GIT_REPOSITORY>
```

* Change the application name (and commit the change):

```bash
$ APP_NAME=AwesomeApp; for i in `find . -type f | grep -v .git`; do if [ `grep HAT $i | wc -l` != 0 ]; then sed -i '' "s/HAT/$APP_NAME/g" $i; fi; done; git commit -am "HAT => $APP_NAME"
```

**Note**: Note the `APP_NAME` variable. You should change the application name
there.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

See the [LICENSE](https://github.com/patriciomacadden/hat/blob/master/LICENSE).