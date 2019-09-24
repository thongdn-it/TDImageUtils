# TDImageUtils

<!-- [![CI Status](https://img.shields.io/travis/Thong Dang/TDImageUtils.svg?style=flat)](https://travis-ci.org/Thong Dang/TDImageUtils) -->

[![Version](https://img.shields.io/cocoapods/v/TDImageUtils.svg?style=flat)](https://cocoapods.org/pods/TDImageUtils)
[![License](https://img.shields.io/cocoapods/l/TDImageUtils.svg?style=flat)](https://cocoapods.org/pods/TDImageUtils)
[![Platform](https://img.shields.io/cocoapods/p/TDImageUtils.svg?style=flat)](https://cocoapods.org/pods/TDImageUtils)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TDImageUtils is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TDImageUtils'
```

## Usage

```swift
import TDImageUtils
```

```swift
let originImage = UIImage(named: "4k")
```

### Resize

```swift
let imageResized = originImage?.resize(persent: 50)

let imageResized = originImage?.resize(width: 200, height: 100)

let imageResized = originImage?.resize(size: CGSize(width: 200, height: 100))
```

### Compress

```swift
let imageCompress = originImage?.compress()

let imageCompress = originImage?.compress(maxSize: 3)
```

## Author

Thong Dang, thongdn.it@gmail.com

## License

TDImageUtils is available under the MIT license. See the LICENSE file for more info.
