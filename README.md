# Therefore

A simple wrapper for `if` conditionals, what `each` is for `while` loops.

Just like `each`, `therefore` relies on block semantics, so it's essentially an `if` conditional with a scope, a closure, and the ability to be chained with other methods.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'therefore', '~> 1.0'
```

And then execute:

```bash
$ bundle
```

Or you can install the gem on its own:

```bash
gem install therefore
```

## Usage

`obj.therefore {...}` will invoke the block, yielding `obj` to it, unless `obj` is either `nil` or `false`. If the block is invoked its result is returned, otherwise `obj` is returned:

```ruby
def find_user input: {}
  input[:id].therefore do |user_id|
    User.find user_id
  end
end

find_user input: {id: 1} # => #<User id: 1, ...>
find_user input: {id: nil} # => nil
```

`obj.otherwise {...}` behaves symmetrically to `therefore`: it only invokes the block, again yielding `obj`, if `obj` is either `false` or `nil`. Again, if the block is invoked its result is returned, otherwise `obj` is returned. If you chain it with `therefore`, it can work as an `else` branch:

```ruby
def find_user input: {}
  input[:id].therefore do |user_id|
    User.find user_id
  end.otherwise do
    User.default
  end
end

find_user input: {id: 1} # => #<User id: 1, ...>
find_user input: {id: nil} # => #<User default: true, ...>
```

You can also invoke `otherwise` with a parameter, in which case it works as an `elsif` branch:

```ruby
obj.otherwise(other_obj) do |var|
  ...
end
```

is equivalent to

```ruby
obj.otherwise do
  other_obj.therefore do |var|
    ...
  end
end
```

Both `therefore` and `otherwise` can be called without a block, in which case they return an enumerator. If the block would have been invoked the enumerator contains `obj`, otherwise it is empty:

```ruby
nil.therefore.to_a # => []
nil.otherwise.to_a # => [nil]
'string'.therefore.to_a # => ['string']
'string'.otherwise.to_a # => []
```

## Version numbers

Therefore loosely follows [Semantic Versioning](https://semver.org/), with a hard guarantee that breaking changes to the public API will always coincide with an increase to the `MAJOR` number.

Version numbers are in three parts: `MAJOR.MINOR.PATCH`.

- Breaking changes to the public API increment the `MAJOR`. There may also be changes that would otherwise increase the `MINOR` or the `PATCH`.
- Additions, deprecations, and "big" non breaking changes to the public API increment the `MINOR`. There may also be changes that would otherwise increase the `PATCH`.
- Bug fixes and "small" non breaking changes to the public API increment the `PATCH`.

Notice that any feature deprecated by a minor release can be expected to be removed by the next major release.

## Changelog

Full list of changes in [CHANGELOG.md](CHANGELOG.md)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/moku-io/therefore.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
