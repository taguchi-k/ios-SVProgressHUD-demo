# ios-SVProgressHUD-demo
iOS SVProgressHUDを利用したサンプル

## 1. PodFile

```
pod 'SVProgressHUD', '2.1.2'
```

## 2. import する

```swift
import SVProgressHUD
```

```objectivec
#import "SVProgressHUD.h"
```

## 3. SVProgressHUD を使う
### インジケータを表示する

```swift
SVProgressHUD.show()
```

```objectivec
[SVProgressHUD show];
```

### インジケータを消去する

```swift
SVProgressHUD.dismiss()
```

```objectivec
[SVProgressHUD dismiss];
```

### ポップアップを表示する


```swift
SVProgressHUD.showInfo(withStatus: "表示する文字列")
```

```objectivec
[SVProgressHUD showInfoWithStatus:@"表示する文字列"];
```
