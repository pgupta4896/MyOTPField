// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyOtpView",
    platforms: [
        .iOS(.v13), // Specify the minimum iOS version required for your package
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MyOtpView",
            targets: ["MyOtpView"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // Add any dependencies here if needed, for example:
        // .package(url: "https://github.com/another/package.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MyOtpView",
            dependencies: [],
            path: "Sources/MyOtpView"
        ),
        .testTarget(
            name: "MyOtpViewTests",
            dependencies: ["MyOtpView"],
            path: "Tests/MyOtpViewTests"
        ),
    ]
)
