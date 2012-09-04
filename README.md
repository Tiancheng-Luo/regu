# Regu

Regu is a fun experiment to see if it's viable to make a extremely fast, limited-power regular expression engine for Ruby backed by DFAs.

## Features

- Kleene star: `(regexp)*`
- Plus operator: `(regexp)+`
- Optional operator: `(regex)?`
- Fixed repetition: `(regex){3}`
- Range repetition: `(regex){2,5}`
- Union: `reg1 | reg2`
- Concat: `abc(d|e|f)`
- Wildcard: `Hello .orld`
- Escaping: `\{ \( \[`
- Character classes: `[^abc]`

## Usage

Add the gem to your Gemfile.

    gem 'regu'

Require it.

    require 'regu'
    
Use it.

    /some_regex/.regu
    
or

    Regu['Hello (World|Eli)']

## Limitations

DFA-based regular expression engines can't really handle lookahead or captures. So, Regu should be used strictly to see if something matches a particular format.

Also, right now, DFA construction is painfully slow.

## Performance

From the benchmarks.rb file, we get:

                  user     system      total        real
    native   83.180000   0.210000  83.390000 ( 89.411250)
    regu-c    0.010000   0.000000   0.010000 (  0.005479)
    regu-rb   0.060000   0.000000   0.060000 (  0.064115)

    C-ext Regu is 16317.899443 times faster than native
     Ruby Regu is 1394.543932 times faster than native

We're pretty quick. 

## To-Do

*Lazy defaults.* Hijack `Regex#match` and use Regu if it makes sense, but if a method is called on some `MatchData` object
that we should return, then go back and use Ruby's `Regexp`. This really only makes sense if we can figure out the context. Since
construction for us is so expensive and such, maybe we should only do this if the regexp is frozen or something to indicate that
that it's initialized ahead-of-time.

*Better test data*. Can we find real world examples where Regu smokes the competition?

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Add comprehensive specs
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
