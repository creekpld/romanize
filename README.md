# Romanize

Romanizes a String of Hangul Characters

This is the swift library written in swift version 4.0

## Features

- [x] fluent API
- [x] fully configurable jamo romanization
- [x] configurable syllable divider
- [x] generate random hangul syllables
- [x] API backwards compatibility

## Installation

Install it with the Swift Package Manager.

``` swift
// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "YourApp",
    products: [
        .executable(name: "YourApp", targets: ["YourApp"]),
    ],
    dependencies: [
        .Package(url: "https://github.com/creekpld/romanize.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "YourApp",
            dependencies: ["Romanize"],
            path: "Sources"),
    ]
)
```

## Usage

or
``` swift
import Romanize

romanize("안녕 하세요") // --> annyeong haseyo
```

``` swift
romanize("안녕 하세요", true) // --> an-nyeong ha-se-yo
```

## Usage with fluent API

``` swift
Romanize()
    // set a custom syllable divider
    .set(divider: "_")
    // customize all jamos and romanization
    .set(headJamo: .ㅁ, romanization: "M")
    .romanize("미안하지만 저는 이 근처 사람이 아니예요", true)

// --> Mi_an_ha_ji_Man jeo_neun i geun_cheo sa_ram_i a_ni_ye_yo
```

## Other Features

``` swift
Romanize()
    // generate 10 random hangul syllables 
    .genHan(10)

// something like this --> 믞쑠졮폦둨햅쵫멫쾜숛
```


## Other Implementations

- [kroman](https://github.com/cheunghy/kroman)

## License

Kroman is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
