# Romanize

Romanizes a String of Hangul Characters

This is the swift library written in swift version 3.

## Installation

Install it with the Swift Package Manager.

``` swift
import PackageDescription

let package = Package(
    name: "YourApp",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/creekpld/romanize.git", majorVersion: 1),
    ]
)
```

## Usage

or
``` swift
romanize(안녕 하세요) // --> annyeong haseyo
```

``` swift
romanize(안녕 하세요, true) // --> an-nyeong ha-se-yo
```

## Other Implementations

- [kroman](https://github.com/cheunghy/kroman)

## License

Kroman is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).