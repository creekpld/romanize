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
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "RomanizeTests",
            dependencies: ["Romanize"],
            path: "Tests"),
    ]
)
