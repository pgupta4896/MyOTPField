//
//  OTPTextView.swift
//  OTP
//
//  Created by prakhar.unofficial on 18/08/24.
//

import SwiftUI
import Combine

public enum OtpFieldType {
    case roundedWithBackground
    case bottomUnderline
    case passcode
}

@available(iOS 15.0, *)
public struct OtpModifier: ViewModifier {
    @Binding var text: String
    var otpFieldType: OtpFieldType
    var textLimit: Int
    var activeBorderColor: Color
    var inactiveBorderColor: Color
    var backgroundColor: Color
    let height: CGFloat
    let width: CGFloat
    let cornerRadius: CGFloat
    
    public func body(content: Content) -> some View {
        switch otpFieldType {
        case .roundedWithBackground:
            content
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .onReceive(Just(text)) { _ in limitText(textLimit) }
                .frame(width: width, height: height)
                .background(backgroundColor.cornerRadius(cornerRadius))
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(text.isEmpty ? inactiveBorderColor : activeBorderColor, lineWidth: (height * 4)/100)
                )
        case .bottomUnderline:
            content
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .onReceive(Just(text)) { _ in limitText(textLimit) }
                .frame(width: width, height: height)
                .background(
                    VStack {
                        Spacer()
                        Rectangle()
                            .frame(width: width, height: (height * 4)/100)
                            .background(backgroundColor)
                    }
                )
            
        case .passcode:
            content
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .onReceive(Just(text)) { _ in limitText(textLimit) }
                .frame(width: width, height: height)
                .background(backgroundColor)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(inactiveBorderColor, lineWidth: (height * 4)/100)
                )
                .overlay(
                    VStack{
                        
                    }
                        .frame(width: width, height: height) // Adjusted to match the content frame size
                        .background(text.isEmpty ? Color.white : activeBorderColor)
                        .cornerRadius(width / 2)
                )
        }
    }
    
    private func limitText(_ upper: Int) {
        if text.count > upper {
            text = String(text.prefix(upper))
        }
    }
    
}
