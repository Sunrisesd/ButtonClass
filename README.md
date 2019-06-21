## 关于

- Button扩展类，用于扩大按钮响应范围

## 需求

- iOS 8.0+
- Xcode 9.0+
- Swift 4.0+

## 安装

### CocoaPods

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
pod 'ButtonClass'
end
```
## 用法

```swift
import ButtonClass

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton.init(type: .custom)
        
        // 方式一，四周同时扩大20个单位
        button.setEnLargeEdge(20)

        // 方式二，四周同时扩大不同的值
        button.setEnLargeEdge(10, 5, 10, 5)
    }

}
```

