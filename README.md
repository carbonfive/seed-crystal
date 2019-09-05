# Seed::Crystal

An opinionated workstation configuration tool -- From zero to productive

[![CircleCI](https://circleci.com/gh/carbonfive/seed-crystal/tree/master.svg?style=svg)](https://circleci.com/gh/carbonfive/seed-crystal/tree/master)

## Installation

```sh
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/carbonfive/seed-crystal/master/bootstrap.sh)"
```

## Updates

```sh
cd ~/Documents/seed-crystal
git pull
sh bin/workstation-setup.sh
```

## Opt-ins

The base install is just enough to get you productive without too much ceremony, but what if you want to mobile work?

```sh
cd ~/Documents/seed-crystal
sh bin/mobile-setup.sh
```

## Core Values

1. Standard toolsets make it easier for contributors to roll onto a project. What you do on your personal projects is your business, but we are in the business of delivering value to our clients. There shall be no `vim`/`emacs` wars.

2. Default configurations unless there is a really good reason not to follow it. 

3. Up and running *fast*.

4. If something is important enough to include, but you can't find unanimous agreement, pick something, anything and commit. Nobody dies because of a linter configuration choice. We can always come back and make it better.

5. Document rationale if at all possible. Document in `code` if at all possible.

6. Idempotent. At least non-destructive.

## Realities

- This script is probably run once per project _at best_. Worst case, it is done on your first day at work, and not again until your hardware is repurposed for someone else.

- It's hard to test perfectly: Wipe the laptop. Reinstall the OS. Run the script.

- Our world is broken up into somewhat orthogonal core competencies: RoR, React, Mobile, Elixir, Go. No one person will be an expert on all of these toolchains. Provide low-ceremony, low friction tools to help the experts decide what's important.

## Tooling

### Core

- [Homebrew](https://brew.sh) - macOS package manager
- [CircleCI](https://circleci.com) - Enables you to reproduce the CircleCI environment locally
- [Divvy](https://mizage.com/divvy/) - Window manager
- [Docker](https://docker.com) - Docker Community Edition (.app)
- [Flycut](https://github.com/TermiT/Flycut) - Clipboard manager
- [Hub](https://github.com/github/hub) - Add GitHub support to git on the command-line
- [KeepingYouAwake](https://github.com/newmarcel/KeepingYouAwake/) - Prevents your Mac from going to sleep.
- [Muzzle](https://muzzleapp.com) - -Silence notifications when screen sharing
- [Notion](https://www.notion.so/product) Our corporate notebook of memories
- [postgresql](https://postgresql.org) - Object-relational database system
- [redis](https://redis.org) - Persistent key-value database, with built-in net interface
- [Slack](https://slack.com) - Chit chat on the internets
- [Time Out](https://www.dejal.com/timeout/) - Remind yourself to take a break
- [yarn](https://yarnpkg.com) - JavaScript package manager
- [Yet Another Dotfiles Manager](https://yadm.io)
- [zsh](https://zsh.sourceforge.net) - UNIX shell (command interpreter)


### Mobile

- [AdoptOpenJDK 8](https://openjdk.java.net/projects/jdk8/) - Open source replace for Java8 (for Android)
- [Android Studio](https://developer.android.com/studio) - Android's IDE, built on the Eclipse IDE


---

## Seed::Crystal Development

After checking out the repo, run `bin/setup` to install dependencies.

## Testing

- `bin/setup`
- `rake test`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/carbonfive/seed-crystal. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Seed::Crystal project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/carbonfive/seed-crystal/blob/master/CODE_OF_CONDUCT.md).

## Inspirations

- https://github.com/thoughtbot/laptop
- https://github.com/pivotal/workstation-setup
- https://github.com/pivotal-sprout/sprout-wrap
- https://github.com/splith/macOS
- https://github.com/robbyrussell/oh-my-zsh
- ... and many many others ...