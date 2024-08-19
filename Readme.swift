
# SwiftUI OTP Field

A customizable OTP (One-Time Password) input field component for SwiftUI applications. Supports variable lengths and styles.

## Features

- Supports any number of OTP fields.
- Customizable styles: rounded background or bottom underline.
- Customizable colors for active/inactive states and background.
- Automatically manages focus between fields.
- Easy integration with SwiftUI projects.

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/pgupta4896/MyOTPField.git", from: "1.0.0")
]

how to Use 

 VStack {
            OtpFormFieldView(
                otpCode: $otpCode,
                numberOfFields: 6,
                otpFieldType: .bottomUnderline,
                activeBorderColor: .blue,
                inactiveBorderColor: .gray,
                backgroundColor: .clear
            )
            .padding()
            
            Button(action: {
                print("Entered OTP Code: \(otpCode)")
            }) {
                Text("Verify")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }


