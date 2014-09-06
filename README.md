# hubot-rot13

A Hubot script that rotates by 13 places

![](http://img.f.hatena.ne.jp/images/fotolife/b/bouzuya/20140906/20140906182134.gif)

## Installation

    $ npm install git://github.com/bouzuya/hubot-rot13.git

or

    $ # TAG is the package version you need.
    $ npm install 'git://github.com/bouzuya/hubot-rot13.git#TAG'

## Example

    bouzuya> hubot help rot13
      hubot> hubot rot13 - rotate by 13 places

    bouzuya> hubot rot13 hello
      hubot> uryyb

## Configuration

See [`src/scripts/rot13.coffee`](src/scripts/rot13.coffee).

## Development

`npm run`

## License

[MIT](LICENSE)

## Author

[bouzuya][user] &lt;[m@bouzuya.net][mail]&gt; ([http://bouzuya.net][url])

## Badges

[![Build Status][travis-badge]][travis]
[![Dependencies status][david-dm-badge]][david-dm]
[![Coverage Status][coveralls-badge]][coveralls]

[travis]: https://travis-ci.org/bouzuya/hubot-rot13
[travis-badge]: https://travis-ci.org/bouzuya/hubot-rot13.svg?branch=master
[david-dm]: https://david-dm.org/bouzuya/hubot-rot13
[david-dm-badge]: https://david-dm.org/bouzuya/hubot-rot13.png
[coveralls]: https://coveralls.io/r/bouzuya/hubot-rot13
[coveralls-badge]: https://img.shields.io/coveralls/bouzuya/hubot-rot13.svg
[user]: https://github.com/bouzuya
[mail]: mailto:m@bouzuya.net
[url]: http://bouzuya.net
