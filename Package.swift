// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Log",
    products: [
      .library(name: "Log", targets: ["Log"])
    ],
    dependencies: [],
    targets: [
      .target(name: "Log", dependencies: [])
    ]
)
