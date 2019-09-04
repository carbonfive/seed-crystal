# seed-crystal

An opinionated workstation configuration tool -- go from zero to productive

## Installation

```sh
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/carbonfive/seed-crystal/master/seed-workstation.sh)"

```

## Core Values

1. Standard toolsets make it easier for contributors to roll onto a project. What you do on your personal projects is your business, but we are in the business of delivering value to our clients. There shall be no `vim`/`emacs` wars.

2. Default configurations unless there is a really good reason not to follow it. 

3. Up and running *fast*.

4. If something is important enough to include, but you can't find unanimous agreement, pick something, anything and commit. Nobody dies because of a linter configuration choice. We can always come back and make it better.

5. Document rationale if at all possible.

## Realities

- This script is probably run once per project _at best_. Worst case, it is done on your first day at work, and not again until your hardware is repurposed for someone else.

- It's hard to test perfectly: Wipe the laptop. Reinstall the OS. Run the script.

- Our world is broken up into smaller core competencies: RoR, React, Mobile, Elixir, Go. No one person will be an expert on all of these toolchains. Provide low-ceremony, low friction tools to help the experts decide what's important.

## Testing

- `brew install shellcheck`
- `rake` or `rake test`

## Tooling

### Core

- [CircleCI](https://circleci.com) - Continuous integration testing
- [Docker](https://docker.com) - Containerization
- [GitHub](https://github.com) - Code repository, change management
- [Homebrew](https://brew.sh) - macOS package manager
- [node](https://node.org) - JavaScript Runtime Engine (based on Chrome V8)
- [postgresql](https://postgresql.org) - Relational Database
- [redis](https://redis.org) - Key/Value Store
- [ruby](https://ruby-lang.org) - Dynamic programming language
- [Visual Studio Code](https://code.visualstudio.com) - Integrated development environment for many languages and platforms with many plugins
- [yarn](https://yarnpkg.com) - JavaScript dependency management (~~~npm~~~)
- [zsh](https://zsh.sourceforge.net) - Interactive terminal shell with many plugins

### Mobile

- [Android Studio](https://developer.android.com/studio) - Android's IDE, built on the Eclipse IDE
- [appium](https://appium.io) - Mobile platform test automation framework. "Capybara, but for phones"
- [OpenJDK8](https://openjdk.java.net/projects/jdk8/) - Required by Android, abandoned by Oracle
- [React Native](https://facebook.github.io/react-native/) Native apps for Android and iOS using React
- [swift](https://developer.apple.com/swift/) - Apple's purpose built language for iOS development
- [xcode](https://developer.apple.com/xcode/) - Apple's IDE for macOS and iOS

### Web

- [Jest](https://jestjs.io) - JavaScript testing (~~~jasmine~~~)
- [Phoenix on Elixir](https://phoenixframework.org/) - Web framework built on Elixir
- [ReactJS](https://reactjs.org) - User interface framework
- [RSpec](https://rspec.info) - Ruby testing
- [Ruby on Rails](https://rubyonrails.org) - Web framework built on Ruby

### Go

- TBD

## Productivity

- [Caffeine](http://lightheadsw.com/caffeine/) - Prevent your Mac from falling asleep
- [Divvy](https://mizage.com/divvy/) - Window management
- [Flycut](https://github.com/TermiT/Flycut) - Clipboard manager
- [Muzzle](https://muzzleapp.com) - Silence notifications when screensharing
- [Time Out](https://www.dejal.com/timeout/) - Tool to remind you to take breaks