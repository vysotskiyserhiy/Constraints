# Constraints

[![Version](https://img.shields.io/cocoapods/v/Constraints.svg?style=flat)](http://cocoapods.org/pods/Constraints)
[![License](https://img.shields.io/cocoapods/l/Constraints.svg?style=flat)](http://cocoapods.org/pods/Constraints)
[![Platform](https://img.shields.io/cocoapods/p/Constraints.svg?style=flat)](http://cocoapods.org/pods/Constraints)

## Example

```swift
func constraint() {

    let backgroundView = UIView()
    backgroundView.backgroundColor = .lightGray
        
    // constraint
        
    backgroundView.constraint(on: view)
        .pin()
    .activate()
                
}
```

## Installation

Constraints is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Constraints'
```

## Author

Serhiy Vysotskiy

## License

Constraints is available under the MIT license. See the LICENSE file for more info.
