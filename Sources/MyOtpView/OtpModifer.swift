//
//  OTPTextView.swift
//  OTP
//
//  Created by prakhar.unofficial on 18/08/24.
//

public enum OtpFieldType {
    case roundedWithBackground
    case bottomUnderline
}


import SwiftUI
import Combine

public struct OtpModifier: ViewModifier {
    @Binding var text: String
    var otpFieldType: OtpFieldType
    var textLimit: Int
    var activeBorderColor: Color
    var inactiveBorderColor: Color
    var backgroundColor: Color
    
    public func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .onReceive(Just(text)) { _ in limitText(textLimit) }
            .frame(width: 45, height: 45)
            .background(background)
            .overlay(border)
    }
    
    private var background: some View {
        switch otpFieldType {
        case .roundedWithBackground:
            return AnyView(backgroundColor.cornerRadius(5))
        case .bottomUnderline:
            return AnyView(
                VStack {
                    Spacer()
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(activeBorderColor)
                }
            )
        }
    }
    
    private var border: some View {
        RoundedRectangle(cornerRadius: 5)
            .stroke(text.isEmpty ? inactiveBorderColor : activeBorderColor, lineWidth: 2)
    }
    
    private func limitText(_ upper: Int) {
        if text.count > upper {
            text = String(text.prefix(upper))
        }
    }
}
