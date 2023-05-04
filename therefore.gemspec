require_relative 'lib/therefore/version'

Gem::Specification.new do |spec|
  spec.name = 'therefore'
  spec.version = Therefore::VERSION
  spec.authors = ['Moku S.r.l.', 'Riccardo Agatea']
  spec.email = ['info@moku.io']
  spec.license = 'MIT'

  spec.summary = 'A simple wrapper for if conditionals, what each is for while loops.'
  spec.description = "Just like each, therefore relies on block semantics, so it's essentially an if " \
                     'conditional with a scope, a closure, and the ability to be chained with other methods.'
  spec.homepage = 'https://github.com/moku-io/therefore'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/moku-io/therefore'
  spec.metadata['changelog_uri'] = 'https://github.com/moku-io/therefore/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir __dir__ do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
