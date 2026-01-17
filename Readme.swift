# 🔐 SwiftUI OTP Field

A **customizable One-Time Password (OTP)** input component for **SwiftUI**, designed to be **flexible, lightweight, and effortless** to integrate into any iOS application.

---

## ✨ Key Features

- 🔢 Supports **any number of OTP fields**
- 🎨 Multiple **input styles**:
  - Underline
  - Rounded box
- 🎛 Fully **customizable theme**:
  - Text color
  - Active & inactive border colors
  - Background color
- ⚡ **Automatic focus navigation**
- 🧼 Built-in **clear & validation support**
- 🧩 Seamlessly integrates with **SwiftUI bindings**
- 🛠 Simple setup — **no UIKit required**

---

## 📦 Installation (Swift Package Manager)

You can install it via SPM in two ways:

### **Option 1: Package.swift**

```swift
dependencies: [
    .package(
        url: "https://github.com/pgupta4896/MyOTPField.git",
        from: "1.0.0"
    )
]
```

### **Option 2: Xcode GUI**

1. Open your project in **Xcode**
2. Go to **File > Add Packages…**
3. Enter the URL below:

```
https://github.com/pgupta4896/MyOTPField.git
```
4. Select version & finish

---

## 🚀 Usage Example

Below is a basic usage inside a SwiftUI view:

```swift
import SwiftUI
import MyOTPField

struct ContentView: View {

    @State private var otpCode: String = ""

    var body: some View {
        VStack(spacing: 24) {

            OTPPinFieldView(
                otpCode: $otpCode,
                numberOfFields: 6,
                otpFieldType: .bottomUndeline,
                activeBorderColor: .blue,
                inactiveBorderColor: .gray,
                backgroundColor: .clear
            )
            .padding(.horizontal, 30)

            Button("Verify") {
                print("Entered OTP Code: \(otpCode)")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

        }
        .padding()
    }
}
```

---

## 🧪 Validation Tips

You can validate once user taps button:

```swift
if otpCode.count == 6 {
    // Submit OTP
} else {
    // Show error
}
```

---

## 📝 Requirements

- iOS 14.0+
- Swift 5.5+
- Xcode 13+

---

## 📁 Repository

Source code is available at:

🡆 **GitHub:** https://github.com/pgupt4896/MyOTPField

---

## ❤️ Contributions

Contributions are welcome! Feel free to open an issue or PR on GitHub.

---

## 📄 License

This project is available under the MIT License.

