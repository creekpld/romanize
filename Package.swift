// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Romanize",
    products: [
        .library(name: "Romanize", targets: ["Romanize"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Romanize",
            dependencies: []),
        .testTarget(
            name: "RomanizeTests",
            dependencies: ["Romanize"]),
    ]
)
